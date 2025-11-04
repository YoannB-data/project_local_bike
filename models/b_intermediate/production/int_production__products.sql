with
    cte_products as (
        select
            product_id,
            product_name,
            brand_id,
            brand_name,
            category_id,
            category_name,
            model_year,
            list_price
        from {{ ref('stg_production__products') }}
        left join {{ ref('stg_production__brands') }} 
            using (brand_id)
        left join {{ ref('stg_production__categories') }}
            using (category_id)
    ),

    cte_stock_per_product as (
        select 
            product_id, 
            sum(quantity) as quantity
        from {{ ref('stg_production__stocks') }}
        group by 
            product_id

    ),

    cte_products_sold_per_order as (
        select
            order_item_id,
            product_id,
            quantity,
            discount,
            net_revenue
        from {{ ref('int_sales__order_items') }}
    ),

    cte_product_sold as (
        select
            product_id,
            sum(quantity) as quantity_sold,
            avg(discount) as avg_discount,
            sum(net_revenue) as total_sales_amount
        from cte_products_sold_per_order
        group by product_id
    ),

    cte_main as (
        select
            product_id,
            product_name,
            brand_id,
            brand_name,
            category_id,
            category_name,
            model_year,
            list_price,
            coalesce(quantity, 0) as quantity_stock,
            quantity_sold,
            avg_discount,
            total_sales_amount
        from cte_products
        left join cte_stock_per_product using (product_id)
        left join cte_product_sold using (product_id)
    )

select 
    *
from cte_main