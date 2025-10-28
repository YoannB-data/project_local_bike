select
    cast(product_id as int64) as product_id,
    cast(product_name as string) as product_name,
    cast(brand_id as int64) as brand_id,
    cast(category_id as int64) as category_id,
    cast(model_year as int64) as model_year,
    cast(list_price as float64) as list_price

from {{ source("database", "products") }}
