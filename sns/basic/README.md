## Set Permission to Execute Bash Scripts

```sh
chmod ./bin/*
```

## Build SNS Topic and Subscription via CFN

```sh
./bin/build
./bin/deploy
```

## Attach CloudWatch Basic IAM Role for Lambda

```sh
aws iam attach-role-policy --role-name LambdaCloudWatchBasicRole --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole
```

## Publish a Message via Lambda

```sh
./bin/publish
```
