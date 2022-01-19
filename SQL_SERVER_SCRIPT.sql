	DROP DATABASE IF EXISTS Playstore
GO
	CREATE DATABASE Playstore
GO
	USE Playstore
GO	
	CREATE TABLE info(
	Info_Id VARCHAR(500) PRIMARY KEY,
	Last_Updated VARCHAR(250) NULL,
	Content_Rating VARCHAR(250) NULL,
	Privacy_Policy VARCHAR(8000) NULL,
	Ad_Supported VARCHAR(250) NULL,
	In_App_Purchases VARCHAR(250) NULL,
)
GO
	CREATE TABLE developer
	(
	Devs_Id varchar(500) PRIMARY KEY,
	Developer_Id varchar(500) NULL,
	Developer_Website varchar(700) NULL,
	Developer_Email	varchar(500) NULL,
	Editors_Choice varchar(500)	NULL
	)
GO
	CREATE TABLE install(
	Install_Id VARCHAR(500) PRIMARY KEY,
	Installs VARCHAR(500) NULL,
	Minimum_Installs VARCHAR(500) NULL,
	Maximum_Installs VARCHAR(500) NULL,
	Minimum_Android VARCHAR(500) NULL,
)
GO
	CREATE TABLE app
(
	 App_Id       varchar(500) PRIMARY KEY,
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
	 Scraped_Time timestamp
	);
GO
	BULK INSERT info
	FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_dim3.csv'
	WITH (FIRSTROW = 2,
		  FIELDTERMINATOR = '|',
		  ROWTERMINATOR='\n'
		  )
GO
	BULK INSERT install
	FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_dim2.csv'
	WITH (FIRSTROW = 2,
		  FIELDTERMINATOR = '|',
		  ROWTERMINATOR='\n'
		  )
GO
	BULK INSERT developer
	FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_dim1.csv'
	WITH (FIRSTROW = 2,
		  FIELDTERMINATOR = '|',
		  ROWTERMINATOR='\n'
		  )
GO
	BULK INSERT app
	FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_fact.csv'
	WITH (FIRSTROW = 2,
		  FIELDTERMINATOR = '|',
		  ROWTERMINATOR='\n'
		  )

GO
	DROP TABLE IF EXISTS dbo.app
	DROP TABLE IF EXISTS dbo.developer
	DROP TABLE IF EXISTS dbo.info
	DROP TABLE IF EXISTS dbo.install

--BULK INSERT info
--FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_dim3.csv'
--WITH (CODEPAGE = '65001', DATAFILETYPE = 'Char',FIRSTROW = 2,
--		  FIELDTERMINATOR = '|',
--		  ROWTERMINATOR='\n')

SELECT * FROM [dbo].[info]