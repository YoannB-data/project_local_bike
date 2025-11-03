with cte_main as (
    select
        *
    from {{ ref('int_production__products') }}
    order by product_id
)

select 
    *
from 
    cte_main