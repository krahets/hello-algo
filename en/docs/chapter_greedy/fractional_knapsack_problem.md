# Fractional Knapsack Problem

!!! question

    Given $n$ items, where the weight of the $i$-th item is $wgt[i-1]$ and its value is $val[i-1]$, and a knapsack with capacity $cap$. Each item can be selected only once, **but a portion of an item can be selected, with the value calculated based on the proportion of weight selected**, what is the maximum value of items in the knapsack under the limited capacity? An example is shown in the figure below.

![Example data for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_example.png)

The fractional knapsack problem is very similar overall to the 0-1 knapsack problem, with states including the current item $i$ and capacity $c$, and the goal being to maximize value under the limited knapsack capacity.

The difference is that this problem allows selecting only a portion of an item. As shown in the figure below, **we can arbitrarily split items and calculate the corresponding value based on the weight proportion**.

1. For item $i$, its value per unit weight is $val[i-1] / wgt[i-1]$, referred to as unit value.
2. Suppose we put a portion of item $i$ with weight $w$ into the knapsack, then the value added to the knapsack is $w \times val[i-1] / wgt[i-1]$.

![Value of items per unit weight](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png)

### Greedy Strategy Determination

Maximizing the total value of items in the knapsack **is essentially maximizing the value per unit weight of items**. From this, we can derive the greedy strategy shown in the figure below.

1. Sort items by unit value from high to low.
2. Iterate through all items, **greedily selecting the item with the highest unit value in each round**.
3. If the remaining knapsack capacity is insufficient, use a portion of the current item to fill the knapsack.

![Greedy strategy for the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png)

### Code Implementation

We created an `Item` class to facilitate sorting items by unit value. We loop to make greedy selections, breaking when the knapsack is full and returning the solution:

```src
[file]{fractional_knapsack}-[class]{}-[func]{fractional_knapsack}
```

The time complexity of built-in sorting algorithms is usually $O(\log n)$, and the space complexity is usually $O(\log n)$ or $O(n)$, depending on the specific implementation of the programming language.

Apart from sorting, in the worst case the entire item list needs to be traversed, **therefore the time complexity is $O(n)$**, where $n$ is the number of items.

Since an `Item` object list is initialized, **the space complexity is $O(n)$**.

### Correctness Proof

Using proof by contradiction. Suppose item $x$ has the highest unit value, and some algorithm yields a maximum value of `res`, but this solution does not include item $x$.

Now remove a unit weight of any item from the knapsack and replace it with a unit weight of item $x$. Since item $x$ has the highest unit value, the total value after replacement will definitely be greater than `res`. **This contradicts the assumption that `res` is the optimal solution, proving that the optimal solution must include item $x$**.

For other items in this solution, we can also construct the above contradiction. In summary, **items with greater unit value are always better choices**, which proves that the greedy strategy is effective.

As shown in the figure below, if we view item weight and item unit value as the horizontal and vertical axes of a two-dimensional chart respectively, then the fractional knapsack problem can be transformed into "finding the maximum area enclosed within a limited horizontal axis range". This analogy can help us understand the effectiveness of the greedy strategy from a geometric perspective.

![Geometric representation of the fractional knapsack problem](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png)
