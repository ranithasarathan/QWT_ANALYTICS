{{config(materialized='table')}}

select 
OrderID,
LineNo,
ShipperID,
CustomerID,
ProductID,
EmployeeID,
split_part(ShipmentDate,' ',0)::date as ShipmentDate,
Status
from {{source("qwt_raw",'raw_shippment')}}