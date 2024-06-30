## Get VPC ID

```sh
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=nal-example-vpc" \
--query "Vpcs[].VpcId" \
--output text
```

## Create NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-0a1e05756c6be62ea
```

## Add entry

```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-0d56b30da68e8bbfe \
--ingress \
--rule-number 90 \
--protocol tcp --port-range From=0,To=65535 \
--cidr-block 111.248.253.235/32 \
--rule-action deny
```

## Get AMI for amazon Linux 2

### Grab the latest AMI amazon Linux 2 instance AMI ID
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--region ap-northeast-3 \
--query 'Images | sort_by(@, &CreationDate) | [-1].[ImageId]' \
--output text
```

