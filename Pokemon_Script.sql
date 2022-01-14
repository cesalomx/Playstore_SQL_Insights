----CREATE DATABASE POKEMON
--USE POKEMON
--GO
--DROP TABLE IF EXISTS pokemon.app
--GO
--CREATE TABLE app(
--	App_Id VARCHAR(250) NOT NULL PRIMARY KEY,
--	App_Name VARCHAR(250) NULL,
--	Category VARCHAR(250)NULL,
--	Rating VARCHAR(250) NULL,
--	Rating_Count VARCHAR(250) NULL,
--	Free VARCHAR(250) NULL,
--	Price VARCHAR(250) NULL,
--	Currency VARCHAR(250) NULL,
--	Developer_Id VARCHAR(250) NULL,
--	Size VARCHAR(250) NULL,
--	Released VARCHAR(250) NULL,
--	Info_Id VARCHAR(250) NOT NULL,
--	Id INT NOT NULL
--)
--GO
DROP TABLE IF EXISTS installs

	CREATE TABLE installs(
	Installs VARCHAR(250) NULL, 
	Minimum_Installs VARCHAR(250) NULL,
	Maximum_Installs VARCHAR(250) NULL,
	Minimun_Android VARCHAR(250) NULL,
	Developer_Id VARCHAR(250) NULL, 
	App_Id VARCHAR(250) NULL,
	Info_Id VARCHAR(250) NULL,
	Id VARCHAR(250) NULL


)

BULK INSERT installs
FROM 'D:\Cesar\pgAdmin - MySQL - Oracle\MSSQL\df_dim2.csv'
WITH (FIRSTROW = 2,
      FIELDTERMINATOR = '|',
      ROWTERMINATOR='\n'
	  )

SELECT TOP 100 *  FROM dbo.installs

TRUNCATE TABLE dbo.installs