-- Create SQL Dedicated Pool

CREATE MASTER KEY ENCRYPTION BY PASSWORD = ''

CREATE DATABASE SCOPED CREDENTIAL sasToken
WITH IDENTITY ='SHARED ACCESS SIGNATURE',
SECRET=''


-- In Dedicated SQL Pool, Only HADOOP type support to get data from EXTERNAL source

CREATE EXTERNAL DATA SOURCE srcActivityLog
WITH 
(
    LOCATION='abfss://data@shivdatalake2025.blob.core.windows.net',
    TYPE = HADOOP,
     CREDENTIAL=sasToken
)

CREATE EXTERNAL FILE FORMAT delimitedTxtFileFormat WITH
(
    FORMAT_TYPE=DELIMITEDTEXT,
    FORMAT_OPTIONS(
        FIELD_TERMINATOR=',',
        FIRST_ROW=2
    )
)

CREATE EXTERNAL TABLE ActivityLog
(
   [Correlationid] varchar(200),
   [Operationname] varchar(300),
   [Status] varchar(100),
   [Eventcategory] varchar(100),
   [Level] varchar(100),
   [Time] varchar(100),
   [Subscription] varchar(200),
   [Eventinitiatedby] varchar(1000),
   [Resourcetype] varchar(300),
   [Resourcegroup] varchar(1000),
   [Resource] varchar(2000))
WITH (
    LOCATION='/ActivityLog01.csv',
    DATA_SOURCE=srcActivityLog,
    FILE_FORMAT=delimitedTxtFileFormat
)

SELECT * FROM ActivityLog;