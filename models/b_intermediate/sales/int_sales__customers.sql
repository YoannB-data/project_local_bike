with cte_group_orders_per_customer as (
    select
        customer_id,
        sum(total_quantity) as quantity_purchased,
        sum(total_net_revenue) as total_purchases
    from {{ ref('int_sales__orders') }}
    group by customer_id
),

cte_main (
    select
        customer_id,
        first_name,
        last_name,
        concat(first_name, ' ', last_name) as customer_name,
        phone,
        email,
        street,
        city,
        state,
        zip_code,
        quantity_purchased,
        total_purchases
    from {{ ref('stg_sales__customers') }}
    left join cte_group_orders_per_customer
    using(customer_id)
)

select
    *
from
    cte_main
