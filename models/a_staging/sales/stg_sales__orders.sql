SELECT 
    cast(order_id as int64) as order_id, 
    cast(customer_id as int64) as customer_id, 
    cast(order_status as int64) as order_status, 
    cast(order_date as date) as order_date, 
    cast(required_date as date) as required_date,
    safe_cast(shipped_date as date) as shipped_date, 
    cast(store_id as int64) as store_id, 
    cast(staff_id as int64) as staff_id

FROM {{ source('database', 'orders') }}