## Make S3 Bucket and Copy PNG Example

```sh
aws s3 mb s3://textract-example-bosco \
--region ca-central-1
```

```sh
aws s3 cp filled_tax_form_example.png s3://textract-example-bosco \
--region ca-central-1
```

## Run Ruby Code

```sh
bundle install
bundle exec ruby main.py
```
