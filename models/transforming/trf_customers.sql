{{config(materialized='incremental',schema=env_var('DBT_TRANSFORMINGSCHEMA', 'transforming_dev'))}}

select
c.customerid,
c.companyname,
c.contactname,
c.city,
c.country,
d.divisionname,
c.address,
c.fax,
c.phone,
c.postalcode,
iff(c.stateprovince='','NA',c.stateprovince) as stateprovincename
from
{{ref('stg_customers')}} c left join
{{ref('lkp_divisions')}} d on c.divisionid = d.divisionid