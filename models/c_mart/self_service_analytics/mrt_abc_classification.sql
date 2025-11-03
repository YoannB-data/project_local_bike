with cte_rank_and_cumulative_sum as (
    select
        product_id,
        total_sales_amount,
        ROW_NUMBER() OVER (ORDER BY total_sales_amount DESC) AS rank,
        SUM(total_sales_amount) OVER (ORDER BY total_sales_amount DESC) AS cumulative_sales
    from 
        {{ ref('int_production__products') }}

),

cte_sum_sales as (
    select 
        product_id,
        total_sales_amount,
        rank,
        cumulative_sales,
        (cumulative_sales / (select max(cumulative_sales) from cte_rank_and_cumulative_sum) ) as cumulative_sales_ratio
    from 
        cte_rank_and_cumulative_sum
),

cte_abc as (
    select 
        product_id,
        total_sales_amount,
        rank,
        cumulative_sales,
        cumulative_sales_ratio,
        case
            when cumulative_sales_ratio < 0.45 then "A"
            when cumulative_sales_ratio < 0.85 then "B"
            else "C"
        end as abc_classification
    from 
        cte_sum_sales
)

select 
    product_id,
    abc_classification
from 
    cte_abc