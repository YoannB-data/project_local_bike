with cte_main as (
    select
        *
    from {{ ref('int_production__products') }}
)

select 
    *
from 
    cte_main