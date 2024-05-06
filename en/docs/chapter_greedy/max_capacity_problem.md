---
comments: true
---

# 15.3 &nbsp; Maximum capacity problem

!!! question

    Input an array $ht$, where each element represents the height of a vertical partition. Any two partitions in the array, along with the space between them, can form a container.
    
    The capacity of the container is the product of the height and the width (area), where the height is determined by the shorter partition, and the width is the difference in array indices between the two partitions.
    
    Please select two partitions in the array that maximize the container's capacity and return this maximum capacity. An example is shown in Figure 15-7.

![Example data for the maximum capacity problem](max_capacity_problem.assets/max_capacity_example.png){ class="animation-figure" }

<p align="center"> Figure 15-7 &nbsp; Example data for the maximum capacity problem </p>

The container is formed by any two partitions, **therefore the state of this problem is represented by the indices of the two partitions, denoted as $[i, j]$**.

According to the problem statement, the capacity equals the product of height and width, where the height is determined by the shorter partition, and the width is the difference in array indices between the two partitions. The formula for capacity $cap[i, j]$ is:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

Assuming the length of the array is $n$, the number of combinations of two partitions (total number of states) is $C_n^2 = \frac{n(n - 1)}{2}$. The most straightforward approach is to **enumerate all possible states**, resulting in a time complexity of $O(n^2)$.

### 1. &nbsp; Determination of a greedy strategy

There is a more efficient solution to this problem. As shown in Figure 15-8, we select a state $[i, j]$ where the indices $i < j$ and the height $ht[i] < ht[j]$, meaning $i$ is the shorter partition, and $j$ is the taller one.

![Initial state](max_capacity_problem.assets/max_capacity_initial_state.png){ class="animation-figure" }

<p align="center"> Figure 15-8 &nbsp; Initial state </p>

As shown in Figure 15-9, **if we move the taller partition $j$ closer to the shorter partition $i$, the capacity will definitely decrease**.

This is because when moving the taller partition $j$, the width $j-i$ definitely decreases; and since the height is determined by the shorter partition, the height can only remain the same (if $i$ remains the shorter partition) or decrease (if the moved $j$ becomes the shorter partition).

![State after moving the taller partition inward](max_capacity_problem.assets/max_capacity_moving_long_board.png){ class="animation-figure" }

<p align="center"> Figure 15-9 &nbsp; State after moving the taller partition inward </p>

Conversely, **we can only possibly increase the capacity by moving the shorter partition $i$ inward**. Although the width will definitely decrease, **the height may increase** (if the moved shorter partition $i$ becomes taller). For example, in Figure 15-10, the area increases after moving the shorter partition.

![State after moving the shorter partition inward](max_capacity_problem.assets/max_capacity_moving_short_board.png){ class="animation-figure" }

<p align="center"> Figure 15-10 &nbsp; State after moving the shorter partition inward </p>

This leads us to the greedy strategy for this problem: initialize two pointers at the ends of the container, and in each round, move the pointer corresponding to the shorter partition inward until the two pointers meet.

Figure 15-11 illustrate the execution of the greedy strategy.

1. Initially, the pointers $i$ and $j$ are positioned at the ends of the array.
2. Calculate the current state's capacity $cap[i, j]$ and update the maximum capacity.
3. Compare the heights of partitions $i$ and $j$, and move the shorter partition inward by one step.
4. Repeat steps `2.` and `3.` until $i$ and $j$ meet.

=== "<1>"
    ![The greedy process for maximum capacity problem](max_capacity_problem.assets/max_capacity_greedy_step1.png){ class="animation-figure" }

=== "<2>"
    ![max_capacity_greedy_step2](max_capacity_problem.assets/max_capacity_greedy_step2.png){ class="animation-figure" }

=== "<3>"
    ![max_capacity_greedy_step3](max_capacity_problem.assets/max_capacity_greedy_step3.png){ class="animation-figure" }

=== "<4>"
    ![max_capacity_greedy_step4](max_capacity_problem.assets/max_capacity_greedy_step4.png){ class="animation-figure" }

=== "<5>"
    ![max_capacity_greedy_step5](max_capacity_problem.assets/max_capacity_greedy_step5.png){ class="animation-figure" }

=== "<6>"
    ![max_capacity_greedy_step6](max_capacity_problem.assets/max_capacity_greedy_step6.png){ class="animation-figure" }

