## Create S3 Bucket

```sh
aws s3 mb s3://kendra-example-bosco \
--region ap-northeast-1

```sh
cd split
```

```sh
aws s3 sync . s3://kendra-example-bosco \
--region ap-northeast-1
```

## Create Kendra Index

Kendra use entriprise edition as default, so make sure the "--edition" is set to DEVELOPER_EDITION

```sh
aws kendra create-index \
--edition DEVELOPER_EDITION \
--name my-index \
--description "My Index" \
--region ap-northeast-1 \
--role-arn arn:aws:iam::660513648685:role/KendraIndexRole
```

## Creating Our Data Source

```sh
aws kendra create-data-source \
--index-id 2e4a1119-466d-4fed-80ad-bc6d4b8e3090 \
--name my-data-source \
--role-arn arn:aws:iam::660513648685:role/KendraDataSourceRole \
--type S3 \
--configuration '{"S3Configuration":{"BucketName":"kendra-example-bosco"}}' \
--region ap-northeast-1
```

### Oliver Twist

https://e-school.kmutt.ac.th/elibrary/Upload/EBook/DSIL_Lib_E1312881157.pdf

## Sync

```sh
aws kendra start-data-source-sync-job \
--id 89eb4020-0623-4377-9e1e-ada2edbd260c \
--index-id 2e4a1119-466d-4fed-80ad-bc6d4b8e3090 \
--region ap-northeast-1
```

## Query

```sh
aws kendra query \
--index-id 2e4a1119-466d-4fed-80ad-bc6d4b8e3090 \
--query-text "You can talk as you eat, can't you?" \
--region ap-northeast-1
```
