#!/usr/local/bin/python3

# Script for checks after deploy
# Using in TeamCity
# Task https://jira.whalekit.ru/browse/DEVOPS-214291

import boto3
import re
from time import sleep
from retry import retry
import sys, getopt
import pdb
import datetime

cluster = "war-dev"
services = "war-dev-cgs"
time = 1

slp = 3
client_ecs = boto3.client('ecs')
client_elbv2 = boto3.client('elbv2')
sleep(slp)
print("wakeup!")

#Get Arn cluster
@retry(tries=time, delay=slp)
def get_info(response):
    return client_ecs.describe_tasks(
            cluster=cluster,
            tasks=[response['taskArns'][0]]
    )

#Get Arn task in container
@retry(tries=time, delay=slp)
def get_image(taskDefinitionArn):
    return client_ecs.describe_task_definition(
            taskDefinition=taskDefinitionArn
    )['taskDefinition']['containerDefinitions'][0]['image']

#Get Arn service in cluster
@retry(tries=time, delay=slp)
def get_info_elbv2(cluster, services):
    try:
        TargetGroupArn = client_ecs.describe_services(
                cluster=cluster,
                services=[services]
                )["services"][0]["loadBalancers"][0]["targetGroupArn"]
        return client_elbv2.describe_target_health(
                TargetGroupArn=TargetGroupArn
                )
    except:
        print("Service " + services + " not found")
        quit(1)

n = 0
#Counter
while n < time:
    print("### Trying #" + str(n+1) + " at " + str(datetime.datetime.now().time()))
    #Get tasks in cluster
    try:
        response = client_ecs.list_tasks(cluster=cluster)
    except:
        print("Cluster " + cluster + " not found")
        quit(1)
    #Quit if task more then one
    if len(response['taskArns']) > 1:
        print("runing more 1 task")
        quit(1)
    print("run while")
    try:
        print(get_info(response)['tasks'][0]['lastStatus'])
        #If status task in container is RUNNING - get Arn taskDefrn and IP container and tag image build
        if get_info(response)['tasks'][0]['lastStatus'] == "RUNNING":
            taskDefinitionArn = get_info(response)['tasks'][0]['taskDefinitionArn']
            privateIpv4Address = get_info(response)['tasks'][0]['containers'][0]['networkInterfaces'][0]['privateIpv4Address']
            print("IP " + str(privateIpv4Address))
            image_build_tag = get_image(taskDefinitionArn).split(':')[1]
            #check tag: no_YMD_HMS (example 298_20190408-154624)
            if re.match('\d+_\d{8}-\d{6}', image_build_tag) is None:
                print("Build tag not valid")
                quit(1)
            print("Build tag is OK " + str(image_build_tag))
            #get id ELB
            info = get_info_elbv2(cluster, services)["TargetHealthDescriptions"][0]['Target']['Id']
            healthy_state = get_info_elbv2(cluster, services)["TargetHealthDescriptions"][0]['TargetHealth']['State']
            print("ID " + str(info))
            #ID ELB and IP match
            if privateIpv4Address == info:
                print("IP and ID match!: " + str(privateIpv4Address) + " " + str(info))
            else:
                n += 1
                if n == time:
                    print("IP and ID not match; quit")
                    quit(1)
                print("IP and ID not match; sleep " + str(slp) + " sec")
                sleep(slp)
                continue
            if healthy_state == 'healthy':
                print("Health State is health")
                n = time
            else:
                n += 1
                if n == time:
                    print("Health State is not health; quit")
                    quit(1)
                print("Health State is not health; sleep " + str(slp) + " sec")
                sleep(slp)
                continue
        else:
            n += 1
            if n == time:
                print("Status task not RUNNING; quit")
                quit(1)
            sleep(slp)
            continue
    except:
        print("Conainer not started; wait " + str(slp) + "s")
        sleep(slp)
        n += 1
        if n == time:
            print("Conainer not started; quit")
            quit(1)