=== "<7>"
    ![max_capacity_greedy_step7](max_capacity_problem.assets/max_capacity_greedy_step7.png){ class="animation-figure" }

=== "<8>"
    ![max_capacity_greedy_step8](max_capacity_problem.assets/max_capacity_greedy_step8.png){ class="animation-figure" }

=== "<9>"
    ![max_capacity_greedy_step9](max_capacity_problem.assets/max_capacity_greedy_step9.png){ class="animation-figure" }

<p align="center"> Figure 15-11 &nbsp; The greedy process for maximum capacity problem </p>

### 2. &nbsp; Implementation

The code loops at most $n$ times, **thus the time complexity is $O(n)$**.

The variables $i$, $j$, and $res$ use a constant amount of extra space, **thus the space complexity is $O(1)$**.

=== "Python"

    ```python title="max_capacity.py"
    def max_capacity(ht: list[int]) -> int:
        """Maximum capacity: Greedy"""
        # Initialize i, j, making them split the array at both ends
        i, j = 0, len(ht) - 1
        # Initial maximum capacity is 0
        res = 0
        # Loop for greedy selection until the two boards meet
        while i < j:
            # Update maximum capacity
            cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            # Move the shorter board inward
            if ht[i] < ht[j]:
                i += 1
            else:
                j -= 1
        return res
    ```

=== "C++"

    ```cpp title="max_capacity.cpp"
    /* Maximum capacity: Greedy */
    int maxCapacity(vector<int> &ht) {
        // Initialize i, j, making them split the array at both ends
        int i = 0, j = ht.size() - 1;
        // Initial maximum capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update maximum capacity
            int cap = min(ht[i], ht[j]) * (j - i);
            res = max(res, cap);
            // Move the shorter board inward
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "Java"

    ```java title="max_capacity.java"
    /* Maximum capacity: Greedy */
    int maxCapacity(int[] ht) {
        // Initialize i, j, making them split the array at both ends
        int i = 0, j = ht.length - 1;
        // Initial maximum capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update maximum capacity
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Move the shorter board inward
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="max_capacity.cs"
    [class]{max_capacity}-[func]{MaxCapacity}
    ```

=== "Go"

    ```go title="max_capacity.go"
    [class]{}-[func]{maxCapacity}
    ```

=== "Swift"

    ```swift title="max_capacity.swift"
    [class]{}-[func]{maxCapacity}
    ```

=== "JS"

    ```javascript title="max_capacity.js"
    [class]{}-[func]{maxCapacity}
    ```

=== "TS"

    ```typescript title="max_capacity.ts"
    [class]{}-[func]{maxCapacity}
    ```

=== "Dart"

    ```dart title="max_capacity.dart"
    [class]{}-[func]{maxCapacity}
    ```

=== "Rust"

    ```rust title="max_capacity.rs"
    [class]{}-[func]{max_capacity}
    ```

=== "C"

    ```c title="max_capacity.c"
    [class]{}-[func]{maxCapacity}
    ```

=== "Kotlin"

    ```kotlin title="max_capacity.kt"
    [class]{}-[func]{maxCapacity}
    ```

=== "Ruby"

    ```ruby title="max_capacity.rb"
    [class]{}-[func]{max_capacity}
    ```

=== "Zig"

    ```zig title="max_capacity.zig"
    [class]{}-[func]{maxCapacity}
    ```

### 3. &nbsp; Proof of correctness

The reason why the greedy method is faster than enumeration is that each round of greedy selection "skips" some states.

For example, under the state $cap[i, j]$ where $i$ is the shorter partition and $j$ is the taller partition, greedily moving the shorter partition $i$ inward by one step leads to the "skipped" states shown in Figure 15-12. **This means that these states' capacities cannot be verified later**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![States skipped by moving the shorter partition](max_capacity_problem.assets/max_capacity_skipped_states.png){ class="animation-figure" }

<p align="center"> Figure 15-12 &nbsp; States skipped by moving the shorter partition </p>

It is observed that **these skipped states are actually all states where the taller partition $j$ is moved inward**. We have already proven that moving the taller partition inward will definitely decrease the capacity. Therefore, the skipped states cannot possibly be the optimal solution, **and skipping them does not lead to missing the optimal solution**.

The analysis shows that the operation of moving the shorter partition is "safe", and the greedy strategy is effective.
