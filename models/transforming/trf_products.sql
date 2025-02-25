{{config(materialized='table',schema=env_var('DBT_TRANSFORMINGSCHEMA', 'transforming_dev'))}}

select
P.productid,
p.productname,
c.categoryname,
s.companyname as suppliercompanyname,
s.ContactName as suppliername,
s.city as suppliercity,
s.country as suppliercountry,
p.quantityperunit,
p.UnitCost,
p.unitprice,
p.unitsinstock,
TO_DECIMAL(p.unitprice-p.UnitCost,9,2) as profit,
iff(p.unitsonorder > p.unitsinstock,'Not Available','Available') as productavailablity
from
{{ref("stg_products")}} as p left join {{ref("trf_suppliers")}} as s
on p.SupplierID=s.SupplierID
left join {{ref("lkp_categories")}} as c on c.categoryid=p.categoryid