{{ config(materialized='table', schema=env_var('DBT_TRANSFORMINGSCHEMA', 'transforming_dev')) }}

select 
ss.orderid,
ss.LineNo,
sh.companyname,
ss.ShipmentDate,
ss.Status
 from 
{{ ref('shipment_snapshot') }} as ss inner join 
{{ ref('lkp_shippers') }} as sh on ss.shipperid=sh.shipperID 
where ss.DBT_VALID_TO is null