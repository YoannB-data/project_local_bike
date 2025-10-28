SELECT
    cast(store_id as int64) as store_id, 
    cast(store_name as string) as store_name, 
    cast(phone as string) as phone, 
    cast(email as string) as email, 
    cast(street as string) as street, 
    cast(city as string) as city, 
    cast(state as string) as state, 
    cast(zip_code as int64) as zip_code

FROM {{ source('database', 'stores') }}