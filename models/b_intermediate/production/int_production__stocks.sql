with cte_main as(
    select
        store_id, 
        product_id,
        quantity
    from 
        {{ ref('stg_production__stocks') }}
)

select 
    *
from
    cte_main