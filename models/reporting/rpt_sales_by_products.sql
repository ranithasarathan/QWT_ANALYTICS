{{config(materialized='view',schema='reporting_dev')}}

select
c.companyname,
c.contactname,
count(p.productid) as total_products,
count(o.orderid) as total_orders,
sum(o.quantity) as total_quantity,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin,
min(orderdate) as first_order_date,
max(orderdate) as recent_order_date
from
{{ref('fct_customers')}} c inner join
{{ref('fct_orders')}} o on c.customerid=o.customerid inner join
{{ref('dim_products')}} p on o.productid =p.productid
group by c.companyname,c.contactname
