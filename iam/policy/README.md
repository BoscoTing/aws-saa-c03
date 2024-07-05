## Convert to json

The command
```sh
yq -o json policy.yaml > policy.json
```

The bash script
```sh
./convert
```

## Create IAM Policy

```sh
aws iam create-policy \
--policy-name my-example-policy \
--policy-document file://policy.json
```

## Attach Policy to User

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::660513648685:policy/my-example-policy \
--user-name aws-saa-c03
```

## Deleting Policies

```sh
aws iam delete-policy-version --policy-arn arn:aws:iam::660513648685:policy/my-example-policy --version-id v1
aws iam delete-policy-version --policy-arn arn:aws:iam::660513648685:policy/my-example-policy --version-id v2
aws iam delete-policy-version --policy-arn arn:aws:iam::660513648685:policy/my-example-policy --version-id v3
aws iam delete-policy-version --policy-arn arn:aws:iam::660513648685:policy/my-example-policy --version-id v4
```