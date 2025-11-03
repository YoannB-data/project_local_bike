with cte_main as(
    select
        brand_id, 
        brand_name
    from 
        {{ ref('stg_production__brands') }}
)

select 
    *
from
    cte_main