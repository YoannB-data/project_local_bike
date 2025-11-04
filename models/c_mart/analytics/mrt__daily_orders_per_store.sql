/*{{ config(
    partition_by= {
      "field": "order_date",
      "data_type": "date"
    }
)}}*/

with cte_orders as (
    select
        order_date, 
        store_name,
        sum(total_quantity) as quantity_ordered,
        sum(total_list_price) as gross_ordered_value,
        sum(total_net_revenue) as net_ordered_value
    from {{ ref('int_sales__orders') }}
    group by 
        order_date,
        store_name
    order by
        order_date,
        store_name
)

select 
    *
from 
    cte_orders