## Create a user with no permissions

We need to create a new user with not permissions and generate out access keys

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

Then edit credentials file to change away from default profile

```sh
open ~/.aws/credentials
```

Add a new section with title "sts"
Make sure the default section contains the original users that have cli access
The sts section contains the key and credential that just created

Test who you are:

```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to S3

```sh
aws s3 ls --profile sts
```
> An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied

## Create a Role

We need to create a role that will access a new resource

```sh
chmod u+x bin/deploy
```

## Use new user credentials and assume role

```sh
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::660513648685:role/my-sts-example-stack-StsRole-4TBUoPdr9vxI \
--role-session-name s3-sts-example \
--profile sts
```

Add the output access key, credential and 
"aws_session_token" to a new profile "assumed"

```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```

## Clean UP

Tear down your cloudformation stack via AWS Management Console

```sh
aws iam delete-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy
```

```sh
aws iam delete-access-key \
--access-key-id "" \
--user-name sts-machine-user
```

```sh
aws iam delete-user --user-name sts-machine-user
```