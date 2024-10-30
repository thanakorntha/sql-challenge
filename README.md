8 Week SQL Challenge
==================================================

This repository contains all of my case study solutions through SQL queries for [#8WeekSQLChallenge](https://8weeksqlchallenge.com/) by [Danny Ma](https://www.linkedin.com/in/datawithdanny/). 



Danny's Case Studies
--------------------------------------------------

There are eight interesting fictional case studies in this challenge. 

| No |                                                                                       Image                                                                                        |        Case Study Name         |                                                      Medium                                                      |                                                    GitHub                                                     |                       Status                        |
|:--:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:------------------------------:|:----------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------:|
| 1  |       [<img src="https://8weeksqlchallenge.com/images/case-study-designs/1.png" alt="Danny's Diner" width="100" height="100">](https://8weeksqlchallenge.com/case-study-1/)        |       **Danny's Diner**        |      [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139)       |                               [Link](./case-study-answers/case-1-danny-diner/)                                |        🟢 <br/> Completed <br/> (04/05/2023)        |
| 2  |        [<img src="https://8weeksqlchallenge.com/images/case-study-designs/2.png" alt="Pizza Runner" width="100" height="100">](https://8weeksqlchallenge.com/case-study-2/)        |        **Pizza Runner**        | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139)-->  |       - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/2-pizza-runner) -->        |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |
| 3  |         [<img src="https://8weeksqlchallenge.com/images/case-study-designs/3.png" alt="Foodie-Fi" width="100" height="100">](https://8weeksqlchallenge.com/case-study-3/)          |         **Foodie-Fi**          | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139)-->  |         - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/3-foodie-fi) -->         | 🟠 <br/> In Progress <br/> <!-- (on X May 2023) --> |
| 4  |         [<img src="https://8weeksqlchallenge.com/images/case-study-designs/4.png" alt="Data Bank" width="100" height="100">](https://8weeksqlchallenge.com/case-study-4/)          |         **Data Bank**          | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139)-->  |         - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/4-data-bank) -->         |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |
| 5  |         [<img src="https://8weeksqlchallenge.com/images/case-study-designs/5.png" alt="Data Mart" width="100" height="100">](https://8weeksqlchallenge.com/case-study-5/)          |         **Data Mart**          | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139)-->  |         - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/5-data-mart) -->         |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |
| 6  |        [<img src="https://8weeksqlchallenge.com/images/case-study-designs/6.png" alt="Clique Bait" width="100" height="100">](https://8weeksqlchallenge.com/case-study-6/)         |        **Clique Bait**         | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139) --> |        - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/6-clique-bait) -->        |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |
| 7  | [<img src="https://8weeksqlchallenge.com/images/case-study-designs/7.png" alt="Balanced Tree Clothing Co." width="100" height="100">](https://8weeksqlchallenge.com/case-study-7/) | **Balanced Tree Clothing Co.** | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139) --> | - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/7-balanced-tree-clothing-co) --> |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |
| 8  |       [<img src="https://8weeksqlchallenge.com/images/case-study-designs/8.png" alt="Fresh Segments" width="100" height="100">](https://8weeksqlchallenge.com/case-study-8/)       |       **Fresh Segments**       | - <!-- [Link](https://medium.com/@thanakorn.tha/8-week-sql-challenge-dannys-diner-case-study-1-b4ff39d22139) --> |      - <!-- [Link](https://github.com/thanakorntha/8-week-sql-challenge/tree/main/8-fresh-segments) -->       |    ⚪️ <br/> To Do <br/> <!-- (on X May 2023) -->    |


Danny's Database Setup
--------------------------------------------------

My project utilizes [PostgreSQL](https://www.postgresql.org/) and [pgAdmin](https://www.pgadmin.org/) to manage Danny's database via Docker Compose. This allows for a consistent and portable database environment across different machines. All eight Danny's databases will be stored as .SQL files in the `initdb` folder. After deploying this setup, you can access pgAdmin to manage and view Danny's database at http://localhost:8080.

### Prerequisites

1. Git installed (https://git-scm.com/)
2. Docker installed (https://www.docker.com/)

### Running the Containers via Docker Compose

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Create and configure the following values in the `.env` file.
    - POSTGRES_USER=<your_postgres_username>
    - POSTGRES_PASSWORD=<your_postgres_password>
    - PGADMIN_EMAIL=<your_pgadmin_email>
    - PGADMIN_PASSWORD=<your_pgadmin_password>
4. Run `docker compose up -d` in your terminal to start the PostgreSQL container and pgAdmin in detached mode.

### Access pgAdmin

By default, pgAdmin is accessible through a web interface at http://localhost:8080/. Credentials for accessing the database will be defined in the `.env` file. After logging in, you can add your database to pgAdmin.

1. Right-click "Servers" in the top-left corner and select "Create" -> "Server..."
2. Name your connection
3. Change to the "Connection" tab and add the connection details:
    - Hostname: "postgres"
    - Port: "5432"
    - Maintenance Database: danny_db
    - Username: $POSTGRES_USER (see .env)
    - Password: $POSTGRES_PW (see .env)

### Stopping the Containers

To stop the containers, run `docker compose down` in your terminal. 

If you want to remove all data in the containers, run `docker compose down -v`.

References
--------------------------------------------------

https://event-driven.io/en/automatically_connect_pgadmin_to_database/