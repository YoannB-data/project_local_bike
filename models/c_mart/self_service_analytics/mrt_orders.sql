{{ config(
    partition_by= {
      "field": "order_date",
      "data_type": "date"
    }
)}}

with cte_main as (
    select
        *
    from {{ ref('int_sales__orders') }}
    order by order_id
)

select 
    *
from 
    cte_main