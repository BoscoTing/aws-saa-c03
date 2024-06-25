## Create a bucket

aws s3 mb s3://encryption-example-bosco

### Create a file and Put Object with encryption SS3-S3


echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-example-bosco


### Put Object with encryption of KMS

aws s3api put-object \
--bucket encryption-example-bosco \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "bd9ffef5-4eef-4dbf-a791-3f5e04dc2878"

### Put Object with SSE-C [Failed Attempt]

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE

In MacOS, yo might not use the -w0 command, but use the command instead:
export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 | tr -d '\n')
echo $MD5_VALUE


aws s3api put-object \
--bucket encryption-example-bosco \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
# --sse-customer-key-md5 $MD5_VALUE

An error occurred (InvalidArgument) when calling the PutObject operation: The secret key was invalid for the specified algorithm.

### Put Object with SS#-C via aws s3

openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-example-bosco/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://encryption-example-bosco/hello.txt hello.txt --sse-c AES256 --sse-c-key fileb://ssec.key

## Cleanup

aws s3 rm s3://encryption-example-bosco/hello.txt
aws s3 rb s3://encryption-example-bosco