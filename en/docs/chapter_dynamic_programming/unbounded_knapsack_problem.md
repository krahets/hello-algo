# Unbounded knapsack problem

In this section, we first solve another common knapsack problem: the unbounded knapsack, and then explore a special case of it: the coin change problem.

## Unbounded knapsack problem

!!! question

    Given $n$ items, where the weight of the $i^{th}$ item is $wgt[i-1]$ and its value is $val[i-1]$, and a backpack with a capacity of $cap$. **Each item can be selected multiple times**. What is the maximum value of the items that can be put into the backpack without exceeding its capacity? See the example below.

![Example data for the unbounded knapsack problem](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png)

### Dynamic programming approach

The unbounded knapsack problem is very similar to the 0-1 knapsack problem, **the only difference being that there is no limit on the number of times an item can be chosen**.

- In the 0-1 knapsack problem, there is only one of each item, so after placing item $i$ into the backpack, you can only choose from the previous $i-1$ items.
- In the unbounded knapsack problem, the quantity of each item is unlimited, so after placing item $i$ in the backpack, **you can still choose from the previous $i$ items**.

Under the rules of the unbounded knapsack problem, the state $[i, c]$ can change in two ways.

- **Not putting item $i$ in**: As with the 0-1 knapsack problem, transition to $[i-1, c]$.
- **Putting item $i$ in**: Unlike the 0-1 knapsack problem, transition to $[i, c-wgt[i-1]]$.

The state transition equation thus becomes:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### Code implementation

Comparing the code for the two problems, the state transition changes from $i-1$ to $i$, the rest is completely identical:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp}
```

### Space optimization

Since the current state comes from the state to the left and above, **the space-optimized solution should perform a forward traversal for each row in the $dp$ table**.

This traversal order is the opposite of that for the 0-1 knapsack. Please refer to the figure below to understand the difference.

=== "<1>"
    ![Dynamic programming process for the unbounded knapsack problem after space optimization](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png)

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png)

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png)

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png)

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png)

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png)

The code implementation is quite simple, just remove the first dimension of the array `dp`:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp_comp}
```

## Coin change problem

The knapsack problem is a representative of a large class of dynamic programming problems and has many variants, such as the coin change problem.

!!! question

    Given $n$ types of coins, the denomination of the $i^{th}$ type of coin is $coins[i - 1]$, and the target amount is $amt$. **Each type of coin can be selected multiple times**. What is the minimum number of coins needed to make up the target amount? If it is impossible to make up the target amount, return $-1$. See the example below.

![Example data for the coin change problem](unbounded_knapsack_problem.assets/coin_change_example.png)

### Dynamic programming approach

**The coin change can be seen as a special case of the unbounded knapsack problem**, sharing the following similarities and differences.

- The two problems can be converted into each other: "item" corresponds to "coin", "item weight" corresponds to "coin denomination", and "backpack capacity" corresponds to "target amount".
- The optimization goals are opposite: the unbounded knapsack problem aims to maximize the value of items, while the coin change problem aims to minimize the number of coins.
- The unbounded knapsack problem seeks solutions "not exceeding" the backpack capacity, while the coin change seeks solutions that "exactly" make up the target amount.

**First step: Think through each round's decision-making, define the state, and thus derive the $dp$ table**

The state $[i, a]$ corresponds to the sub-problem: **the minimum number of coins that can make up the amount $a$ using the first $i$ types of coins**, denoted as $dp[i, a]$.

The two-dimensional $dp$ table is of size $(n+1) \times (amt+1)$.

**Second step: Identify the optimal substructure and derive the state transition equation**

This problem differs from the unbounded knapsack problem in two aspects of the state transition equation.

- This problem seeks the minimum, so the operator $\max()$ needs to be changed to $\min()$.
- The optimization is focused on the number of coins, so simply add $+1$ when a coin is chosen.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Third step: Define boundary conditions and state transition order**

When the target amount is $0$, the minimum number of coins needed to make it up is $0$, so all $dp[i, 0]$ in the first column are $0$.

When there are no coins, **it is impossible to make up any amount >0**, which is an invalid solution. To allow the $\min()$ function in the state transition equation to recognize and filter out invalid solutions, consider using $+\infty$ to represent them, i.e., set all $dp[0, a]$ in the first row to $+\infty$.

### Code implementation

Most programming languages do not provide a $+\infty$ variable, only the maximum value of an integer `int` can be used as a substitute. This can lead to overflow: the $+1$ operation in the state transition equation may overflow.

For this reason, we use the number $amt + 1$ to represent an invalid solution, because the maximum number of coins needed to make up $amt$ is at most $amt$. Before returning the result, check if $dp[n, amt]$ equals $amt + 1$, and if so, return $-1$, indicating that the target amount cannot be made up. The code is as follows:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp}
```

The figure below show the dynamic programming process for the coin change problem, which is very similar to the unbounded knapsack problem.

=== "<1>"
    ![Dynamic programming process for the coin change problem](unbounded_knapsack_problem.assets/coin_change_dp_step1.png)

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png)

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png)

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png)

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png)

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png)

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png)

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png)

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png)

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png)

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png)

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png)

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png)

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png)

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png)

### Space optimization

The space optimization for the coin change problem is handled in the same way as for the unbounded knapsack problem:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp_comp}
```

## Coin change problem II

!!! question

    Given $n$ types of coins, where the denomination of the $i^{th}$ type of coin is $coins[i - 1]$, and the target amount is $amt$. Each type of coin can be selected multiple times, **ask how many combinations of coins can make up the target amount**. See the example below.

![Example data for Coin Change Problem II](unbounded_knapsack_problem.assets/coin_change_ii_example.png)

### Dynamic programming approach

Compared to the previous problem, the goal of this problem is to determine the number of combinations, so the sub-problem becomes: **the number of combinations that can make up amount $a$ using the first $i$ types of coins**. The $dp$ table remains a two-dimensional matrix of size $(n+1) \times (amt + 1)$.

The number of combinations for the current state is the sum of the combinations from not selecting the current coin and selecting the current coin. The state transition equation is:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

When the target amount is $0$, no coins are needed to make up the target amount, so all $dp[i, 0]$ in the first column should be initialized to $1$. When there are no coins, it is impossible to make up any amount >0, so all $dp[0, a]$ in the first row should be set to $0$.

### Code implementation

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp}
```

### Space optimization

The space optimization approach is the same, just remove the coin dimension:

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp_comp}
```
