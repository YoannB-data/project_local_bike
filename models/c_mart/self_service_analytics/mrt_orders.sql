with cte_main as (
    select
        *
    from {{ ref('int_sales__orders') }}
)

select 
    *
from 
    cte_main