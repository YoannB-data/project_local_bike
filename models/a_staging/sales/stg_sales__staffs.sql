SELECT
    cast(staff_id as int64) as staff_id, 
    cast(first_name as string) as first_name, 
    cast(last_name as string) as last_name, 
    cast(email as string) as email, 
    cast(phone as string) as phone, 
    cast(active as int64) as active, 
    cast(store_id as int64) as store_id, 
    safe_cast(manager_id as int64) as manager_id

from {{ source('database', 'staffs') }}