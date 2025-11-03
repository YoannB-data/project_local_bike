{% docs mrt_abc_classification %}

# ABC Classification Model

This model makes it possible to determine the **ABC ranking** of each product.

ABC analysis is a method to categorize items based on their importance and consumption value.

## Steps to determine the classification

- 1. **Import net revenue** for each product.
- 2. **Order the results** by net revenue, from highest to lowest.
- 3. **Calculate the cumulative sum** of net revenue.
- 4. **Calculate the ratio** between the cumulative sum of each product and the total net revenue of all products.
- 5. **Assign the classification** based on the ratio:
    - If the ratio is below 0.45 → **A**
    - If the ratio is below 0.85 → **B**
    - Else → **C**

{% enddocs %}