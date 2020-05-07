# Codecool Bank

## Table of Contents

- [About](#about)
- [Installing](#installing)
- [Run](#run)
- [Usage](#usage)

## About <a name = "about"></a>

DISCLAIMER! - IT'S NOT REAL BANK DBMS :)

Project created in PostgreSQL for codecool. We have practiced advanced SQL commands and 
moving part of bussines logic and responsibilities to database side.
Futhermore for the first time we were operating on such large amount of data.
We applied approximately 100k rows to our bank database to train optimalization. 
We have used [PL/pgSQL](https://www.postgresql.org/docs/9.3/plpgsql.html) which is procedural language for SQL. 


### Installing <a name = "installing"></a>

To install postgresql on linux use:

```
sudo apt install postgresql
```

To install postgresql on windows use:

[Postgresql Windows Download](https://www.postgresql.org/download/windows/)

#### IMPORTANT! 

Part of our database functionalities works only with version 11.0 and higher 
(12.0 and RELEASE is the safest).

### Run <a name = "run"></a>

To check functionalities you must initialize our database in postgres server

Run if you have created your own server

```
psql -U userName -d databaseName -a -f 'C:\yourPATH\SQL_ADVANCED_CCBANK\backupinserts\INIT.sql'
```

or use our cloud azure one, and run:

```
psql "host=codecool.postgres.database.azure.com port=5432 dbname=postgres user=fajnyCodecooler@codecool password=itsAFeature30k sslmode=allow"
```

You can run functions and procedures using terminal or GUI such as PgADMIN :)

## Usage <a name = "usage"></a>

- Transaction between two accounts
- Exchange currencies 
- Change contact information for client
- Make automatic payments
- Update saving account with %
- Restrict saving account to transfer to accounts of the same client only
- Show account balance
- Show transaction history for account AND client, include exchange rate for given date
- Show current exchange rates for given currency
- Show currency fluctuation over time
- Show average amount of a transfer in given currency and month
- Show sum of all transfers in given currency and month

