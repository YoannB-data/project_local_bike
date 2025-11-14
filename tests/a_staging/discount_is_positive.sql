SELECT
    order_item_id,
    discount
FROM {{ ref('stg_sales__order_items') }}
WHERE discount < 0