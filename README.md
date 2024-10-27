8 Week SQL Challenge
==================================================

This repository contains all of my case study solutions through SQL queries for [#8WeekSQLChallenge](https://8weeksqlchallenge.com/) by [Danny Ma](https://www.linkedin.com/in/datawithdanny/). 

This project uses the `MySQL` database management in writing SQL queries to solve these case studies.


Case Studies
--------------------------------------------------

There are eight interesting fictional case studies in this challenge. 

- **Danny's Diner**
- **Pizza Runner**
- **Foodie-Fi**
- **Data Bank**
- **Data Mart**
- **Clique Bait**
- **Balanced Tree Clothing Co.**
- **Fresh Segments**


How to Set Up Danny's Database
--------------------------------------------------

### .ENV Configuration

Before deploying this setup, you need to create and configure the following values in the `.env` file.

```
POSTGRES_USER=<your-postgres-username>
POSTGRES_PASSWORD=<your-postgres-password>
PGADMIN_EMAIL=<your-pgadmin-email>
PGADMIN_PASSWORD=<your-pgadmin-password>
```

### Deploy with Docker Compose

Deploy the database using `docker compose up --build -d`.

```
$ docker compose up --build -d

[+] Building 0.1s (8/8) FINISHED                                                         docker:desktop-linux
 => [postgres internal] load build definition from Dockerfile                                            0.0s
 => => transferring dockerfile: 101B                                                                     0.0s
 => [postgres internal] load metadata for docker.io/library/postgres:latest                              0.0s
 => [postgres internal] load .dockerignore                                                               0.0s
 => => transferring context: 2B                                                                          0.0s
 => [postgres internal] load build context                                                               0.1s
 => => transferring context: 6.32MB                                                                      0.0s
 => [postgres 1/2] FROM docker.io/library/postgres:latest                                                0.1s
 => [postgres 2/2] COPY ./initdb ./docker-entrypoint-initdb.d/                                           0.0s
 => [postgres] exporting to image                                                                        0.0s
 => => exporting layers                                                                                  0.0s
 => => writing image sha256:0f7240674ef8acc34d5766847c7a74bf94429d5edb3d8322c9b1a1091f8de8e3             0.0s
 => => naming to docker.io/library/postgres:latest                                                       0.0s
 => [postgres] resolving provenance for metadata file                                                    
 ✔ Network danny_default  Created                                                                        0.0s 
 ✔ Container postgres     Started                                                                        0.1s 
 ✔ Container pgadmin      Started                                                                        0.2s 
 ```
