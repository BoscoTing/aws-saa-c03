## Create Serverless Cache

```sh
aws elasticache create-serverless-cache \
--serverless-cache-name my-cache-bosco \
--engine redis \
--major-engine-version 7
```

## Launch EC2 Instance with Redis Installed

```sh
chmod u+x deploy
./deploy
```

## Connect to instance

```sh
sudo su - ubuntu
redis-cli -h my-cache-bosco-wikeua.serverless.apne1.cache.amazonaws.com --tls
```
