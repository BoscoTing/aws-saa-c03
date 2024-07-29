# AWS MSK (Kafka) Code Example

## Create Serverless Cluster

Use default VPC, Subnets and SG

## Create Policy and Attach It to IAM Role

See example in policy.json

## Launch an EC2 Instance

Use the IAM Role in the detail setting

## Follow Docs to Setup

https://docs.aws.amazon.com/msk/latest/developerguide/serverless-getting-started.html

```sh
./kafka-topics.sh \
--bootstrap-server $BS \
--command-config client.properties \
--create \
--topic my-topic \
--partitions 1
```

```sh
./kafka-console-consumer.sh \
--bootstrap-server $BS \
--consumer.config client.properties \
--topic my-topic \
--from-beginning
```

```sh
./kafka-console-producer.sh \
--broker-list $BS \
--producer.config client.properties \
--topic my-topic
```

Send messages

```sh
> Hello Mars
> Goodbye Moon
```
