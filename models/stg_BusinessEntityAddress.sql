with stg_BusinessEntityAddress as (

SELECT BusinessEntityID, AddressTypeID, AddressID  FROM {{ source("person_raw","BusinessEntityAddress") }} 
  
)

SELECT * FROM stg_BusinessEntityAddress
