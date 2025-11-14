with products_sold as (
    select store_id, 
        product_id, 
        sum(quantity) AS total_item_sold,
        SUM(net_revenue) AS total_net_revenue
    from {{ ref('int_sales__order_items') }}
    group by store_id, 
        product_id
)


select  s.store_id, 
    s.product_id, 
    s.store_name,
    s.product_name, 
    s.quantity as stock_quantity,
    ps.total_item_sold,
    ps.total_net_revenue

from {{ ref('int_production__stocks') }} AS s
left join products_sold as ps
    using (store_id, product_id)