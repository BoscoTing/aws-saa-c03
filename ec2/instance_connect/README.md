```sh
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=ap-northeast-3

aws sts get-caller-identity
```

## Connect instance via SSHClient

```sh
aws ec2-instance-connect send-ssh-public-key \
--instance-id i-081ee5d64c43f2a58 \
--instance-os-user ec2-user \
--availability-zone ap-northeast-3a \
--ssh-public-key file://ec2connect.pub
``` 

```sh
ssh -i "ec2connect" ec2-user@ec2-15-152-48-196.ap-northeast-3.compute.amazonaws.com
```