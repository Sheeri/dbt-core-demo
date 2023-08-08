
with stg_stateprovince as (

SELECT stateprovinceid, stateprovincecode, countryregioncode, isonlystateprovinceflag, "Name" as name, TerritoryID FROM {{ source("person_raw","StateProvince") }} 
  
)

SELECT * FROM stg_stateprovince
