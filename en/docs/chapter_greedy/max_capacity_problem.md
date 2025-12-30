# Max Capacity Problem

!!! question

    Input an array $ht$, where each element represents the height of a vertical partition. Any two partitions in the array, along with the space between them, can form a container.

    The capacity of the container equals the product of height and width (area), where the height is determined by the shorter partition, and the width is the difference in array indices between the two partitions.

    Please select two partitions in the array such that the capacity of the formed container is maximized, and return the maximum capacity. An example is shown in the figure below.

![Example data for the max capacity problem](max_capacity_problem.assets/max_capacity_example.png)

The container is formed by any two partitions, **therefore the state of this problem is the indices of two partitions, denoted as $[i, j]$**.

According to the problem description, capacity equals height multiplied by width, where height is determined by the shorter partition, and width is the difference in array indices between the two partitions. Let the capacity be $cap[i, j]$, then the calculation formula is:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

Let the array length be $n$, then the number of combinations of two partitions (total number of states) is $C_n^2 = \frac{n(n - 1)}{2}$. Most directly, **we can exhaustively enumerate all states** to find the maximum capacity, with time complexity $O(n^2)$.

### Greedy Strategy Determination

This problem has a more efficient solution. As shown in the figure below, select a state $[i, j]$ where index $i < j$ and height $ht[i] < ht[j]$, meaning $i$ is the short partition and $j$ is the long partition.

![Initial state](max_capacity_problem.assets/max_capacity_initial_state.png)

As shown in the figure below, **if we now move the long partition $j$ closer to the short partition $i$, the capacity will definitely decrease**.

This is because after moving the long partition $j$, the width $j-i$ definitely decreases; and since height is determined by the short partition, the height can only remain unchanged ($i$ is still the short partition) or decrease (the moved $j$ becomes the short partition).

![State after moving the long partition inward](max_capacity_problem.assets/max_capacity_moving_long_board.png)

Conversely, **we can only possibly increase capacity by contracting the short partition $i$ inward**. Because although width will definitely decrease, **height may increase** (the moved short partition $i$ may become taller). For example, in the figure below, the area increases after moving the short partition.

![State after moving the short partition inward](max_capacity_problem.assets/max_capacity_moving_short_board.png)

From this we can derive the greedy strategy for this problem: initialize two pointers at both ends of the container, and in each round contract the pointer corresponding to the short partition inward, until the two pointers meet.

The figure below shows the execution process of the greedy strategy.

1. In the initial state, pointers $i$ and $j$ are at both ends of the array.
2. Calculate the capacity of the current state $cap[i, j]$, and update the maximum capacity.
3. Compare the heights of partition $i$ and partition $j$, and move the short partition inward by one position.
4. Loop through steps `2.` and `3.` until $i$ and $j$ meet.

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

The code loops at most $n$ rounds, **therefore the time complexity is $O(n)$**.

Variables $i$, $j$, and $res$ use a constant amount of extra space, **therefore the space complexity is $O(1)$**.

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### Correctness Proof

The reason greedy is faster than exhaustive enumeration is that each round of greedy selection "skips" some states.

For example, in state $cap[i, j]$ where $i$ is the short partition and $j$ is the long partition, if we greedily move the short partition $i$ inward by one position, the states shown in the figure below will be "skipped". **This means that the capacities of these states cannot be verified later**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![States skipped by moving the short partition](max_capacity_problem.assets/max_capacity_skipped_states.png)

Observing carefully, **these skipped states are actually all the states obtained by moving the long partition $j$ inward**. We have already proven that moving the long partition inward will definitely decrease capacity. That is, the skipped states cannot possibly be the optimal solution, **skipping them will not cause us to miss the optimal solution**.

The above analysis shows that the operation of moving the short partition is "safe", and the greedy strategy is effective.
