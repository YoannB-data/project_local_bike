SELECT
  category_id,
  category_name
FROM {{ source('database', 'categories') }}