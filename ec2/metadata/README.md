## Create a EC2 Instance that enables both IMDS V1 and V2
## Connect to EC2 Instance using SSM Connection
## V1 Example

Using curl

```sh
url http://169.254.169.254/latest/meta-data
```

Using wget 

```sh
wget -qO - http://169.254.169.254/latest/meta-data/public-ipv4
```

## Modify instance metadata options as  V2

```sh
aws ec2 modify-instance-metadata-options \
--instance-id i-0c5132ccbe6c29b20 \
--http-tokens required \
--http-endpoint enabled \
--region ap-northeast-3
```

Now we can't access this url without token

```sh
url http://169.254.169.254/latest/meta-data
```

Use this instead
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html

```sh
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/  
```