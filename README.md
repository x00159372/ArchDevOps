# ArchDevops CA1 project 
is a sample project to puch code to AWS Fargate using Github Actions

## AWS Fargate
AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). Fargate makes it easy for you to focus on building your applications. Fargate removes the need to provision and manage servers, lets you specify and pay for resources per application, and improves security through application isolation by design.

## Github Actions
GitHub and Amazon Web Services have collaborated to develop this initial set of four open source GitHub Actions and a starter workflow

## Project instolation 

### Aws cloud shell

Create the ECR repository
aws ecr create-repository --repository-name archDevops-repo --region eu-west-1
Register a task definition
aws ecs register-task-definition --region eu-west-1 --cli-input-json file://httpd-td.json



### Create an ECS cluster

aws ecs create-cluster --region eu-west-1 --cluster-name archDevops_cluster

## security IAM role

### create the group.
aws iam create-group --group-name archDevops_group

### create the user.
aws iam create-user --user-name archDevops _user

configer Programmatic access for the user archDevops _user

### add the user to the group

aws iam add-user-to-group --user-name archDevops _user --group-name archDevops _group

arn:aws:iam::863432565647:group/codeStoreGroup

aws ec2 authorize-security-group-ingress --group-id 863432565647--protocol tcp --port 7000 --cidr 0.0.0.0/0

### Create the Fargate service

aws ecs create-service --region eu-west-1 --service-name archDevops-service --task-definition first-run-task-definition
 --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-fcc5779b,subnet-f7a318be],securityGroups=[sg-043ab03ec99b60369],assignPublicIp=ENABLED}" --cluster fargate


### Configure secrets
In Secrets in the Settings section of your Github repository, configure the two secrets below with the credentials for an IAM user (which you can obtain from the AWS console):
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY



### Add GitHub Actions workflow on push to deploy
Go to the Actions tab of your repository to find the starter workflow.
  ![image](https://user-images.githubusercontent.com/79165043/119424080-aa4ebf00-bcfc-11eb-9c82-6e8477898523.png)



### Add the actions pipeline file:
https://github.com/x00159372/ArchDevOps/blob/master/.github/workflows/aws.yml


 
