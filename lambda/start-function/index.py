import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2', region_name='us-east-2')
    response = ec2.describe_instances(
        Filters=[ 
            {
                'Name': 'tag:Environment',
                'Values': ['production']
            }
        ]
    )
    active_instance_ids = []
    if 'Reservations' in response:
        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                active_instance_ids.append(instance['InstanceId'])

    print(f"Active Instance IDs: {active_instance_ids}")
    
    if active_instance_ids: 
        try:
            start_response = ec2.start_instances(InstanceIds=active_instance_ids, DryRun=False)
            print(f"Successfully initiated start for instances: {active_instance_ids}")
        except Exception as e:
            print(f"Error start instances: {e}")
    else:
        print("No stopped instances with tag 'production' found to start.")