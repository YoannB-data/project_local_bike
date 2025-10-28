select
    cast(customer_id as int64) as customer_id,
    cast(first_name as string) as first_name,
    cast(last_name as string) as last_name,
    cast(phone as string) as phone,
    cast(email as string) as email,
    cast(street as string) as street,
    cast(city as string) as city,
    cast(state as string) as state,
    cast(zip_code as int64) as zip_code

from {{ source("database", "customers") }}
