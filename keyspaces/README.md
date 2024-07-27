## Create a Key Space

## Get CQL Queries Example
When using Keyspaces UI to create a table, it will show the CQL query example based on our settings

## Try CQL Queries Example in CQL Editor

```cql
CREATE TABLE "mykeyspace"."users"(
	"id" int,
	"first_name" ascii,
	"last_name" ascii,
	PRIMARY KEY(("id")))
WITH CUSTOM_PROPERTIES = {
	'capacity_mode':{
		'throughput_mode':'PAY_PER_REQUEST'
	},
	'point_in_time_recovery':{
		'status':'enabled'
	},
	'encryption_specification':{
		'encryption_type':'AWS_OWNED_KMS_KEY'
	}
}
```

## Insert Values via CQL Editor

```cql
INSERT INTO mykeyspace2.users (id, first_name, last_name)
VALUES (1, 'Bosco', 'Ting');
```
