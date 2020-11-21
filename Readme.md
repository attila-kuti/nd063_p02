Project 02 - Attila Kuti
=================================

This READ ME file simply shows the results and adds some comments.


### Improvements driven by Review Comments
1. Task5: EC2 instances were renamed. Terraform_1_1/2.png updated
2. Task5: Lambda variables have always been used, (in lambda module, although not outsourced in variables.tf... there were only 5 of them. Now outsourced.)



# Task 1 Social Media application for 50K
## Part 1 - Diagram with Servers:

![Diagram1](Task1-2/p02_task1_akuti_20201107.png)

## Part 2 - Diagram with Serverless solution:

![Diagram1](Task1-2/p02_task2_akuti_20201107.png)

# Task 2 Cost Estimates for Social Media Infra

## Initial Cost estimate
(csv file also attached)

```
Group hierarchy,Region,Description,Service,Upfront,Monthly,First 12 months total,Currency,Configuration summary
My Estimate,US East (N. Virginia),,Amazon EC2,0,9473.85,113686.20,USD,"Operating system (Linux), Quantity (450), Pricing strategy (EC2 Instance Savings Plans 1 Year No Upfront), Storage for each EC2 instance (General Purpose SSD (gp2)), Storage amount (20 GB), Instance type (t3.medium)"
My Estimate,US East (N. Virginia),,S3 Standard,0,109.54,1314.48,USD,S3 Standard storage (800 GB per month)
My Estimate,US East (N. Virginia),,Data Transfer,0,92.07,1104.84,USD,"DT Inbound: Not selected (0 TB per month) 
, DT Outbound: Internet (1 TB per month) 
, Data transfer cost (92.07)"
My Estimate,US East (N. Virginia),,Amazon Virtual Private Cloud (VPC),0,78.93,947.16,USD,Number of NAT Gateways (1)
My Estimate,US East (N. Virginia),,Elastic Load Balancing,0,873.8100000000001,10485.72,USD,Number of Application Load Balancers (2)
My Estimate,US East (N. Virginia),,Amazon RDS for MySQL,0,185.49200000000002,2225.90,USD,"Quantity (2), Pricing strategy (Standard Reserved Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (199 GB), Instance type (db.t3.large)"



Acknowledgement
"* AWS Pricing Calculator provides only an estimate of your AWS fees and doesn't include any taxes that might apply. Your actual fees depend on a variety of factors, including your actual usage of AWS services."


```

## Reduced Cost estimate
(csv file also attached)

```
Group hierarchy,Region,Description,Service,Upfront,Monthly,First 12 months total,Currency,Configuration summary
My Estimate,US East (N. Virginia),,Amazon EC2,0,5052.72,60632.64,USD,"Operating system (Linux), Quantity (240), Pricing strategy (EC2 Instance Savings Plans 1 Year No Upfront), Storage for each EC2 instance (General Purpose SSD (gp2)), Storage amount (20 GB), Instance type (t3.medium)"
My Estimate,US East (N. Virginia),,S3 Standard,0,109.54,1314.48,USD,S3 Standard storage (800 GB per month)
My Estimate,US East (N. Virginia),,Data Transfer,0,92.07,1104.84,USD,"DT Inbound: Not selected (0 TB per month) 
, DT Outbound: Internet (1 TB per month) 
, Data transfer cost (92.07)"
My Estimate,US East (N. Virginia),,Amazon Virtual Private Cloud (VPC),0,78.93,947.16,USD,Number of NAT Gateways (1)
My Estimate,US East (N. Virginia),,Elastic Load Balancing,0,873.81,10485.72,USD,Number of Application Load Balancers (2)
My Estimate,US East (N. Virginia),,Amazon RDS for MySQL,0,185.492,2225.9,USD,"Quantity (2), Pricing strategy (Standard Reserved Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (199 GB), Instance type (db.t3.large)"
,,,,,,,,
,,,,,,,,
,,,,,,,,
Acknowledgement,,,,,,,,
"* AWS Pricing Calculator provides only an estimate of your AWS fees and doesn't include any taxes that might apply. Your actual fees depend on a variety of factors, including your actual usage of AWS services.",,,,,,,,
,,,,,,,,
"CHANGE made: Number of EC2 instances were moved down (maximized) in 240 -> might be improper estimate to meet the user requirements. Possibly higher response times, more CPU usage, EVEN higher costs because of different CPU credit usage! (max 40% CPU usage was planned with 450 instances..)",,,,,,,,

```

