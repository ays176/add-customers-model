select 
id as paymentid,
orderid as order_id,
paymentmethod as payment_method,
status,
{{cents_to_dollar('amount',4)}} as amount,
created as created_dt
from {{source('stripe','payment')}}