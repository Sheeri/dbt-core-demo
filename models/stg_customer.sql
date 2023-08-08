with stg_customer as (

SELECT "CustomerID" AS CustomerID, "PersonID" as PersonID, "StoreID" as StoreID, "TerritoryID" as TerritoryID, "AccountNumber" AS AccountNumber FROM {{ source("sales_raw","Customer") }} 
  
)

SELECT * FROM stg_customer

