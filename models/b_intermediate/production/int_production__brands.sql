with cte_main as(
    select
        b.brand_id as brand_id, 
        b.brand_name as brand_name,
        sum(quantity_stock) as quantity_stock,
        sum(quantity_sold) as quantity_sold,
        round(sum(total_item_amount),2) as total_item_amount
    from 
        {{ ref('stg_production__brands') }} as b
    left join
        {{ ref('int_production__products') }} as p
    using(brand_id)
    group by
        brand_id,
        brand_name
)

select 
    *
from
    cte_main