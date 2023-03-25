with customers as (select * from {{ref('stg_customers')}}),
orders as (select * from {{ref('stg_orders')}}),
payments as (select * from {{ref('stg_payments')}}),
final as (select 
c.first_name,c.last_name,c.customer_id,o.order_id,o.order_date,o.status,p.paymentmethod,p.status as ptm_status,p.amount
from 
orders o left join 
customers c  on o.customer_id=c.customer_id
inner join 
payments p on o.order_id=p.orderid

)
select * from final