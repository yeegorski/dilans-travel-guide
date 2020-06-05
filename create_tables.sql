#Creating tables for 4 groups of users:

CREATE TABLE new_readers 
(
  date      DATE,
  event     TEXT,
  country   TEXT,
  user_id   BIGINT,
  source    TEXT,
  continent TEXT
);

COPY new_readers
FROM '/home/dataguy/dilan/new_readers.csv' DELIMITER ';';



CREATE TABLE returning_readers 
(
  date        DATE,
  event       TEXT,
  country     TEXT,
  user_id     BIGINT,
  continent   TEXT
);

COPY returning_readers
FROM '/home/dataguy/dilan/returning_readers.csv' DELIMITER ';';


CREATE TABLE subscribers 
(
  date      DATE,
  event     TEXT,
  user_id   BIGINT
);

COPY subscribers
FROM '/home/dataguy/dilan/subscribers.csv' DELIMITER ';';


CREATE TABLE customers 
(
  date      DATE,
  event     TEXT,
  user_id   BIGINT,
  payment INTEGER
);

COPY customers
FROM '/home/dataguy/dilan/customers.csv' DELIMITER ';';



