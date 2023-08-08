with dim_geography as (
SELECT count(1) as cnt, sp.stateprovinceid, sp.Name, city, stateprovincecode, sp.countryregioncode, postalcode,
CASE WHEN LEFT(stateprovincecode,2) in ('WA','OR', 'AK','ID','MT','WY') THEN 1  -- nw us
WHEN LEFT(stateprovincecode,2) in ('ME','VT','NH','CT','MA','RI', 'DE','MD','NJ','NY','PA') THEN 2 --ne us
WHEN LEFT(stateprovincecode,2) in ('IL','IN','IA','KS','MI','MN','NE','ND','OH','SD','WI') THEN 3 -- central us
WHEN LEFT(stateprovincecode,2) in ('AZ','NM','OK','TX','CA','CO','HI','NV','UT') THEN 4 -- southwest us
WHEN LEFT(stateprovincecode,2) in ('AL','AK','FL','GA','KY','LA','MS','MO','NC','SC','TN','WV','VA') THEN 5 -- se us
WHEN LEFT(stateprovincecode,2) in ('ON','AB','BC','MB','NB','NL','NT','NS','NU','PE','QC','SK','YT') THEN 6  -- canada
WHEN LEFT(stateprovincecode,2) in ('BB','BE','BW','BY','HB','HE','HH','MV','NI','NW','RP','SH','SL','SN','ST','TH') THEN 8  -- Germany
WHEN LEFT(stateprovincecode,2) in ('NS') THEN 9 -- AUS
WHEN LEFT(stateprovincecode,2) in ('EN') THEN 10 -- UK
else 7 -- France
END AS SalesTerritoryKey
from {{ref ('stg_address') }}
inner join {{ref ('stg_stateprovince') }} as sp using (stateprovinceid)
group by stateprovinceid, name, city, stateprovincecode, countryregioncode, postalcode, salesterritorykey
)
SELECT 
  sum(cnt) over (order by 
  stateprovinceid, name, city, stateprovincecode, countryregioncode, postalcode, salesterritorykey
  asc rows between unbounded preceding and current row) as GeographyKey,
    stateprovinceid, name, city, stateprovincecode, countryregioncode, postalcode, salesterritorykey
  from dim_geography

