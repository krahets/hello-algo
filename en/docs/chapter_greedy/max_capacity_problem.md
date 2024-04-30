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
        """最大容量：贪心"""
        # 初始化 i, j，使其分列数组两端
        i, j = 0, len(ht) - 1
        # 初始最大容量为 0
        res = 0
        # 循环贪心选择，直至两板相遇
        while i < j:
            # 更新最大容量
            cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            # 向内移动短板
            if ht[i] < ht[j]:
                i += 1
            else:
                j -= 1
        return res
    ```

=== "C++"

    ```cpp title="max_capacity.cpp"
    /* 最大容量：贪心 */
    int maxCapacity(vector<int> &ht) {
        // 初始化 i, j，使其分列数组两端
        int i = 0, j = ht.size() - 1;
        // 初始最大容量为 0
        int res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            int cap = min(ht[i], ht[j]) * (j - i);
            res = max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    int maxCapacity(int[] ht) {
        // 初始化 i, j，使其分列数组两端
        int i = 0, j = ht.length - 1;
        // 初始最大容量为 0
        int res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    int MaxCapacity(int[] ht) {
        // 初始化 i, j，使其分列数组两端
        int i = 0, j = ht.Length - 1;
        // 初始最大容量为 0
        int res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    func maxCapacity(ht []int) int {
        // 初始化 i, j，使其分列数组两端
        i, j := 0, len(ht)-1
        // 初始最大容量为 0
        res := 0
        // 循环贪心选择，直至两板相遇
        for i < j {
            // 更新最大容量
            capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
            res = int(math.Max(float64(res), float64(capacity)))
            // 向内移动短板
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
    /* 最大容量：贪心 */
    func maxCapacity(ht: [Int]) -> Int {
        // 初始化 i, j，使其分列数组两端
        var i = ht.startIndex, j = ht.endIndex - 1
        // 初始最大容量为 0
        var res = 0
        // 循环贪心选择，直至两板相遇
        while i < j {
            // 更新最大容量
            let cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 向内移动短板
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
    /* 最大容量：贪心 */
    function maxCapacity(ht) {
        // 初始化 i, j，使其分列数组两端
        let i = 0,
            j = ht.length - 1;
        // 初始最大容量为 0
        let res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            const cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    function maxCapacity(ht: number[]): number {
        // 初始化 i, j，使其分列数组两端
        let i = 0,
            j = ht.length - 1;
        // 初始最大容量为 0
        let res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            const cap: number = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    int maxCapacity(List<int> ht) {
      // 初始化 i, j，使其分列数组两端
      int i = 0, j = ht.length - 1;
      // 初始最大容量为 0
      int res = 0;
      // 循环贪心选择，直至两板相遇
      while (i < j) {
        // 更新最大容量
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // 向内移动短板
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
    /* 最大容量：贪心 */
    fn max_capacity(ht: &[i32]) -> i32 {
        // 初始化 i, j，使其分列数组两端
        let mut i = 0;
        let mut j = ht.len() - 1;
        // 初始最大容量为 0
        let mut res = 0;
        // 循环贪心选择，直至两板相遇
        while i < j {
            // 更新最大容量
            let cap = std::cmp::min(ht[i], ht[j]) * (j - i) as i32;
            res = std::cmp::max(res, cap);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    int maxCapacity(int ht[], int htLength) {
        // 初始化 i, j，使其分列数组两端
        int i = 0;
        int j = htLength - 1;
        // 初始最大容量为 0
        int res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            int capacity = myMin(ht[i], ht[j]) * (j - i);
            res = myMax(res, capacity);
            // 向内移动短板
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
    /* 最大容量：贪心 */
    fun maxCapacity(ht: IntArray): Int {
        // 初始化 i, j，使其分列数组两端
        var i = 0
        var j = ht.size - 1
        // 初始最大容量为 0
        var res = 0
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            val cap = min(ht[i], ht[j]) * (j - i)
            res = max(res, cap)
            // 向内移动短板
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
    [class]{}-[func]{max_capacity}
    ```

=== "Zig"

    ```zig title="max_capacity.zig"
    [class]{}-[func]{maxCapacity}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20i,%20j%EF%BC%8C%E4%BD%BF%E5%85%B6%E5%88%86%E5%88%97%E6%95%B0%E7%BB%84%E4%B8%A4%E7%AB%AF%0A%20%20%20%20i,%20j%20%3D%200,%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E4%B8%BA%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E8%B4%AA%E5%BF%83%E9%80%89%E6%8B%A9%EF%BC%8C%E7%9B%B4%E8%87%B3%E4%B8%A4%E6%9D%BF%E7%9B%B8%E9%81%87%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D,%20ht%5Bj%5D%29%20*%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res,%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E5%86%85%E7%A7%BB%E5%8A%A8%E7%9F%AD%E6%9D%BF%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3,%208,%205,%202,%207,%207,%203,%204%5D%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20max_capacity%28ht%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%EF%BC%9A%E8%B4%AA%E5%BF%83%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20i,%20j%EF%BC%8C%E4%BD%BF%E5%85%B6%E5%88%86%E5%88%97%E6%95%B0%E7%BB%84%E4%B8%A4%E7%AB%AF%0A%20%20%20%20i,%20j%20%3D%200,%20len%28ht%29%20-%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E4%B8%BA%200%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E8%B4%AA%E5%BF%83%E9%80%89%E6%8B%A9%EF%BC%8C%E7%9B%B4%E8%87%B3%E4%B8%A4%E6%9D%BF%E7%9B%B8%E9%81%87%0A%20%20%20%20while%20i%20%3C%20j%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%9B%B4%E6%96%B0%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%0A%20%20%20%20%20%20%20%20cap%20%3D%20min%28ht%5Bi%5D,%20ht%5Bj%5D%29%20*%20%28j%20-%20i%29%0A%20%20%20%20%20%20%20%20res%20%3D%20max%28res,%20cap%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%91%E5%86%85%E7%A7%BB%E5%8A%A8%E7%9F%AD%E6%9D%BF%0A%20%20%20%20%20%20%20%20if%20ht%5Bi%5D%20%3C%20ht%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20-%3D%201%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20ht%20%3D%20%5B3,%208,%205,%202,%207,%207,%203,%204%5D%0A%0A%20%20%20%20%23%20%E8%B4%AA%E5%BF%83%E7%AE%97%E6%B3%95%0A%20%20%20%20res%20%3D%20max_capacity%28ht%29%0A%20%20%20%20print%28f%22%E6%9C%80%E5%A4%A7%E5%AE%B9%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

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
