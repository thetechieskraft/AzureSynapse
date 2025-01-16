DROP EXTERNAL TABLE ActivityLog;
DROP EXTERNAL DATA SOURCE srcActivityLog;
-- Master Key is required to encrypet the secret at database Level

CREATE MASTER KEY ENCRYPTION BY PASSWORD = '' -- Fill the value of PASSWORD

-- Fill the value of SECRET from Storage Account Secret Key
CREATE DATABASE SCOPED CREDENTIAL sasToken
WITH IDENTITY ='SHARED ACCESS SIGNATURE',
SECRET=''


CREATE EXTERNAL DATA SOURCE srcActivityLog
WITH 
(
    LOCATION='https://shivdatalake2025.blob.core.windows.net/data',
    CREDENTIAL=sasToken
)


CREATE EXTERNAL FILE FORMAT parquetFileFormat WITH
(
    FORMAT_TYPE=PARQUET,
    DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
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
    LOCATION='/ActivityLog01.parquet',
    DATA_SOURCE=srcActivityLog,
    FILE_FORMAT=parquetFileFormat
)

SELECT * FROM ActivityLog;
