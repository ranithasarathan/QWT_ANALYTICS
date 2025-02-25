{{config(materialized='view',schema='reporting_dev')}}

select
e.officecity,
c.companyname,
c.contactname,
count(o.orderid) as total_orders,
sum(o.quantity) as total_quantity,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin
from
{{ref('fct_customers')}} c inner join
{{ref('fct_orders')}} o on c.customerid=o.customerid inner join
{{ref('dim_employees')}} e on o.employeeid =e.employee_id
where e.officecity='{{var('v_city','Paris')}}'
group by e.officecity,c.companyname,c.contactname


