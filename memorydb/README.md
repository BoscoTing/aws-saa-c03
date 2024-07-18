## Create Subnet Group

```sh
aws memorydb create-subnet-group \
--subnet-group-name mysubnetgroup \
--description "my subnet group" \
--subnet-ids subnet-0c6bd1bd5d58b2255 subnet-070b6842c40f74c0a \
--query SubnetGroup.ARN \
--output text
```

## Create User

```sh
aws memorydb create-user \
--user-name bosco \
--access-string 'on ~* &* +@all' \
--authentication-mode Passwords='Testing1234567890!',Type=password
```

## Create ACL

```sh
aws memorydb create-acl \
--acl-name "new-acl-1" \
--user-names "bosco"
```

## Create Cluster

```sh
aws memorydb create-cluster \
--cluster-name my-new-cluster \
--node-type db.t4g.small \
--acl-name new-acl-1 \
--subnet-group mysubnetgroup
```

## Deploy Instance

```sh
./deploy
```

## Connect Redis CLI

```sh
redis-cli -h clustercfg.my-new-cluster.wikeua.memorydb.ap-northeast-1.amazonaws.com \
--tls \
--user bosco \
--pass Testing1234567890!
```

## Example

set 'hello' 'Hi Bosco'
get 'hello'
