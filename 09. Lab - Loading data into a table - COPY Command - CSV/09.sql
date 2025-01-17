DROP TABLE PoolActivityLog;

CREATE TABLE PoolActivityLog
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
   [Resource] varchar(2000)
)
WITH(
    DISTRIBUTION=ROUND_ROBIN
)

COPY INTO PoolActivityLog
FROM 'https://shivdatalake2025.blob.core.windows.net/data/ActivityLog01.csv'
WITH(
    FILE_TYPE='CSV',
    FIRSTROW=2,
    CREDENTIAL=
    (
        IDENTITY='Shared Access Signature',
        SECRET='sv=2022-11-02&ss=b&srt=sco&sp=rlx&se=2025-01-18T13:21:57Z&st=2025-01-17T05:21:57Z&spr=https&sig=NAcss2DZrsgHcywiJ2MSEJU1%2BSXX2D6%2BHY3N%2BfNupw8%3D'
    )
);
