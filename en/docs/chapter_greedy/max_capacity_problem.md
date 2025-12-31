---
comments: true
---

# 15.3 &nbsp; Max Capacity Problem

!!! question

    Input an array $ht$, where each element represents the height of a vertical partition. Any two partitions in the array, along with the space between them, can form a container.

    The capacity of the container equals the product of height and width (area), where the height is determined by the shorter partition, and the width is the difference in array indices between the two partitions.

    Please select two partitions in the array such that the capacity of the formed container is maximized, and return the maximum capacity. An example is shown in Figure 15-7.

![Example data for the max capacity problem](max_capacity_problem.assets/max_capacity_example.png){ class="animation-figure" }

<p align="center"> Figure 15-7 &nbsp; Example data for the max capacity problem </p>

The container is formed by any two partitions, **therefore the state of this problem is the indices of two partitions, denoted as $[i, j]$**.

According to the problem description, capacity equals height multiplied by width, where height is determined by the shorter partition, and width is the difference in array indices between the two partitions. Let the capacity be $cap[i, j]$, then the calculation formula is:

$$
cap[i, j] = \min(ht[i], ht[j]) \times (j - i)
$$

Let the array length be $n$, then the number of combinations of two partitions (total number of states) is $C_n^2 = \frac{n(n - 1)}{2}$. Most directly, **we can exhaustively enumerate all states** to find the maximum capacity, with time complexity $O(n^2)$.

### 1. &nbsp; Greedy Strategy Determination

This problem has a more efficient solution. As shown in Figure 15-8, select a state $[i, j]$ where index $i < j$ and height $ht[i] < ht[j]$, meaning $i$ is the short partition and $j$ is the long partition.

![Initial state](max_capacity_problem.assets/max_capacity_initial_state.png){ class="animation-figure" }

<p align="center"> Figure 15-8 &nbsp; Initial state </p>

As shown in Figure 15-9, **if we now move the long partition $j$ closer to the short partition $i$, the capacity will definitely decrease**.

This is because after moving the long partition $j$, the width $j-i$ definitely decreases; and since height is determined by the short partition, the height can only remain unchanged ($i$ is still the short partition) or decrease (the moved $j$ becomes the short partition).

![State after moving the long partition inward](max_capacity_problem.assets/max_capacity_moving_long_board.png){ class="animation-figure" }

<p align="center"> Figure 15-9 &nbsp; State after moving the long partition inward </p>

Conversely, **we can only possibly increase capacity by contracting the short partition $i$ inward**. Because although width will definitely decrease, **height may increase** (the moved short partition $i$ may become taller). For example, in Figure 15-10, the area increases after moving the short partition.

![State after moving the short partition inward](max_capacity_problem.assets/max_capacity_moving_short_board.png){ class="animation-figure" }

<p align="center"> Figure 15-10 &nbsp; State after moving the short partition inward </p>

From this we can derive the greedy strategy for this problem: initialize two pointers at both ends of the container, and in each round contract the pointer corresponding to the short partition inward, until the two pointers meet.

Figure 15-11 shows the execution process of the greedy strategy.

1. In the initial state, pointers $i$ and $j$ are at both ends of the array.
2. Calculate the capacity of the current state $cap[i, j]$, and update the maximum capacity.
3. Compare the heights of partition $i$ and partition $j$, and move the short partition inward by one position.
4. Loop through steps `2.` and `3.` until $i$ and $j$ meet.

