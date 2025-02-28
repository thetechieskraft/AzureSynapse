# Azure Synapse Analytics 

## Scenario

| S.No | Scenario details  |
| ---- | ---------------- |
| 1.   | Serverless Pool- Copy the CSV file from DataLake into Azure Synapse External table|
| 2.   | Serverless Pool- Copy the parquet file from DataLake into Azure Synapse External table|
| 3.   | Serverless Pool- Copy the multiple parquet file from DataLake into Azure Synapse External table|
| 4.   | Find the field value in the JSON file on Azure Synapse|
| 5.   | Dedicated Pool- Copy the CSV file from DataLake into Azure Synapse Externaltable|
| 6.   | Dedicated Pool- Copy the parquet file from DataLake into Azure Synapse Externaltable|
| 7.   | Dedicated Pool- Hiden files and folders Azure Synapse Externaltable|
| 8.   | Dedicated Pool- Load data using Polybase into Externaltable|
| 9.   | Dedicated Pool- Load CSV data-Copy Command into Externaltable|
| 10.  | Dedicated Pool- Load Parquet data-Copy Command into Externaltable|


graph TD
    A[Internet] --> B{Cloud Load Balancing (External HTTP(S) Load Balancer)};
    B --> C[Cloud Armor (WAF)]
    C --> D[Apigee API Management];
    D --> E[Cloud Functions];
    E --> F[Cloud SQL for SQL Server];
    G[Cloud Identity] -- Authentication --> D;
    G -- Authentication --> E;
    H[Cloud KMS & Secret Manager] -- Secrets --> D;
    H -- Secrets --> E;
    I[Cloud Monitoring & Cloud Logging] -- Monitor/Log --> B;
    I -- Monitor/Log --> C;
    I -- Monitor/Log --> D;
    I -- Monitor/Log --> E;
    I -- Monitor/Log --> F;

    subgraph "GCP Services"
    B;C;D;E;F;G;H;I;
    end
