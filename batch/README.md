# Push the Image to Amazon ECR

https://ap-northeast-3.console.aws.amazon.com/ecr/repositories/private/660513648685/square?region=ap-northeast-3

## Login ECR

```sh
aws ecr get-login-password --region ap-northeast-3 | docker login \
--username AWS \
--password-stdin 660513648685.dkr.ecr.ap-northeast-3.amazonaws.com
```

## Build an Image

```sh
docker build -t app .
```

## Try Running the Container

```sh
docker run --name myapp -d app
```

## Tag the image to push

```sh
docker tag square:latest 660513648685.dkr.ecr.ap-northeast-3.amazonaws.com/square:latest  
```

## Push this image to our newly created AWS repository

```sh
docker push 660513648685.dkr.ecr.ap-northeast-3.amazonaws.com/square:latest 
```

# Batch

https://docs.aws.amazon.com/batch/latest/APIReference/API_RegisterJobDefinition.html

## Register a Job

```sh
aws batch register-job-definition \
--job-definition-name square-job \
--type container \
--container-properties '{
    "image": "660513648685.dkr.ecr.ap-northeast-3.amazonaws.com/square",
    "vcpus": 1,
    "memory": 128
}'
```

## Create Compute Enviornment

```sh
aws batch create-compute-environment --compute-environment-name computeEnvironment \
--type MANAGED \
--state ENABLED \
--compute-resources "type=EC2,minvCpus=0,maxvCpus=2,desiredvCpus=1,instanceTypes= m5.large,subnets=subnet-09e7ae63d1bf7e9ff,securityGroupIds=sg-04705a95031e01cc5,instanceRole=ecsInstanceRole" \
--service-role AWSBatchServiceRole
```

## Create a Queue

```sh
aws batch create-job-queue \
--job-queue-name my-job-queue \
--state ENABLED \
--priority 1 \
--compute-environment-order order=1,computeEnvironment=arn:aws:batch:ap-northeast-3:660513648685:compute-environment/ComputeEnv
```

## Submit the Job

```sh
aws batch submit-job \
--job-name my-job \
--job-definition square-job \
--job-queue my-job-queue
```

An error occurred (ClientException) when calling the SubmitJob operation: Job Queue is attached to Compute Environment that can not run Jobs with capability EC2.