=== "<1>"
    ![Greedy process for the max capacity problem](max_capacity_problem.assets/max_capacity_greedy_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 15-11 &nbsp; Greedy process for the max capacity problem </p>

### 2. &nbsp; Code Implementation

The code loops at most $n$ rounds, **therefore the time complexity is $O(n)$**.

Variables $i$, $j$, and $res$ use a constant amount of extra space, **therefore the space complexity is $O(1)$**.

=== "Python"

    ```python title="max_capacity.py"
    def max_capacity(ht: list[int]) -> int:
        """Max capacity: Greedy algorithm"""
        # Initialize i, j to be at both ends of the array
        i, j = 0, len(ht) - 1
        # Initial max capacity is 0
        res = 0
        # Loop for greedy selection until the two boards meet
        while i < j:
            # Update max capacity
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
    /* Max capacity: Greedy algorithm */
    int maxCapacity(vector<int> &ht) {
        // Initialize i, j to be at both ends of the array
        int i = 0, j = ht.size() - 1;
        // Initial max capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
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
    /* Max capacity: Greedy algorithm */
    int maxCapacity(int[] ht) {
        // Initialize i, j to be at both ends of the array
        int i = 0, j = ht.length - 1;
        // Initial max capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
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
    /* Max capacity: Greedy algorithm */
    int MaxCapacity(int[] ht) {
        // Initialize i, j to be at both ends of the array
        int i = 0, j = ht.Length - 1;
        // Initial max capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
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

=== "Go"

    ```go title="max_capacity.go"
    /* Max capacity: Greedy algorithm */
    func maxCapacity(ht []int) int {
        // Initialize i, j to be at both ends of the array
        i, j := 0, len(ht)-1
        // Initial max capacity is 0
        res := 0
        // Loop for greedy selection until the two boards meet
        for i < j {
            // Update max capacity
            capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
            res = int(math.Max(float64(res), float64(capacity)))
            // Move the shorter board inward
            if ht[i] < ht[j] {
                i++
            } else {
                j--
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="max_capacity.swift"
    /* Max capacity: Greedy algorithm */
    func maxCapacity(ht: [Int]) -> Int {
        // Initialize i, j to be at both ends of the array
        var i = ht.startIndex, j = ht.endIndex - 1
        // Initial max capacity is 0
        var res = 0
        // Loop for greedy selection until the two boards meet
        while i < j {
            // Update max capacity
            let cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // Move the shorter board inward
            if ht[i] < ht[j] {
                i += 1
            } else {
                j -= 1
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="max_capacity.js"
    /* Max capacity: Greedy algorithm */
    function maxCapacity(ht) {
        // Initialize i, j to be at both ends of the array
        let i = 0,
            j = ht.length - 1;
        // Initial max capacity is 0
        let res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
            const cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Move the shorter board inward
            if (ht[i] < ht[j]) {
                i += 1;
            } else {
                j -= 1;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="max_capacity.ts"
    /* Max capacity: Greedy algorithm */
    function maxCapacity(ht: number[]): number {
        // Initialize i, j to be at both ends of the array
        let i = 0,
            j = ht.length - 1;
        // Initial max capacity is 0
        let res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
            const cap: number = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Move the shorter board inward
            if (ht[i] < ht[j]) {
                i += 1;
            } else {
                j -= 1;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="max_capacity.dart"
    /* Max capacity: Greedy algorithm */
    int maxCapacity(List<int> ht) {
      // Initialize i, j to be at both ends of the array
      int i = 0, j = ht.length - 1;
      // Initial max capacity is 0
      int res = 0;
      // Loop for greedy selection until the two boards meet
      while (i < j) {
        // Update max capacity
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

=== "Rust"

    ```rust title="max_capacity.rs"
    /* Max capacity: Greedy algorithm */
    fn max_capacity(ht: &[i32]) -> i32 {
        // Initialize i, j to be at both ends of the array
        let mut i = 0;
        let mut j = ht.len() - 1;
        // Initial max capacity is 0
        let mut res = 0;
        // Loop for greedy selection until the two boards meet
        while i < j {
            // Update max capacity
            let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
            res = std::cmp::max(res, cap);
            // Move the shorter board inward
            if ht[i] < ht[j] {
                i += 1;
            } else {
                j -= 1;
            }
        }
        res
    }
    ```

=== "C"

    ```c title="max_capacity.c"
    /* Max capacity: Greedy algorithm */
    int maxCapacity(int ht[], int htLength) {
        // Initialize i, j to be at both ends of the array
        int i = 0;
        int j = htLength - 1;
        // Initial max capacity is 0
        int res = 0;
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
            int capacity = myMin(ht[i], ht[j]) * (j - i);
            res = myMax(res, capacity);
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

=== "Kotlin"

    ```kotlin title="max_capacity.kt"
    /* Max capacity: Greedy algorithm */
    fun maxCapacity(ht: IntArray): Int {
        // Initialize i, j to be at both ends of the array
        var i = 0
        var j = ht.size - 1
        // Initial max capacity is 0
        var res = 0
        // Loop for greedy selection until the two boards meet
        while (i < j) {
            // Update max capacity
            val cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // Move the shorter board inward
            if (ht[i] < ht[j]) {
                i++
            } else {
                j--
            }
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="max_capacity.rb"
    ### Maximum capacity: greedy ###
    def max_capacity(ht)
      # Initialize i, j to be at both ends of the array
      i, j = 0, ht.length - 1
      # Initial max capacity is 0
      res = 0

      # Loop for greedy selection until the two boards meet
      while i < j
        # Update max capacity
        cap = [ht[i], ht[j]].min * (j - i)
        res = [res, cap].max
        # Move the shorter board inward
        if ht[i] < ht[j]
          i += 1
        else
          j -= 1
        end
      end

      res
    end
    ```

### 3. &nbsp; Correctness Proof

The reason greedy is faster than exhaustive enumeration is that each round of greedy selection "skips" some states.

For example, in state $cap[i, j]$ where $i$ is the short partition and $j$ is the long partition, if we greedily move the short partition $i$ inward by one position, the states shown in Figure 15-12 will be "skipped". **This means that the capacities of these states cannot be verified later**.

$$
cap[i, i+1], cap[i, i+2], \dots, cap[i, j-2], cap[i, j-1]
$$

![States skipped by moving the short partition](max_capacity_problem.assets/max_capacity_skipped_states.png){ class="animation-figure" }

<p align="center"> Figure 15-12 &nbsp; States skipped by moving the short partition </p>

Observing carefully, **these skipped states are actually all the states obtained by moving the long partition $j$ inward**. We have already proven that moving the long partition inward will definitely decrease capacity. That is, the skipped states cannot possibly be the optimal solution, **skipping them will not cause us to miss the optimal solution**.

The above analysis shows that the operation of moving the short partition is "safe", and the greedy strategy is effective.