## Increased Cost estimate
(csv file also attached)

```
Group hierarchy,Region,Description,Service,Upfront,Monthly,First 12 months total,Currency,Configuration summary
My Estimate,US East (N. Virginia),,Amazon EC2,0,12631.8,151581.6,USD,"Operating system (Linux), Quantity (600), Pricing strategy (EC2 Instance Savings Plans 1 Year No Upfront), Storage for each EC2 instance (General Purpose SSD (gp2)), Storage amount (20 GB), Instance type (t3.medium)"
My Estimate,US East (N. Virginia),,S3 Standard,0,109.54,1314.48,USD,S3 Standard storage (800 GB per month)
My Estimate,US East (N. Virginia),,Data Transfer,0,92.07,1104.84,USD,"DT Inbound: Not selected (0 TB per month) 
, DT Outbound: Internet (1 TB per month) 
, Data transfer cost (92.07)"
My Estimate,US East (N. Virginia),,Amazon Virtual Private Cloud (VPC),0,78.93,947.16,USD,Number of NAT Gateways (1)
My Estimate,US East (N. Virginia),,Elastic Load Balancing,0,873.81,10485.72,USD,Number of Application Load Balancers (2)
My Estimate,US East (N. Virginia),,Amazon RDS for MySQL,0,3737.81,44853.72,USD,"Quantity (10), Pricing strategy (Standard Reserved Instances 1 Year No Upfront), Storage for each RDS instance (General Purpose SSD (gp2)), Storage amount (199 GB), Instance type (db.t3.xlarge), Additional backup storage (5 TB)"
,,,,,,,,
,,,,,,,,
,,,,,,,,
Acknowledgement,,,,,,,,
"* AWS Pricing Calculator provides only an estimate of your AWS fees and doesn't include any taxes that might apply. Your actual fees depend on a variety of factors, including your actual usage of AWS services.",,,,,,,,
,,,,,,,,
CHANGE made: ,"Number of EC2 instances increased to 600 to reduce response times, reduce CPU usage.",,,,,,,
CHANGE made: ,"Number of READ replicas increased from 1 to 9 (distributed to both AZ-s) -> better performance, higher availability. ",,,,,,,
CHANGE made: ,Increased server size t3.large -> t3.xlarge (even larger would be fit to budget). Exact requirement details are unknown. Real load testing would help.,,,,,,,
CHANGE made: ,BACKUP storage has been added too!,,,,,,,
,,,,,,,,
QUESTION:,NOT clear if Tx burstable instances and CPU credits may or may not be used by Reservation and/or upfront payments?! Costs could be considerably reduced by them.,,,,,,,

```

# Task 3 Permissions

Password Policy created:

![Password policy](Task3/udacity_password_policy.png)

## CloudTrail users and groups

Users and Groups have been created:

![ReviewersAccountants](Task3/users-and-groups.png)

## Logs for Cloudtrail in CSV {#cloudtrail-log}
![logs](Task3\UdacityCloudTrailLog.csv )


# Task 4 Cost Monitoring {#cost-monitoring}

I could create cost monitoring, but remained in "Insufficient Data" state...

![Monitoring](Task4/Cloudwatch_Alarm.png)


# Task 5 Terraform

## Part 1 EC2 instances

All done: 
Source files provided:
TAGS have been added...

- Task5/Exercise1/main.tf

![EC2-1](Task5/Terraform_1_1.png)


After removing M4 instances (count -> 0)

- Task5/Exercise1/main-to-destroy2_m4.tf

![EC2-1](Task5/Terraform_1_2.png)


## Part 2 Lambda

