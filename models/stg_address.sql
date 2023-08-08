with stg_address as (

SELECT AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation  FROM {{ source("person_raw","Address") }} 
  
)

SELECT * FROM stg_address
