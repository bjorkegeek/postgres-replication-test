
# PostgreSQL Primary/Standby Replication with Docker Compose

This repository contains a basic setup for PostgreSQL primary/standby replication using Docker Compose for educational/demonstration use.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed on your machine

## Getting Started

1. Clone this repository:
    ```sh
    git clone https://github.com/bjorkegeek/postgres-replication-test.git
    cd postgres-replication-test
    ```
2. Start the services using Docker Compose:
    ```sh
    docker-compose up -d
    ```
## Usage

### Connecting to the Primary Database

You can connect to the primary database using the following credentials:
- **Host:** `localhost`
- **Port:** `5432`
- **Username:** `postgres`
- **Password:** `examplepass`
- **Database:** `exampledb`

Example connection string:
```sh
psql -h localhost -p 5432 -U postgres -d exampledb
```

### Connecting to the Standby Database

You can connect to the standby database using the following credentials:
- **Host:** `localhost`
- **Port:** `5433`
- **Username:** `postgres`
- **Password:** `examplepass`
- **Database:** `exampledb`

Example connection string:
```sh
psql -h localhost -p 5433 -U postgres -d exampledb
```
*Note that all transactions on the standby database are read-only!*

### Stopping the services
To stop the services, run:
```sh
docker-compose down
```

### Cleaning Up
To remove the data directories and start fresh, run:
```sh
rm -rf primary/data standby/data
```
### Notes

-   This setup is for demonstration and tinkering purposes and is not suitable for production environments as-is.

### Contributing
Feel free to submit issues or pull requests if you have any improvements or suggestions.
### License
The contents of this repository is subject to the MIT License
