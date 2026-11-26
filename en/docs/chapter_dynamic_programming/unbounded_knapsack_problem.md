# The unbounded knapsack problem

In this section, we'll solve another common knapsack problem, unbounded knapsack, and explore a special case: coin change.

## The unbounded knapsack problem

!!! question

    Given $n$ item types, where type $i$ has weight $wgt[i-1]$ and value $val[i-1]$, and a knapsack of capacity $cap$, **you can take multiple copies of each type**. Find the maximum total value you can pack within the capacity limit. The figure below shows an example.

![Example input for unbounded knapsack](unbounded_knapsack_problem.assets/unbounded_knapsack_example.svg)

### A dynamic programming approach

Unbounded knapsack closely resembles 0-1 knapsack. **The only difference is that a type can be taken any number of times**.

- In 0-1 knapsack, each item is available once. After packing item $i$, we can choose only from the first $i-1$ items.
- In unbounded knapsack, each type has an unlimited supply. After packing item $i$, **we can still choose from the first $i$ types**.

Under these rules, state $[i, c]$ has two possible transitions.

- **Skip item $i$**. As in 0-1 knapsack, the remaining state is $[i-1, c]$.
- **Take item $i$**. Unlike 0-1 knapsack, the remaining state is $[i, c-wgt[i-1]]$.

The recurrence therefore becomes:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### Implementation

Comparing the code for the two problems, just one index in the transition changes from $i-1$ to $i$. The rest is identical:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp}
```

### Space optimization

Each state depends on the cells to its left and above it. **After reducing space, traverse each row of the $dp$ table in forward order**.

This is the opposite of the order for 0-1 knapsack. The figure below illustrates the difference.

=== "<1>"
    ![Solving unbounded knapsack with a space-optimized dp table](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.svg)

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.svg)

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.svg)

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.svg)

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.svg)

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.svg)

To implement this, simply remove the first dimension of the array `dp`:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp_comp}
```

## The coin change problem

Knapsack represents a large family of dynamic programming problems with many variants, including coin change.

!!! question

    Given $n$ coin types, where type $i$ has denomination $coins[i - 1]$, and a target amount $amt$, **each denomination can be used repeatedly**. Find the fewest coins that make the target amount. Return $-1$ if the amount cannot be made. The figure below shows an example.

![Example input for coin change](unbounded_knapsack_problem.assets/coin_change_example.svg)

### A dynamic programming approach

**Coin change can be viewed as a special case of unbounded knapsack**. The two problems correspond in the following ways and differ in their goals.

- We can map one problem to the other: items correspond to coins, item weights to denominations, and knapsack capacity to the target amount.
- Their objectives point in opposite directions. Unbounded knapsack maximizes item value, while coin change minimizes coin count.
- Unbounded knapsack asks for a solution within the capacity limit. Coin change requires the target amount exactly.

**Step 1: Identify the decision at each step and define the state and $dp$ table**

The subproblem for state $[i, a]$ is **the fewest coins from the first $i$ types that can make amount $a$**. Write its solution as $dp[i, a]$.

The two-dimensional $dp$ table has dimensions $(n+1) \times (amt+1)$.

**Step 2: Identify optimal substructure and derive the recurrence**

The recurrence differs from unbounded knapsack in two ways.

- We want a minimum, so replace the operator $\max()$ with $\min()$.
- We optimize the number of coins rather than item value, so taking a coin contributes $+1$.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Step 3: Determine the boundary conditions and the order of computation**

For target amount $0$, the minimum number of coins is $0$. Thus all entries $dp[i, 0]$ in the first column equal $0$.

With no coins, **no target amount $> 0$ can be made**. Such a state has no valid solution. To let $\min()$ ignore invalid candidates, we could represent them by $+ \infty$, setting the first-row entries $dp[0, a]$ for positive amounts to $+ \infty$.

### Implementation

Most programming languages do not provide an integer value for $+ \infty$. Substituting the largest `int` value can cause overflow in the recurrence's $+ 1$ operation.

Instead, use $amt + 1$ for an invalid solution: making amount $amt$ can require at most $amt$ coins. Before returning, check whether $dp[n, amt]$ equals $amt + 1$. If it does, return $-1$ to indicate the target is unreachable. Here is the code:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp}
```

The figure below traces dynamic programming for coin change. It closely resembles unbounded knapsack.

=== "<1>"
    ![Solving coin change with dynamic programming](unbounded_knapsack_problem.assets/coin_change_dp_step1.svg)

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.svg)

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.svg)

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.svg)

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.svg)

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.svg)

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.svg)

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.svg)

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.svg)

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.svg)

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.svg)

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.svg)

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.svg)

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.svg)

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.svg)

### Space optimization

Coin change uses the same space optimization as unbounded knapsack:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp_comp}
```

## Coin change II

!!! question

    Given $n$ denominations, where type $i$ has value $coins[i - 1]$, and a target amount $amt$, each denomination can be used repeatedly. **How many coin combinations make the target amount?** The figure below shows an example.

![Example input for coin change II](unbounded_knapsack_problem.assets/coin_change_ii_example.svg)

### A dynamic programming approach

Here we count combinations, so the subproblem becomes **the number of combinations of the first $i$ denominations that make amount $a$**. The $dp$ table is still a two-dimensional matrix of size $(n+1) \times (amt + 1)$.

The number of combinations for a state is the sum of the counts for skipping and taking the current coin. The recurrence is:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

When the target amount is $0$, taking no coins makes it exactly. Initialize all entries $dp[i, 0]$ in the first column to $1$. With no coins, no target amount $>0$ can be made, so all first-row entries $dp[0, a]$ for positive amounts equal $0$.

### Implementation

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp}
```

### Space optimization

Use the same space optimization by removing the coin dimension:

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp_comp}
```
