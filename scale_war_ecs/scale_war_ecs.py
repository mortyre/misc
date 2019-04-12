import boto3
import sys, getopt

client = boto3.client('ecs')
scale = int(sys.argv[1])

clusters = client.list_clusters()['clusterArns']
for cluster in clusters:
    name = cluster.split("/")[-1][:3]
    if name == "war":
        services = client.list_services(cluster=cluster)['serviceArns']
        for service in services:
            print("Cluster: " + cluster + " Service: " + service)
            client.update_service(
                cluster = cluster,
                service = service,
                desiredCount = scale
            )



