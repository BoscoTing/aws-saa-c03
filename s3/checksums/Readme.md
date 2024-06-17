## Create a new s3 bucket

```md
aws s3 mb s3://checksums-examples-bosco
```

## Create a file that we will do a checksum on

```md
echo "Hello Mars" > myfile.txt
```

## Get a checksum of a file for md5

```md
md5sum myfile.txt
# 8ed2d86f12620cdba4c976ff6651637f myfile.txt
```

## Upload our file to s3
```
aws s3 cp myfile.txt s3://checksums-examples-bosco
aws s3api head-object --bucket checksums-examples-bosco --key myfile.txt
```

## Lets upload a file with a different kind of checksum

```sh
bundle exec ruby crc.rb
```

```sh
aws s3api put-object \
--bucket="checksum-examples-bosco" \
--key="myfilesha1.txt" \
--object="myfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-crc32="YzI4Y2NjMmM1ZTIxNDAzNjgwNjAxNGRmOWZiNDM2MzRmM2U3NzBiMg=="
```