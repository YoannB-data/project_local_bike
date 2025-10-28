SELECT
  cast(brand_id as integer) as brand_id,
  cast(brand_name as string) as brand_name
FROM {{ source('database', 'brands') }}