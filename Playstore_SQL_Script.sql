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
	Privacy_Policy VARCHAR(1500) NULL,
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


