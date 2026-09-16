-- Install PostgreSQL, create a database and a limited-privilege role, then back up and restore it.

-- creating a db
CREATE DATABASE bank_db;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL
)

-- limited-privilege role
CREATE ROLE analyst LOGIN PASSWORD 'analyst123';

-- read only privilege
GRANT SELECT
ON employees
TO analyst

-- backup using sql dump
pg_dump -U postgres bank_db > bank_db.sql

-- restore
-- in linux
psql -U postgres new_db < bank_db.sql

-- in windows
psql -U postgres new_db -f bank_db.sql