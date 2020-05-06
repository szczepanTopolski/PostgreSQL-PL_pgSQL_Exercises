# Codecool Bank

## Table of Contents

- [About](#about)
- [Installing](#installing)
- [Usage](#usage)

## About <a name = "about"></a>

DISCLAIMER! - IT'S NOT REAL BANK DBMS :)

Project created in PostgreSQL for codecool. We have practiced advanced SQL commends and 
moving part of bussines logic and responsibilities to database side.
Futhermore for the first time we were operating on such large amount of data.
We applied around 100k rows to our bank database to train optimalization. 
We have used [PL/pgSQL](https://www.postgresql.org/docs/9.3/plpgsql.html) which is procedural language for SQL. 


### Installing <a name = "installing"></a>

To install postgresql on linux use:

```
sudo apt install postgresql
```

To install postgresql on windows use:

[Postgresql Windows Download](https://www.postgresql.org/download/windows/)


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

