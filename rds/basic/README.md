## Create Secret via Secret Manager

```sh
aws secretsmanager create-secret \
--name MyTestSecret \
--description "My test secret for RDS" \
--secret-string "{\"password\":\"mypassword\"}"
```
