## Create a new bucket

```sh
aws s3api create-bucket --bucket acl-example-bosco --region ap-northeast-3 --create-bucket-configuration LocationConstraint=ap-northeast-3
```

## Turn off Block Public Access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-bosco \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-bosco
```

## Change Bucket Ownership

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-bosco \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for a user in another AWS Account

```sh
aws s3api put-bucket-acl \
--bucket acl-example-bosco \
--access-control-policy "file://./s3/acls/policy.json"
```

## Access Bucket from other account

```sh
touch tutorial.txt s3://acl-example-bosco
aws s3 cp tutorial.txt s3://acl-example-bosco
aws s3 ls s3://acl-example-bosco
```

## Cleanup

```sh
aws s3 rm s3://acl-example-bosco/tutorial.txt
aws s3 rb s3://acl-example-bosco
```