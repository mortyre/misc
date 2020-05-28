import request

import json
import boto3

def lambda_handler(event, context):

    arn="arn:aws:sns:eu-central-1:633944440063:test_hook"
    instance_region = event['region']
    instance_id = event['detail']['EC2InstanceId']

    instance = boto3.client('ec2', region_name=instance_region)
    private_dns = instance.describe_instances(
        InstanceIds=[instance_id]
        )['Reservations'][0]['Instances'][0]['PrivateDnsName']
    asg_name = event['detail']['AutoScalingGroupName']

    response = requests.get('http://' + private_dns + ':8080/status')

    message = {"asg_name": asg_name, "private_dns": private_dns, "instance_region": instance_region, "instance_id": instance_id, "response": response.content}
    sns = boto3.client('sns')
    response = sns.publish(
        TargetArn=arn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
        )
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
    print(response)
