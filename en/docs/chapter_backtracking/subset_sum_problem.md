---
comments: true
---

# 13.3 &nbsp; Subset sum problem

## 13.3.1 &nbsp; Case without duplicate elements

!!! question

    Given an array of positive integers `nums` and a target positive integer `target`, find all possible combinations such that the sum of the elements in the combination equals `target`. The given array has no duplicate elements, and each element can be chosen multiple times. Please return these combinations as a list, which should not contain duplicate combinations.

For example, for the input set $\{3, 4, 5\}$ and target integer $9$, the solutions are $\{3, 3, 3\}, \{4, 5\}$. Note the following two points.

- Elements in the input set can be chosen an unlimited number of times.
- Subsets do not distinguish the order of elements, for example $\{4, 5\}$ and $\{5, 4\}$ are the same subset.

### 1. &nbsp; Reference permutation solution

Similar to the permutation problem, we can imagine the generation of subsets as a series of choices, updating the "element sum" in real-time during the choice process. When the element sum equals `target`, the subset is recorded in the result list.

Unlike the permutation problem, **elements in this problem can be chosen an unlimited number of times**, thus there is no need to use a `selected` boolean list to record whether an element has been chosen. We can make minor modifications to the permutation code to initially solve the problem:

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """Backtracking algorithm: Subset Sum I"""
        # When the subset sum equals target, record the solution
        if total == target:
            res.append(list(state))
            return
        # Traverse all choices
        for i in range(len(choices)):
            # Pruning: if the subset sum exceeds target, skip that choice
            if total + choices[i] > target:
                continue
            # Attempt: make a choice, update elements and total
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res)
            # Retract: undo the choice, restore to the previous state
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """Solve Subset Sum I (including duplicate subsets)"""
        state = []  # State (subset)
        total = 0  # Subset sum
        res = []  # Result list (subset list)
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* Backtracking algorithm: Subset Sum I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        for (size_t i = 0; i < choices.size(); i++) {
            // Pruning: if the subset sum exceeds target, skip that choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make a choice, update elements and total
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Retract: undo the choice, restore to the previous state
            state.pop_back();
        }
    }

    /* Solve Subset Sum I (including duplicate subsets) */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // State (subset)
        int total = 0;           // Subset sum
        vector<vector<int>> res; // Result list (subset list)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* Backtracking algorithm: Subset Sum I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip that choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make a choice, update elements and total
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Retract: undo the choice, restore to the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve Subset Sum I (including duplicate subsets) */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        int total = 0; // Subset sum
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    [class]{subset_sum_i_naive}-[func]{Backtrack}

    [class]{subset_sum_i_naive}-[func]{SubsetSumINaive}
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    [class]{}-[func]{backtrackSubsetSumINaive}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i_naive}
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i_naive}
    ```

=== "Zig"

    ```zig title="subset_sum_i_naive.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

Inputting the array $[3, 4, 5]$ and target element $9$ into the above code yields the results $[3, 3, 3], [4, 5], [5, 4]$. **Although it successfully finds all subsets with a sum of $9$, it includes the duplicate subset $[4, 5]$ and $[5, 4]$**.

This is because the search process distinguishes the order of choices, however, subsets do not distinguish the choice order. As shown in Figure 13-10, choosing $4$ before $5$ and choosing $5$ before $4$ are different branches, but correspond to the same subset.

![Subset search and pruning out of bounds](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> Figure 13-10 &nbsp; Subset search and pruning out of bounds </p>

To eliminate duplicate subsets, **a straightforward idea is to deduplicate the result list**. However, this method is very inefficient for two reasons.

- When there are many array elements, especially when `target` is large, the search process produces a large number of duplicate subsets.
- Comparing subsets (arrays) for differences is very time-consuming, requiring arrays to be sorted first, then comparing the differences of each element in the arrays.

### 2. &nbsp; Duplicate subset pruning

**We consider deduplication during the search process through pruning**. Observing Figure 13-11, duplicate subsets are generated when choosing array elements in different orders, for example in the following situations.

1. When choosing $3$ in the first round and $4$ in the second round, all subsets containing these two elements are generated, denoted as $[3, 4, \dots]$.
2. Later, when $4$ is chosen in the first round, **the second round should skip $3$** because the subset $[4, 3, \dots]$ generated by this choice completely duplicates the subset from step `1.`.

In the search process, each layer's choices are tried one by one from left to right, so the more to the right a branch is, the more it is pruned.

1. First two rounds choose $3$ and $5$, generating subset $[3, 5, \dots]$.
2. First two rounds choose $4$ and $5$, generating subset $[4, 5, \dots]$.
3. If $5$ is chosen in the first round, **then the second round should skip $3$ and $4$** as the subsets $[5, 3, \dots]$ and $[5, 4, \dots]$ completely duplicate the subsets described in steps `1.` and `2.`.

![Different choice orders leading to duplicate subsets](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-11 &nbsp; Different choice orders leading to duplicate subsets </p>

In summary, given the input array $[x_1, x_2, \dots, x_n]$, the choice sequence in the search process should be $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$, which needs to satisfy $i_1 \leq i_2 \leq \dots \leq i_m$. **Any choice sequence that does not meet this condition will cause duplicates and should be pruned**.

### 3. &nbsp; Code implementation

To implement this pruning, we initialize the variable `start`, which indicates the starting point for traversal. **After making the choice $x_{i}$, set the next round to start from index $i$**. This will ensure the choice sequence satisfies $i_1 \leq i_2 \leq \dots \leq i_m$, thereby ensuring the uniqueness of the subsets.

Besides, we have made the following two optimizations to the code.

- Before starting the search, sort the array `nums`. In the traversal of all choices, **end the loop directly when the subset sum exceeds `target`** as subsequent elements are larger and their subset sum will definitely exceed `target`.
- Eliminate the element sum variable `total`, **by performing subtraction on `target` to count the element sum**. When `target` equals $0$, record the solution.

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking algorithm: Subset Sum I"""
        # When the subset sum equals target, record the solution
        if target == 0:
            res.append(list(state))
            return
        # Traverse all choices
        # Pruning two: start traversing from start to avoid generating duplicate subsets
        for i in range(start, len(choices)):
            # Pruning one: if the subset sum exceeds target, end the loop immediately
            # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0:
                break
            # Attempt: make a choice, update target, start
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res)
            # Retract: undo the choice, restore to the previous state
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """Solve Subset Sum I"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Start point for traversal
        res = []  # Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* Backtracking algorithm: Subset Sum I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.size(); i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make a choice, update target, start
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Retract: undo the choice, restore to the previous state
            state.pop_back();
        }
    }

    /* Solve Subset Sum I */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // State (subset)
        sort(nums.begin(), nums.end()); // Sort nums
        int start = 0;                  // Start point for traversal
        vector<vector<int>> res;        // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* Backtracking algorithm: Subset Sum I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.length; i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make a choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Retract: undo the choice, restore to the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve Subset Sum I */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    [class]{subset_sum_i}-[func]{Backtrack}

    [class]{subset_sum_i}-[func]{SubsetSumI}
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    [class]{}-[func]{backtrackSubsetSumI}

    [class]{}-[func]{subsetSumI}
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i}
    ```

=== "C"

    ```c title="subset_sum_i.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_i}
    ```

=== "Zig"

    ```zig title="subset_sum_i.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

