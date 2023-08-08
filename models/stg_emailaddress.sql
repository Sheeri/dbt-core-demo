with stg_emailaddress as (

SELECT BusinessEntityID, EmailAddress, EmailAddressID FROM {{ source("person_raw","EmailAddress") }} 
  
)

SELECT * FROM stg_emailaddress
