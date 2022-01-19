-- Joins (via the JOIN clause) are how we query data contained in multiple tables.
-- There are two main types of relationships:
--   1. One-to-many
--   2. Many-to-many

-- For example, a customer has many invoices, but each invoice belongs to one
-- and only one customer.  This is a one-to-many relationship.

-- Think of some one-to-many relationships in every day life, e.g.,
--
--   1. A car can get many parking tickets, but a parking ticket belongs to
--      one and only one car.
--   2. Every state in the US has many cities, but every city in the US is in
--      one and only one state.
--   3. Customers can have many orders, but an order belongs to a single customer
--   4. Customers can have multiple credit cards, but every credit card belong
--      to a single customer.
--   5. Think of some of your own.

-- An example of a many-to-many relationship might be events and people.
-- I can attend many events and each event has many attendees.
-- In our toy app database, we're only dealing with one-to-many relationships.

DROP TABLE IF EXISTS app
DROP TABLE IF EXISTS developer
DROP TABLE IF EXISTS info
DROP TABLE IF EXISTS install

CREATE DATABASE POKEMON

SELECT POKEMON

DROP TABLE IF EXISTS "public".info

CREATE TABLE "public".info(
	Info_Id VARCHAR(500) NOT NULL UNIQUE,
	Last_Updated VARCHAR(500) NULL,
	Content_Rating VARCHAR(500) NULL,
	Privacy_Policy VARCHAR(10000) NULL,
	Ad_Supported VARCHAR(500) NULL,
	In_App_Purchases VARCHAR(500) NULL,
	CONSTRAINT PK_73 PRIMARY KEY ( Info_Id )
);

DROP TABLE IF EXISTS "public".developer

CREATE TABLE "public".developer
	(
	Devs_Id        varchar(500) NOT NULL UNIQUE,
	Developer_Id	varchar(500)	NULL,
	Developer_Website	varchar(500)	NULL,
	Developer_Email	varchar(500)	NULL,
	Editors_Choice	varchar(500)	NULL,
	CONSTRAINT PK_21 PRIMARY KEY ( Devs_Id )
);

DROP TABLE IF EXISTS "public".installs
CREATE TABLE "public".install(
	Install_Id VARCHAR(500) NOT NULL UNIQUE,
	Installs VARCHAR(500) NULL,
	Minimum_Installs VARCHAR(500) NULL,
	Maximum_Installs VARCHAR(500) NULL,
	Minimum_Android VARCHAR(500) NULL,
	CONSTRAINT PK_65 PRIMARY KEY ( Install_Id )
)

DROP TABLE IF EXISTS "public".app

CREATE TABLE "public".app
(
	 App_Id       varchar(500) NOT NULL UNIQUE,
	 App_Name     varchar(250) NULL,
	 Category     varchar(250) NULL,
	 Rating       varchar(250) NULL,
	 Rating_Count varchar(250) NULL,
	 "Free"         varchar(250) NULL,
	 Price        varchar(250) NULL,
	 Currency     varchar(250) NULL,
	 "Size"         varchar(250) NULL,
	 Released     varchar(250) NULL,
	 Info_Id      varchar(500) REFERENCES info(Info_Id) NOT NULL,
	 Devs_Id      varchar(500) REFERENCES developer(Devs_Id) NOT NULL,
	 Install_Id   varchar(500) REFERENCES install(Install_Id) NOT NULL,
	 Scraped_Time timestamp,
	 CONSTRAINT PK_7 PRIMARY KEY ( App_Id )
	);

COPY app FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\PostgreSQL\df_fact.csv'
WITH DELIMITER '|' CSV HEADER;

COPY developer FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\PostgreSQL\df_dim1.csv'
WITH DELIMITER '|' CSV HEADER;

COPY install FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\PostgreSQL\df_dim2.csv'
WITH DELIMITER '|' CSV HEADER;

COPY info FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\PostgreSQL\df_dim3.csv'
WITH DELIMITER '|' CSV HEADER;

SELECT * FROM app AS t1
INNER JOIN install AS t2 ON t1.install_id = t2.install_id
LIMIT 100

SELECT * FROM install AS t1
INNER JOIN app AS t2 ON t1.install_id = t2.install_id
LIMIT 100

SELECT * FROM "public".info
LIMIT 100

Select *
From 
(
    Select 
      Row_Number() Over () As RowNum
    , *
    From "public".info
) t2
Where RowNum = 1741259
