-- top 10 most valuable customers based on completed orders

with
    fct_orders as (select * from {{ ref("fct_orders") }}),

    dim_customers as (select * from {{ ref("dim_customers") }})

select cust.customer_id, cust.first_name, sum(ord.total_amount) as global_paid_amount
from fct_orders ord
left join dim_customers cust using (customer_id)
where ord.is_order_completed = 1
group by cust.customer_id, cust.first_name
order by 3 desc
limit 10
