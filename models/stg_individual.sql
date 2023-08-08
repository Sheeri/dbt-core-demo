with stg_individual as (

SELECT BusinessEntityID, PersonType, NameStyle, Title, FirstName, MiddleName, LastName, Suffix, 
EmailPromotion, AdditionalContactInfo, Demographics FROM {{ source("person_raw","Individual") }} 
  
)

SELECT * FROM stg_individual
