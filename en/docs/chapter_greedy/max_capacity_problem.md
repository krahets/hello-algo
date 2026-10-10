# Max Capacity Problem

!!! question

    Given an array $ht$, where each element represents the height of a vertical partition. Any two partitions in the array, together with the space between them, can form a container.

    The capacity of the container equals the product of its height and width (that is, its area), where the height is determined by the shorter partition and the width is the difference between the array indices of the two partitions.

    Select two partitions in the array such that the capacity of the resulting container is maximized, and return that maximum capacity. An example is shown in the figure below.

![Example data for the max capacity problem](max_capacity_problem.assets/max_capacity_example.png)

The container is formed by any two partitions, **so the state of this problem is the indices of the two partitions, denoted by $[i, j]$**.

According to the problem statement, capacity equals height multiplied by width, where the height is determined by the shorter partition and the width is the difference between the array indices of the two partitions. Let the capacity be $cap[i, j]$; then we obtain the following formula:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

Let the array length be $n$. Then the number of ways to choose two partitions (that is, the total number of states) is $C_n^2 = \frac{n(n - 1)}{2}$. The most straightforward approach is to **exhaustively enumerate all states** to find the maximum capacity, which has a time complexity of $O(n^2)$.

### Greedy Strategy Determination

This problem has a more efficient solution. As shown in the figure below, consider a state $[i, j]$ where $i < j$ and $ht[i] < ht[j]$. In this case, $i$ is the shorter partition and $j$ is the taller partition.

![Initial state](max_capacity_problem.assets/max_capacity_initial_state.png)

As shown in the figure below, **if we now move the taller partition $j$ inward toward the shorter partition $i$, the capacity will definitely decrease**.

This is because after moving the taller partition $j$, the width $j-i$ definitely decreases. Since the height is determined by the shorter partition, the height can only stay the same ($i$ remains the shorter partition) or decrease ($j$ becomes the shorter partition after being moved).

![State after moving the long partition inward](max_capacity_problem.assets/max_capacity_moving_long_board.png)

Conversely, **only by moving the shorter partition $i$ inward can the capacity possibly increase**. Although the width will definitely decrease, **the height may increase** (the moved partition at $i$ may be taller). For example, in the figure below, the area increases after moving the shorter partition.

![State after moving the short partition inward](max_capacity_problem.assets/max_capacity_moving_short_board.png)

From this, we can derive the greedy strategy for this problem: initialize two pointers at the two ends, and in each round move the pointer corresponding to the shorter partition inward until the two pointers meet.

The figure below shows the execution process of the greedy strategy.

1. In the initial state, pointers $i$ and $j$ are at both ends of the array.
2. Calculate the capacity of the current state $cap[i, j]$, and update the maximum capacity.
3. Compare the heights of partitions $i$ and $j$, and move the pointer corresponding to the shorter partition inward by one position.
4. Repeat steps `2.` and `3.` until $i$ and $j$ meet.

=== "<1>"
    ![Greedy process for the max capacity problem](max_capacity_problem.assets/max_capacity_greedy_step1.png)

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.png)

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.png)

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.png)

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.png)

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.png)

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.png)

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.png)

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.png)

### Code Implementation

The code runs for at most $n$ rounds, **so the time complexity is $O(n)$**.

Variables $i$, $j$, and $res$ use only a constant amount of extra space, **so the space complexity is $O(1)$**.

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### Correctness Proof

The reason greedy is faster than exhaustive enumeration is that each round of greedy selection "skips" some states.

For example, in state $cap[i, j]$, suppose $i$ is the shorter partition and $j$ is the taller partition. If we greedily move the shorter partition $i$ inward by one position, the states shown in the figure below will be "skipped." **This means that their capacities can no longer be checked later**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![States skipped by moving the short partition](max_capacity_problem.assets/max_capacity_skipped_states.png)

A closer look shows that **these skipped states are exactly the states obtained by moving the taller partition $j$ inward**. We have already proven that moving the taller partition inward will definitely decrease the capacity. Therefore, none of the skipped states can be the optimal solution, **so skipping them does not cause us to miss the optimum**.

The above analysis shows that moving the shorter partition is a "safe" operation, and that the greedy strategy is effective.
