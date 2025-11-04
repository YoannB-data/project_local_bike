select
    product_id,
    product_name,
    brand_id,
    brand_name,
    category_id,
    category_name,
    model_year,
    list_price
from {{ ref('stg_production__products') }}
left join {{ ref('stg_production__brands') }} 
    using (brand_id)
left join {{ ref('stg_production__categories') }}
    using (category_id)