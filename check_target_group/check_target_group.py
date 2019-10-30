#!/usr/local/bin/python3 -u

#Script to get ip CGS

import boto3

tg = "war-cgs"

client = boto3.client('elbv2')

response = client.describe_rules(
    ListenerArn='arn:aws:elasticloadbalancing:us-east-1:826187709569:listener/app/war-prod-lb/ba21782bfbabbacd/f65826f4c6d685fd',
)
target_group_arn=response['Rules'][0]['Actions'][0]['TargetGroupArn']

response = client.describe_target_health(
    TargetGroupArn=target_group_arn,
)
for i in response['TargetHealthDescriptions']:
    if (i['TargetHealth']['State'] == 'healthy') or (i['TargetHealth']['State'] == 'initial'):
        print(i['Target']['Id'])
