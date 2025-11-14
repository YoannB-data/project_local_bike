SELECT
    store_id,
    product_id,
    quantity
FROM {{ ref('stg_production__stocks') }}
WHERE quantity < 0