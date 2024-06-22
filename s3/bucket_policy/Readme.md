## Create a bucket

aws s3 mb s3://bucket-policy-example-bosco

## Create bucket policy

aws s3api put-bucket-policy --bucket bucket-policy-example-bosco --policy file://policy.json

## In the other account access the bucket

touch tutorial.txt
aws s3 copy tutorial.txt s3://bucket-policy-example-bosco
aws s3 ls s3://bucket-policy-example-bosco

## Cleanup

aws s3 rm s3://bucket-policy-example-bosco/tutorial.txt
aws s3 rb s3://bucket-policy-example-bosco