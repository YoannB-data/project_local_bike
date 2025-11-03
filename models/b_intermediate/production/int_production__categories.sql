with cte_main as(
    select
        category_id, 
        category_name
    from 
        {{ ref('stg_production__categories') }}
)

select 
    *
from
    cte_main