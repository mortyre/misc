import boto3
from pprint import pprint

client = boto3.client('ec2')
client_elbv2 = boto3.client('elbv2')
client_elb = boto3.client('elb')

DEBUG = 1
MaxResults = 100

def print_log(*s):
    if DEBUG == 1:
        print(s)

def get_ids():
    ids = []
    for i in range(len(client.describe_instances(MaxResults=MaxResults)['Reservations'])):
        ids.append(client.describe_instances(MaxResults=MaxResults)['Reservations'][i]['Instances'][0]['InstanceId'])
    return ids

def get_lb_ids():
    ids = []
    for j in range(len(client_elbv2.describe_load_balancers(PageSize=MaxResults)['LoadBalancers'])):
        ids.append(client_elbv2.describe_load_balancers(PageSize=MaxResults)['LoadBalancers'][j]['LoadBalancerArn'])
        #.split("/")[-3:])
    for i in range(len(client_elb.describe_load_balancers()['LoadBalancerDescriptions'])):
        ids.append(client_elb.describe_load_balancers()['LoadBalancerDescriptions'][i]['LoadBalancerName'])
    return ids

def get_tags(id):
    if id[:2] == "i-":
        tags = client.describe_instances(
            InstanceIds=[id]
                )['Reservations'][0]['Instances'][0]['Tags']
    elif id[:3] == "arn":
        tags = client_elbv2.describe_tags(
            ResourceArns=[id]
        )['TagDescriptions'][0]['Tags']
    else:
        tags = client_elb.describe_tags(
            LoadBalancerNames=[id]
                )['TagDescriptions'][0]['Tags']
    return tags

def get_netId(id):
    netId = []
    for i in range(len(client.describe_instances(
        InstanceIds=[id]
        )['Reservations'][0]['Instances'][0]['NetworkInterfaces'])):
        netId.append(client.describe_instances(
            InstanceIds=[id]
        )['Reservations'][0]['Instances'][0]['NetworkInterfaces'][i]['NetworkInterfaceId'])
    return netId

def get_lb_net_id(id):
    netId = []
    for i in range(len(client.describe_network_interfaces(Filters=[{'Name':'description', 'Values': [id]}])['NetworkInterfaces'])):
        netId.append(client.describe_network_interfaces(Filters=[{'Name':'description', 'Values': [id]}])['NetworkInterfaces'][i]['NetworkInterfaceId'])
    return netId

def crt_tag_net(netId, key, value):
    ec2 = boto3.resource('ec2')
    network_interface = ec2.NetworkInterface(netId)
    network_interface.create_tags(Tags = [{'Key': key, 'Value': value}])
    print_log("Create tags dict - Key: "+ key + " Value: "+ value + " on the netInterface " + netId)

for id in get_ids():
    print_log("Instance ID: " + id)
    tags = get_tags(id)
    print_log("Instance tags: ", tags)
    for netId in get_netId(id):
        print_log("Instance NetworkId: " + netId)
        for i in tags:
            key = i['Key']
            if key[:3] == "aws":
                continue
            value = i['Value']
            crt_tag_net(netId, key, value)
for id in get_lb_ids():
    if id[:3] == "arn":
        print_log("ELB ID is: " + id)
        tags = get_tags(id)
        print_log("ELB tags: ", tags)
        print_log("ELB: " + "ELB " + '/'.join(id.split("/")[-3:]))
        id = "ELB " + '/'.join(id.split("/")[-3:])
        for netId in get_lb_net_id(id):
            print_log("ELB NetworkId: " + netId)
            for i in tags:
                key = i['Key']
                if key[:3] == "aws":
                    continue
                value = i['Value']
                crt_tag_net(netId, key, value)
    else:
        print_log("ELB ID is: " + id)
        tags = get_tags(id)
        print_log("ELB tags: ", tags)
        id = "ELB " + id
        for netId in get_lb_net_id(id):
            print_log("ELB NetworkId: " + netId)
            for i in tags:
                key = i['Key']
                if key[:3] == "aws":
                    continue
                value = i['Value']
                crt_tag_net(netId, key, value)
