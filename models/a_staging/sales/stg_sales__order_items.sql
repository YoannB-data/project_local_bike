select
    cast(concat(order_id, '_', item_id) as string) as order_item_id,
    cast(order_id as int64) as order_id,
    cast(item_id as int64) as item_id,
    cast(product_id as int64) as product_id,
    cast(quantity as int64) as quantity,
    cast(list_price as float64) as list_price,
    cast(discount as float64) as discount

from {{ source("database", "order_items") }}
