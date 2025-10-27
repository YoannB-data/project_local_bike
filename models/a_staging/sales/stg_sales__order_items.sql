SELECT 
  CONCAT(order_id, '_', item_id) AS order_item_id,
  order_id,
  item_id,
  product_id,
  quantity,
  list_price,
  discount
FROM {{ source('database', 'order_items') }}