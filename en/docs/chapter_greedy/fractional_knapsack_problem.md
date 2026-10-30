# Fractional knapsack problem

!!! question

    Given $n$ items, where item $i$ has weight $wgt[i-1]$ and value $val[i-1]$, and a knapsack with capacity $cap$, each item may be selected only once. **However, you may take a fraction of an item, with its value proportional to the weight taken**. What is the maximum total value that fits within the knapsack's capacity? An example is shown in the figure below.

![Example input for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_example.png)

The fractional knapsack problem is very similar to the 0-1 knapsack problem. The state consists of the current item $i$ and capacity $c$, and the goal is to maximize value within the knapsack's capacity.

The difference is that we may take only part of an item. As shown in the figure below, **we can divide items into arbitrary fractions and calculate their values in proportion to their weights**.

1. For item $i$, the value per unit weight is $val[i-1] / wgt[i-1]$, which we call its unit value.
2. If we take a portion of item $i$ weighing $w$, the value added to the knapsack is $w \times val[i-1] / wgt[i-1]$.

![Value per unit weight of each item](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png)

### Choosing a greedy strategy

Maximizing the total value in the knapsack **essentially means maximizing the value obtained per unit weight**. This leads to the greedy strategy shown in the figure below.

1. Sort the items by unit value in descending order.
2. Iterate through the items, **greedily choosing the item with the highest unit value at each step**.
3. If the remaining capacity is insufficient, take just enough of the current item to fill the knapsack.

![Greedy strategy for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png)

### Code implementation

We define an `Item` class to make it easier to sort items by unit value. We repeatedly make greedy choices, stopping and returning the result when the knapsack is full:

```src
[file]{fractional_knapsack}-[class]{}-[func]{fractional_knapsack}
```

Built-in sorting algorithms typically take $O(n \log n)$ time and $O(\log n)$ or $O(n)$ space, depending on the programming language's implementation.

Apart from sorting, the worst case requires traversing the entire item list, **so the time complexity is $O(n)$**, where $n$ is the number of items.

Initializing a list of `Item` objects requires **$O(n)$ space**.

### Proof of correctness

We use proof by contradiction. Suppose item $x$ has the highest unit value, and an algorithm produces a maximum value of `res`, but its solution does not include item $x$.

Now remove one unit of weight of any item from the knapsack and replace it with one unit of weight of item $x$. Since $x$ has the highest unit value, the total value after replacement must exceed `res`. **This contradicts the assumption that `res` is optimal, showing that an optimal solution must include item $x$**.

We can construct the same contradiction for other items in the solution. Thus, **an item with a higher unit value is always a better choice**, which establishes the greedy strategy.

As shown in the figure below, if we plot item weight on the horizontal axis and unit value on the vertical axis, the fractional knapsack problem becomes a problem of maximizing the area within a limited horizontal interval. This analogy provides a geometric view of why the greedy strategy works.

![Geometric representation of the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png)
