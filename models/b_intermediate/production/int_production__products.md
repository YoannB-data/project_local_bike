{% docs int_production__products %}

This model provides an aggregated view of products, combining data from multiple sources such as brands, categories, stocks and order items. It enriches the order data with the following metrics:

- **Quantity stock**: The sum of all stocks for each stores.
- **Quantity sold**: The total quantity of items sold.
- **Average discount**: The average discount apply to the item.
- **Total sales amount**: Sum of all sales done.

It provides a comprehensive view of each product, allowing for easy analysis of product performance and stock management.

{% enddocs %}
