with cte_products as (
    select
        product_id,
        product_name,
        brand_name,
        category_name
    from {{ ref('int_production__products') }} 

),

cte_stores as (
    select
        store_id,
        store_name,
        city as store_city,
        state as store_state
    from {{ ref('stg_sales__stores') }}

),

cte_main as(
    select
        stock_id,
        product_id,
        product_name,
        brand_name,
        category_name,
        store_id, 
        store_name,
        store_city,
        store_state,
        quantity
    from 
        {{ ref('stg_production__stocks') }}
    left join cte_products
        using(product_id)
    left join cte_stores
        using(store_id)
)

select 
    *
from
    cte_main