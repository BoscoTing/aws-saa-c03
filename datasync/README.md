
## Create Buckets

```sh
aws s3 mb s3://source-datasync-bosco
aws s3 mb s3://dest-datasync-bosco
```

## Upload File

```sh
touch hello.txt
aws s3 cp hello.txt s3://source-datasync-bosco/data/hello.txt
```

## Create DataSync task

There is no example yet. You might use AWS UI.<br>
https://docs.aws.amazon.com/cli/latest/reference/datasync/create-task.html<br>

## Start the task