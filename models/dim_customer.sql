with dim_customer as (

SELECT 
	c.CustomerID AS CustomerKey,
    dg.GeographyKey AS GeographyKey, 
    c.AccountNumber AS CustomerAlternateKey, 
    p.Title AS Title, 
    p.FirstName AS FirstName, 
    p.MiddleName AS MiddleName, 
    p.LastName AS LastName, 
    p.NameStyle AS NameStyle,
	p.Suffix AS Suffix, 
	ea.EmailAddress AS EmailAddress, 
	a.AddressLine1 AS AddressLine1, 
	a.AddressLine2 AS AddressLine2, 
	pp.PhoneNumber AS Phone
FROM 
	{{ref ('stg_individual') }} p
		INNER JOIN 
	{{ref ('stg_BusinessEntityAddress') }} bea ON bea.BusinessEntityID = p.BusinessEntityID 
		INNER JOIN 
	{{ref ('stg_address') }} a ON a.AddressID = bea.AddressID
		INNER JOIN 
	{{ref ('stg_stateprovince') }} sp ON sp.StateProvinceID = a.StateProvinceID
		INNER JOIN 
	{{ref ('stg_customer') }} c ON c.PersonID = p.BusinessEntityID
		LEFT OUTER JOIN 
	{{ref ('stg_emailaddress') }} ea ON ea.BusinessEntityID = p.BusinessEntityID
		LEFT OUTER JOIN 
	{{ref ('stg_personphone') }} pp ON pp.BusinessEntityID = p.BusinessEntityID
		LEFT OUTER JOIN 
	{{ref ('dim_geography') }} dg ON a.City = dg.City 
        AND sp.StateProvinceCode = dg.StateProvinceCode
		AND a.PostalCode = dg.PostalCode
)

SELECT * FROM dim_customer

