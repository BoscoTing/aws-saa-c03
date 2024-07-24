# Install Postgres Client on EC2 Instance AML2023 X86

```sh
sudo su - ec2-user  
sudo dnf install postgresql15.x86_64 postgresql15-server -y
```

# Connection String URL

```sh
postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
postgresql://database-endpoint:5432/mydatabase
```

# Test Connection

```sh
psql postgresql://database-endpoint:5432/mydatabase
```


# Create a table

```sql
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```