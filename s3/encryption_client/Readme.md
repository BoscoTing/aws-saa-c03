## Create a bucket

aws s3 mb s3://encrypt-client-example-bosco

## Create a file

echo "Hello World" > hello.txt

## Run our SDK ruby script

bundle exec ruby encrypt.rb

## Cleanup
aws s3 rm s3://encrypt-client-example-bosco/hello.txt
aws s3 rb s3://encrypt-client-example-bosco