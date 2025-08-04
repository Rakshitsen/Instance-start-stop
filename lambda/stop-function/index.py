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
            stop_response = ec2.stop_instances(InstanceIds=active_instance_ids, DryRun=False)
            print(f"Successfully initiated stop for instances: {active_instance_ids}")
            # You can print more details from stop_response if needed
        except Exception as e:
            print(f"Error stopping instances: {e}")
    else:
        print("No running instances with tag 'MyInstance' found to stop.")