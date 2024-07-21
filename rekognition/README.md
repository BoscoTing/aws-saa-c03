## Make a S3 Bucket

```sh
aws s3 mb s3://rekog-example-bosco \
--region ap-northeast-1
```

## Copy Image File to Bucket

```sh
aws s3 andrew_brown.jpg cp s3://rekog-example-bosco
```

## Run Ruby Code

```sh
bundle install
bundle exec ruby main.rb
```
