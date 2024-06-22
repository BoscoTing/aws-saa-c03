# Create Website 1

## Create a bucket

```sh
aws s3 mb s3://cors-example-bosco
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-example-bosco \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-example-bosco --policy file://bucket_policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-example-bosco --website-configuration file://website.json
```

## Upload our index.html file and include a resource would be croess-origin

```sh
aws s3 cp index.html s3://cors-example-bosco
```

## View the website and see if the index.html is there

http://cors-example-bosco.s3-website.ap-northeast-3.amazonaws.com

Other regions might use a hyphen instead
http://cors-example-bosco.s3-website-ap-northeast-3.amazonaws.com


# Create Website 2 (you can see CORs Error in development tool's 'Network')

## Create a bucket

```sh
aws s3 mb s3://cors-example-bosco-2
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-example-bosco-2 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-example-bosco-2 --policy file://bucket_policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-example-bosco-2 --website-configuration file://website.json
```

## Upload our javascript file

```sh
aws s3 cp hello.js s3://cors-example-bosco-2
```

## Create API Gateway with mock response and then test the endpoint for website 1

curl -X POST \
     -H "Content-Type: application/json" \
     https://r6r2tjbi7c.execute-api.ap-northeast-3.amazonaws.com/prod/hello


## Set CORS on our bucket of website 1

aws s3api put-bucket-cors --bucket cors-example-bosco --cors-configuration file://cors.json