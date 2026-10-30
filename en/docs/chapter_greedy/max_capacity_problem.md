# Maximum capacity problem

!!! question

    Given an array $ht$, each element represents the height of a vertical wall. Any two walls, together with the space between them, form a container.
    
    The container's capacity is its height multiplied by its width (an area). Its height is determined by the shorter wall, and its width is the difference between the two walls' array indices.
    
    Choose two walls from the array to maximize the container's capacity, and return that maximum capacity. An example is shown in the figure below.

![Example input for the maximum capacity problem](max_capacity_problem.assets/max_capacity_example.png)

A container is formed by two walls, **so the state of this problem is the pair of wall indices, denoted by $[i, j]$**.

Capacity is height times width, with the height determined by the shorter wall and the width equal to the difference between the wall indices. Writing the capacity as $cap[i, j]$, we have:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

For an array of length $n$, there are $C_n^2 = \frac{n(n - 1)}{2}$ pairs of walls (possible states). The most direct approach is to **enumerate all states** and find the maximum capacity, taking $O(n^2)$ time.

### Choosing a greedy strategy

A more efficient solution is possible. Consider the state $[i, j]$ in the figure below, where $i < j$ and $ht[i] < ht[j]$: wall $i$ is shorter and wall $j$ is taller.

![Initial state](max_capacity_problem.assets/max_capacity_initial_state.png)

As shown in the figure below, **moving the taller wall $j$ inward toward the shorter wall $i$ must reduce the capacity**.

Moving wall $j$ inward always reduces the width $j-i$. Since the shorter wall determines the height, the height can only stay the same (if $i$ remains shorter) or decrease (if the new wall $j$ is shorter).

![State after moving the taller wall inward](max_capacity_problem.assets/max_capacity_moving_long_board.png)

Conversely, **only moving the shorter wall $i$ inward can potentially increase the capacity**. Although the width must decrease, **the height may increase** if the new wall $i$ is taller. The figure below shows an example where moving the shorter wall increases the area.

![State after moving the shorter wall inward](max_capacity_problem.assets/max_capacity_moving_short_board.png)

This gives us a greedy strategy: initialize two pointers at opposite ends of the container. At each step, move the pointer at the shorter wall inward until the pointers meet.

The figure below illustrates the greedy process.

1. Initially, pointers $i$ and $j$ are at opposite ends of the array.
2. Calculate the current capacity $cap[i, j]$ and update the maximum capacity.
3. Compare the heights of walls $i$ and $j$, and move the shorter wall inward by one position.
4. Repeat steps `2.` and `3.` until $i$ and $j$ meet.

=== "<1>"
    ![Greedy steps for the maximum capacity problem](max_capacity_problem.assets/max_capacity_greedy_step1.png)

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

### Code implementation

The loop runs at most $n$ times, **so the time complexity is $O(n)$**.

The variables $i$, $j$, and $res$ require constant extra space, **so the space complexity is $O(1)$**.

```src
[file]{max_capacity}-[class]{}-[func]{max_capacity}
```

### Proof of correctness

The greedy algorithm is faster than exhaustive search because each greedy choice skips some states.

For example, in state $cap[i, j]$, suppose $i$ is the shorter wall and $j$ the taller one. Moving the shorter wall $i$ inward by one position skips the states shown in the figure below. **Their capacities will never be checked later**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![States skipped by moving the shorter wall](max_capacity_problem.assets/max_capacity_skipped_states.png)

Observe that **the skipped states are precisely those obtained by moving the taller wall $j$ inward**. We have already shown that moving the taller wall inward must reduce capacity. None of these skipped states can therefore be optimal, and **skipping them cannot cause us to miss the optimal solution**.

This shows that moving the shorter wall is safe, and that the greedy strategy is valid.
