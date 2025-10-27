SELECT 
    order_id, 
    customer_id, 
    order_status, 
    DATETIME(order_date, "Europe/Paris") AS order_date, 
    DATETIME(required_date, "Europe/Paris") AS required_date,
    DATETIME(shipped_date, "Europe/Paris") AS shipped_date, 
    store_id, 
    staff_id

FROM {{ source('database', 'orders') }}