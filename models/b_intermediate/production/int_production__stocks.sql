with cte_product_price as (
    select distinct
        product_id,
        list_price
    from
        {{ ref('int_production__products') }}
),

cte_main as(
    select
        store_id as store_id, 
        s.product_id as product_id,
        quantity,
        list_price,
        round((quantity * list_price),2) as gross_value
    from 
        {{ ref('stg_production__stocks') }} as s
    left join
        cte_product_price as p
    using(product_id)
)

select 
    *
from
    cte_main