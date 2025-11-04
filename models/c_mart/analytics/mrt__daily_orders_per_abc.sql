/*{{ config(
    partition_by= {
      "field": "order_date",
      "data_type": "date"
    }
)}}*/

with cte_group_order_items as (
    select
        order_id,
        product_id,
        sum(quantity) as quantity_ordered,
        sum(list_price) as gross_ordered_value,
        sum(net_revenue) as net_ordered_value
    from {{ ref('int_sales__order_items') }}
    group by 
        order_id,
        product_id
),

cte_main as (
    select
        order_date,
        abc_classification,
        sum(quantity_ordered) as quantity_ordered,
        sum(gross_ordered_value) as gross_ordered_value,
        sum(net_ordered_value) as net_ordered_value
    from cte_group_order_items
    left join {{ ref('int_sales__orders') }}
        using(order_id)
    left join {{ ref('int_production__products') }}
        using(product_id)
    left join {{ ref('fct__abc_classification') }}
        using(product_id)
    group by 
        order_date,
        abc_classification
    order by
        order_date,
        abc_classification
)


select 
    *
from 
    cte_main