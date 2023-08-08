with stg_personphone as (

SELECT BusinessEntityID, PhoneNumber, PhoneNumberTypeID FROM {{ source("person_raw","PersonPhone") }} 
  
)

SELECT * FROM stg_personphone
