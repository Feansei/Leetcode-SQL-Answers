# Write your MySQL query statement below
with cte as (
    select
        count(order_number) as temp,
        customer_number
    from orders
    group by customer_number
    order by temp desc
)

select
    customer_number
from cte
limit 1
;
