select orderid,count(lineno) as linecount
from {{ref('fct_orders')}}
group by orderid
having linecount < 0