{{ config(materialized='table', schema=env_var('DBT_TRANSFORMINGSCHEMA', 'transforming_dev')) }}

select
GET(XMLGET(supplierdata,'SupplierID'),'$')::number as SupplierID,
GET(XMLGET(supplierdata,'CompanyName'),'$')::varchar as CompanyName,
GET(XMLGET(supplierdata,'ContactName'),'$')::varchar as ContactName,
GET(XMLGET(supplierdata,'Address'),'$')::varchar as Address,
GET(XMLGET(supplierdata,'City'),'$')::varchar as City,
GET(XMLGET(supplierdata,'PostalCode'),'$')::varchar as PostalCode,
GET(XMLGET(supplierdata,'Country'),'$')::varchar as Country,
GET(XMLGET(supplierdata,'Phone'),'$')::varchar as Phone,
GET(XMLGET(supplierdata,'Fax'),'$')::varchar as Fax
from 
{{ref('stg_suppliers')}}


