-- checks if the total_amount attribute inside int_payment_type_amount_per_order only has non-negative values

select
    order_id,
    sum(total_amount) as total_amount
from {{ ref('int_payment_type_amount_per_order') }}
group by 1
having total_amount < 0