Lambda function created, but I could not resolve the python function dependencies on os environment variable: greeting
See Terraform source codes in the folder: *Task5/Exercise2*

Lambda function was deployed:

![EC2-1](Task5/lambda_deployed.png)

lambda permission set....
![permissions](Task5\lamba_permissions.png)

Lambda function was invoked with success and also with errors:
![EC2-1](Task5/lambda_monitor.png)

### Logs for lambda {#lambda-logs}
![EC2-1](Task5/Terraform_2_3.png)


# Task 6 Destoying
## EC2 Destroy - Terraform_destroyed.png
![EC2-3](Task6\Terraform_destroyed.png)


```
Plan: 0 to add, 0 to change, 4 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.UdacityT2[3]: Destroying... [id=i-070d49a1f97547be6]
aws_instance.UdacityT2[0]: Destroying... [id=i-0f06ab51c547c4b0a]
aws_instance.UdacityT2[1]: Destroying... [id=i-0e8054251527f7f57]
aws_instance.UdacityT2[2]: Destroying... [id=i-09242b22581d21115]
aws_instance.UdacityT2[2]: Still destroying... [id=i-09242b22581d21115, 10s elapsed]
aws_instance.UdacityT2[3]: Still destroying... [id=i-070d49a1f97547be6, 10s elapsed]
aws_instance.UdacityT2[1]: Still destroying... [id=i-0e8054251527f7f57, 10s elapsed]
aws_instance.UdacityT2[0]: Still destroying... [id=i-0f06ab51c547c4b0a, 10s elapsed]
aws_instance.UdacityT2[3]: Still destroying... [id=i-070d49a1f97547be6, 20s elapsed]
aws_instance.UdacityT2[1]: Still destroying... [id=i-0e8054251527f7f57, 20s elapsed]
aws_instance.UdacityT2[0]: Still destroying... [id=i-0f06ab51c547c4b0a, 20s elapsed]
aws_instance.UdacityT2[2]: Still destroying... [id=i-09242b22581d21115, 20s elapsed]
aws_instance.UdacityT2[0]: Still destroying... [id=i-0f06ab51c547c4b0a, 30s elapsed]
aws_instance.UdacityT2[1]: Still destroying... [id=i-0e8054251527f7f57, 30s elapsed]
aws_instance.UdacityT2[2]: Still destroying... [id=i-09242b22581d21115, 30s elapsed]
aws_instance.UdacityT2[3]: Still destroying... [id=i-070d49a1f97547be6, 30s elapsed]
aws_instance.UdacityT2[3]: Destruction complete after 32s
aws_instance.UdacityT2[2]: Destruction complete after 32s
aws_instance.UdacityT2[1]: Destruction complete after 32s
aws_instance.UdacityT2[0]: Still destroying... [id=i-0f06ab51c547c4b0a, 40s elapsed]
aws_instance.UdacityT2[0]: Still destroying... [id=i-0f06ab51c547c4b0a, 50s elapsed]
aws_instance.UdacityT2[0]: Destruction complete after 53s

Destroy complete! Resources: 4 destroyed.
```


## Lambda Destroy

```
Plan: 0 to add, 0 to change, 4 to destroy.

Changes to Outputs:
  - lambda_name = "greet_lambda" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_role_policy_attachment.lambda_logs: Destroying... [id=iam_role_for_lambda-20201111174403233800000001]
module.lambda.aws_lambda_function.lambda: Destroying... [id=greet_lambda]
aws_iam_role_policy_attachment.lambda_logs: Destruction complete after 1s
aws_iam_policy.lambda_logging: Destroying... [id=arn:aws:iam::941342625553:policy/lambda_logging]
module.lambda.aws_lambda_function.lambda: Destruction complete after 1s
aws_iam_role.iam_role_for_lambda: Destroying... [id=iam_role_for_lambda]
aws_iam_policy.lambda_logging: Destruction complete after 1s
aws_iam_role.iam_role_for_lambda: Destruction complete after 1s

Destroy complete! Resources: 4 destroyed.
```

