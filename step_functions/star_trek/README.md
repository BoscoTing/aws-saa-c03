## Create a Bucket

```sh
aws s3 mb s3://sf-example-star-trek-bosco \
--region ap-northeast-1
```

## Create Statue Machine Manually

## Enable EventBridge Comunication

```sh
aws s3api put-bucket-notification-configuration \
--region ap-northeast-1 \
--bucket sf-example-star-trek-bosco \
--notification-configuration '
{
  "EventBridgeConfiguration": {
  }
}'
```

## Upload files

```sh
aws s3 cp picard.jpg s3://sf-example-star-trek-bosco/picard.jpg \
--region ap-northeast-1
```

## Clean Up

```sh
aws s3 rm s3://sf-example-star-trek-bosco/inputs/picard.jpg \
--region ap-northeast-1

aws s3 rb s3://sf-example-star-trek-bosco \
--region ap-northeast-1
```

## References

https://docs.aws.amazon.com/AmazonS3/latest/userguide/ev-events.html
