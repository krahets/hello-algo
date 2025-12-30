# 0-1 Knapsack Problem

The knapsack problem is an excellent introductory problem for dynamic programming and is one of the most common problem forms in dynamic programming. It has many variants, such as the 0-1 knapsack problem, the unbounded knapsack problem, and the multiple knapsack problem.

In this section, we will first solve the most common 0-1 knapsack problem.

!!! question

    Given $n$ items, where the weight of the $i$-th item is $wgt[i-1]$ and its value is $val[i-1]$, and a knapsack with capacity $cap$. Each item can only be selected once. What is the maximum value that can be placed in the knapsack within the capacity limit?

Observe the figure below. Since item number $i$ starts counting from $1$ and array indices start from $0$, item $i$ corresponds to weight $wgt[i-1]$ and value $val[i-1]$.

![Example data for 0-1 knapsack](knapsack_problem.assets/knapsack_example.png)

We can view the 0-1 knapsack problem as a process consisting of $n$ rounds of decisions, where for each item there are two decisions: not putting it in and putting it in, thus the problem satisfies the decision tree model.

The goal of this problem is to find "the maximum value that can be placed in the knapsack within the capacity limit", so it is more likely to be a dynamic programming problem.

**Step 1: Think about the decisions in each round, define the state, and thus obtain the $dp$ table**

For each item, if not placed in the knapsack, the knapsack capacity remains unchanged; if placed in, the knapsack capacity decreases. From this, we can derive the state definition: current item number $i$ and knapsack capacity $c$, denoted as $[i, c]$.

State $[i, c]$ corresponds to the subproblem: **the maximum value among the first $i$ items in a knapsack of capacity $c$**, denoted as $dp[i, c]$.

What we need to find is $dp[n, cap]$, so we need a two-dimensional $dp$ table of size $(n+1) \times (cap+1)$.

**Step 2: Identify the optimal substructure, and then derive the state transition equation**

After making the decision for item $i$, what remains is the subproblem of the first $i-1$ items, which can be divided into the following two cases.

- **Not putting item $i$**: The knapsack capacity remains unchanged, and the state changes to $[i-1, c]$.
- **Putting item $i$**: The knapsack capacity decreases by $wgt[i-1]$, the value increases by $val[i-1]$, and the state changes to $[i-1, c-wgt[i-1]]$.

The above analysis reveals the optimal substructure of this problem: **the maximum value $dp[i, c]$ equals the larger value between not putting item $i$ and putting item $i$**. From this, the state transition equation can be derived:

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

Note that if the weight of the current item $wgt[i - 1]$ exceeds the remaining knapsack capacity $c$, then the only option is not to put it in the knapsack.

**Step 3: Determine boundary conditions and state transition order**

When there are no items or the knapsack capacity is $0$, the maximum value is $0$, i.e., the first column $dp[i, 0]$ and the first row $dp[0, c]$ are both equal to $0$.

The current state $[i, c]$ is transferred from the state above $[i-1, c]$ and the state in the upper-left $[i-1, c-wgt[i-1]]$, so the entire $dp$ table is traversed in order through two nested loops.

Based on the above analysis, we will next implement the brute force search, memoization, and dynamic programming solutions in order.

### Method 1: Brute Force Search

The search code includes the following elements.

- **Recursive parameters**: state $[i, c]$.
- **Return value**: solution to the subproblem $dp[i, c]$.
- **Termination condition**: when the item number is out of bounds $i = 0$ or the remaining knapsack capacity is $0$, terminate recursion and return value $0$.
- **Pruning**: if the weight of the current item exceeds the remaining knapsack capacity, only the option of not putting it in is available.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs}
```

As shown in the figure below, since each item generates two search branches of not selecting and selecting, the time complexity is $O(2^n)$.

Observing the recursion tree, it is easy to see overlapping subproblems, such as $dp[1, 10]$. When there are many items, large knapsack capacity, and especially many items with the same weight, the number of overlapping subproblems will increase significantly.

![Brute force search recursion tree for 0-1 knapsack problem](knapsack_problem.assets/knapsack_dfs.png)

### Method 2: Memoization

To ensure that overlapping subproblems are only computed once, we use a memo list `mem` to record the solutions to subproblems, where `mem[i][c]` corresponds to $dp[i, c]$.

After introducing memoization, **the time complexity depends on the number of subproblems**, which is $O(n \times cap)$. The implementation code is as follows:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs_mem}
```

The figure below shows the search branches pruned in memoization.

![Memoization recursion tree for 0-1 knapsack problem](knapsack_problem.assets/knapsack_dfs_mem.png)

### Method 3: Dynamic Programming

Dynamic programming is essentially the process of filling the $dp$ table during state transitions. The code is as follows:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp}
```

As shown in the figure below, both time complexity and space complexity are determined by the size of the array `dp`, which is $O(n \times cap)$.

=== "<1>"
    ![Dynamic programming process for 0-1 knapsack problem](knapsack_problem.assets/knapsack_dp_step1.png)

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png)

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png)

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png)

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png)

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png)

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png)

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png)

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png)

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png)

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png)

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png)

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png)

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png)

### Space Optimization

Since each state is only related to the state in the row above it, we can use two arrays rolling forward to reduce the space complexity from $O(n^2)$ to $O(n)$.

Further thinking, can we achieve space optimization using just one array? Observing, we can see that each state is transferred from the cell directly above or the cell in the upper-left. If there is only one array, when we start traversing row $i$, that array still stores the state of row $i-1$.

- If using forward traversal, then when traversing to $dp[i, j]$, the values in the upper-left $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ may have already been overwritten, thus preventing correct state transition.
- If using reverse traversal, there will be no overwriting issue, and state transition can proceed correctly.

The figure below shows the transition process from row $i = 1$ to row $i = 2$ using a single array. Please consider the difference between forward and reverse traversal.

=== "<1>"
    ![Space-optimized dynamic programming process for 0-1 knapsack](knapsack_problem.assets/knapsack_dp_comp_step1.png)

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png)

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png)

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png)

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png)

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png)

In the code implementation, we simply need to delete the first dimension $i$ of the array `dp` and change the inner loop to reverse traversal:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp_comp}
```
