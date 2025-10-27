SELECT
    customer_id, 
    first_name, 
    last_name, 
    phone, 
    email, 
    street, 
    city, 
    state, 
    zip_code

from {{ source('database', 'customers') }}