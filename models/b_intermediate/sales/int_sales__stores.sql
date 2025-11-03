with cte_main as (
    select  
        store_id, 
        store_name, 
        phone, 
        email, 
        street, 
        city, 
        state, 
        zip_code
    from {{ ref('stg_sales__stores') }}
)

select
    * 
from 
    cte_main