Figure 13-12 shows the overall backtracking process after inputting the array $[3, 4, 5]$ and target element $9$ into the above code.

![Subset sum I backtracking process](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> Figure 13-12 &nbsp; Subset sum I backtracking process </p>

## 13.3.2 &nbsp; Considering cases with duplicate elements

!!! question

    Given an array of positive integers `nums` and a target positive integer `target`, find all possible combinations such that the sum of the elements in the combination equals `target`. **The given array may contain duplicate elements, and each element can only be chosen once**. Please return these combinations as a list, which should not contain duplicate combinations.

Compared to the previous question, **this question's input array may contain duplicate elements**, introducing new problems. For example, given the array $[4, \hat{4}, 5]$ and target element $9$, the existing code's output results in $[4, 5], [\hat{4}, 5]$, resulting in duplicate subsets.

**The reason for this duplication is that equal elements are chosen multiple times in a certain round**. In Figure 13-13, the first round has three choices, two of which are $4$, generating two duplicate search branches, thus outputting duplicate subsets; similarly, the two $4$s in the second round also produce duplicate subsets.

![Duplicate subsets caused by equal elements](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> Figure 13-13 &nbsp; Duplicate subsets caused by equal elements </p>

### 1. &nbsp; Equal element pruning

To solve this issue, **we need to limit equal elements to being chosen only once per round**. The implementation is quite clever: since the array is sorted, equal elements are adjacent. This means that in a certain round of choices, if the current element is equal to its left-hand element, it means it has already been chosen, so skip the current element directly.

At the same time, **this question stipulates that each array element can only be chosen once**. Fortunately, we can also use the variable `start` to meet this constraint: after making the choice $x_{i}$, set the next round to start from index $i + 1$ going forward. This not only eliminates duplicate subsets but also avoids repeated selection of elements.

### 2. &nbsp; Code implementation

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking algorithm: Subset Sum II"""
        # When the subset sum equals target, record the solution
        if target == 0:
            res.append(list(state))
            return
        # Traverse all choices
        # Pruning two: start traversing from start to avoid generating duplicate subsets
        # Pruning three: start traversing from start to avoid repeatedly selecting the same element
        for i in range(start, len(choices)):
            # Pruning one: if the subset sum exceeds target, end the loop immediately
            # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0:
                break
            # Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
            if i > start and choices[i] == choices[i - 1]:
                continue
            # Attempt: make a choice, update target, start
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res)
            # Retract: undo the choice, restore to the previous state
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """Solve Subset Sum II"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Start point for traversal
        res = []  # Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* Backtracking algorithm: Subset Sum II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        // Pruning three: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.size(); i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make a choice, update target, start
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Retract: undo the choice, restore to the previous state
            state.pop_back();
        }
    }

    /* Solve Subset Sum II */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // State (subset)
        sort(nums.begin(), nums.end()); // Sort nums
        int start = 0;                  // Start point for traversal
        vector<vector<int>> res;        // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* Backtracking algorithm: Subset Sum II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning two: start traversing from start to avoid generating duplicate subsets
        // Pruning three: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.length; i++) {
            // Pruning one: if the subset sum exceeds target, end the loop immediately
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make a choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Retract: undo the choice, restore to the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve Subset Sum II */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<Integer>> res = new ArrayList<>(); // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    [class]{subset_sum_ii}-[func]{Backtrack}

    [class]{subset_sum_ii}-[func]{SubsetSumII}
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    [class]{}-[func]{backtrackSubsetSumII}

    [class]{}-[func]{subsetSumII}
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_ii}
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subset_sum_ii}
    ```

=== "Zig"

    ```zig title="subset_sum_ii.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

Figure 13-14 shows the backtracking process for the array $[4, 4, 5]$ and target element $9$, including four types of pruning operations. Please combine the illustration with the code comments to understand the entire search process and how each type of pruning operation works.

![Subset sum II backtracking process](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-14 &nbsp; Subset sum II backtracking process </p>
