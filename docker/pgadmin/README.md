Configuration Directory for pgAdmin container
==================================================

This directory contains configuration files for pgAdmin, a powerful database management tool for PostgreSQL. These configurations are designed to automatically add database servers to pgAdmin when you run Docker Compose, simplifying your setup process.


Key Files
--------------------------------------------------

### `servers.json`

This file contains the configuration for the database server. For this project, it provides the default configuration for Danny's database. You typically don't need to modify this file.

It includes the following information.

```json
{
    "Servers": {
        "1": {
            "Name": "Danny's Database for SQL Challenge",
            "Group": "Servers",
            "Host": "postgres",
            "Port": 5432,
            "MaintenanceDB": "danny_db",
            "Username": "postgres",
            "PassFile": "/pgpass",
            "Favorite": true,
            "SSLMode": "prefer"
        }
    }
}
```

### `pgpass-sample`

This file contains the password for the PostgreSQL database in a secure format. This file should be renamed to `pgpass` before running Docker Compose.

It includes the following information.


```
postgres:5432:danny_db:postgres:Password12!
```

It provides the default password for the PostgreSQL database. 

If you've changed the PostgreSQL password in the `.env` file, update the password in this file accordingly.
