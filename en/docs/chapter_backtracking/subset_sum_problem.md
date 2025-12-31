---
comments: true
---

# 13.3 &nbsp; Subset-Sum Problem

## 13.3.1 &nbsp; Without Duplicate Elements

!!! question

    Given a positive integer array `nums` and a target positive integer `target`, find all possible combinations where the sum of elements in the combination equals `target`. The given array has no duplicate elements, and each element can be selected multiple times. Return these combinations in list form, where the list should not contain duplicate combinations.

For example, given the set $\{3, 4, 5\}$ and target integer $9$, the solutions are $\{3, 3, 3\}, \{4, 5\}$. Note the following two points:

- Elements in the input set can be selected repeatedly without limit.
- Subsets do not distinguish element order; for example, $\{4, 5\}$ and $\{5, 4\}$ are the same subset.

### 1. &nbsp; Reference to Full Permutation Solution

Similar to the full permutation problem, we can imagine the process of generating subsets as a series of choices, and update the "sum of elements" in real-time during the selection process. When the sum equals `target`, we record the subset to the result list.

Unlike the full permutation problem, **elements in this problem's set can be selected unlimited times**, so we do not need to use a `selected` boolean list to track whether an element has been selected. We can make minor modifications to the full permutation code and initially obtain the solution:

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """Backtracking algorithm: Subset sum I"""
        # When the subset sum equals target, record the solution
        if total == target:
            res.append(list(state))
            return
        # Traverse all choices
        for i in range(len(choices)):
            # Pruning: if the subset sum exceeds target, skip this choice
            if total + choices[i] > target:
                continue
            # Attempt: make choice, update element sum total
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res)
            # Backtrack: undo choice, restore to previous state
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum I (including duplicate subsets)"""
        state = []  # State (subset)
        total = 0  # Subset sum
        res = []  # Result list (subset list)
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        for (size_t i = 0; i < choices.size(); i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.pop_back();
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
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
    /* Backtracking algorithm: Subset sum I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
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
    /* Backtracking algorithm: Subset sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.Length; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // State (subset)
        int total = 0; // Subset sum
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* Backtracking algorithm: Subset sum I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // When the subset sum equals target, record the solution
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Traverse all choices
        for i := 0; i < len(*choices); i++ {
            // Pruning: if the subset sum exceeds target, skip this choice
            if total+(*choices)[i] > target {
                continue
            }
            // Attempt: make choice, update element sum total
            *state = append(*state, (*choices)[i])
            // Proceed to the next round of selection
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // Backtrack: undo choice, restore to previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        total := 0              // Subset sum
        res := make([][]int, 0) // Result list (subset list)
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* Backtracking algorithm: Subset sum I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // When the subset sum equals target, record the solution
        if total == target {
            res.append(state)
            return
        }
        // Traverse all choices
        for i in choices.indices {
            // Pruning: if the subset sum exceeds target, skip this choice
            if total + choices[i] > target {
                continue
            }
            // Attempt: make choice, update element sum total
            state.append(choices[i])
            // Proceed to the next round of selection
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // Backtrack: undo choice, restore to previous state
            state.removeLast()
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let total = 0 // Subset sum
        var res: [[Int]] = [] // Result list (subset list)
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* Backtracking algorithm: Subset sum I */
    function backtrack(state, target, total, choices, res) {
        // When the subset sum equals target, record the solution
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        for (let i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    function subsetSumINaive(nums, target) {
        const state = []; // State (subset)
        const total = 0; // Subset sum
        const res = []; // Result list (subset list)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* Backtracking algorithm: Subset sum I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // When the subset sum equals target, record the solution
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        for (let i = 0; i < choices.length; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        const total = 0; // Subset sum
        const res = []; // Result list (subset list)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // When the subset sum equals target, record the solution
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // Traverse all choices
      for (int i = 0; i < choices.length; i++) {
        // Pruning: if the subset sum exceeds target, skip this choice
        if (total + choices[i] > target) {
          continue;
        }
        // Attempt: make choice, update element sum total
        state.add(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo choice, restore to previous state
        state.removeLast();
      }
    }

    /* Solve subset sum I (including duplicate subsets) */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      int total = 0; // Sum of elements
      List<List<int>> res = []; // Result list (subset list)
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* Backtracking algorithm: Subset sum I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // When the subset sum equals target, record the solution
        if total == target {
            res.push(state.clone());
            return;
        }
        // Traverse all choices
        for i in 0..choices.len() {
            // Pruning: if the subset sum exceeds target, skip this choice
            if total + choices[i] > target {
                continue;
            }
            // Attempt: make choice, update element sum total
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        let total = 0; // Subset sum
        let mut res = Vec::new(); // Result list (subset list)
        backtrack(&mut state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choicesSize; i++) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue;
            }
            // Attempt: make choice, update element sum total
            state[stateSize++] = choices[i];
            // Proceed to the next round of selection
            backtrack(target, total + choices[i], choices, choicesSize);
            // Backtrack: undo choice, restore to previous state
            stateSize--;
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // Initialize solution count to 0
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* Backtracking algorithm: Subset sum I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // When the subset sum equals target, record the solution
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // Traverse all choices
        for (i in choices.indices) {
            // Pruning: if the subset sum exceeds target, skip this choice
            if (total + choices[i] > target) {
                continue
            }
            // Attempt: make choice, update element sum total
            state.add(choices[i])
            // Proceed to the next round of selection
            backtrack(state, target, total + choices[i], choices, res)
            // Backtrack: undo choice, restore to previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum I (including duplicate subsets) */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        val total = 0 // Subset sum
        val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
        backtrack(state, target, total, nums, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    ### Backtracking: subset sum I ###
    def backtrack(state, target, total, choices, res)
      # When the subset sum equals target, record the solution
      if total == target
        res << state.dup
        return
      end

      # Traverse all choices
      for i in 0...choices.length
        # Pruning: if the subset sum exceeds target, skip this choice
        next if total + choices[i] > target
        # Attempt: make choice, update element sum total
        state << choices[i]
        # Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res)
        # Backtrack: undo choice, restore to previous state
        state.pop
      end
    end

    ### Solve subset sum I (with duplicate subsets) ###
    def subset_sum_i_naive(nums, target)
      state = [] # State (subset)
      total = 0 # Subset sum
      res = [] # Result list (subset list)
      backtrack(state, target, total, nums, res)
      res
    end
    ```

When we input array $[3, 4, 5]$ and target element $9$ to the above code, the output is $[3, 3, 3], [4, 5], [5, 4]$. **Although we successfully find all subsets that sum to $9$, there are duplicate subsets $[4, 5]$ and $[5, 4]$**.

This is because the search process distinguishes the order of selections, but subsets do not distinguish selection order. As shown in Figure 13-10, selecting 4 first and then 5 versus selecting 5 first and then 4 are different branches, but they correspond to the same subset.

![Subset search and boundary pruning](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> Figure 13-10 &nbsp; Subset search and boundary pruning </p>

To eliminate duplicate subsets, **one straightforward idea is to deduplicate the result list**. However, this approach is very inefficient for two reasons:

- When there are many array elements, especially when `target` is large, the search process generates many duplicate subsets.
- Comparing subsets (arrays) is very time-consuming, requiring sorting the arrays first, then comparing each element in them.

### 2. &nbsp; Pruning Duplicate Subsets

**We consider deduplication through pruning during the search process**. Observing Figure 13-11, duplicate subsets occur when array elements are selected in different orders, as in the following cases:

1. When the first and second rounds select $3$ and $4$ respectively, all subsets containing these two elements are generated, denoted as $[3, 4, \dots]$.
2. Afterward, when the first round selects $4$, **the second round should skip $3$**, because the subset $[4, 3, \dots]$ generated by this choice is completely duplicate with the subset generated in step `1.`

In the search process, each level's choices are tried from left to right, so the rightmost branches are pruned more.

1. The first two rounds select $3$ and $5$, generating subset $[3, 5, \dots]$.
2. The first two rounds select $4$ and $5$, generating subset $[4, 5, \dots]$.
3. If the first round selects $5$, **the second round should skip $3$ and $4$**, because subsets $[5, 3, \dots]$ and $[5, 4, \dots]$ are completely duplicate with the subsets described in steps `1.` and `2.`

![Different selection orders leading to duplicate subsets](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-11 &nbsp; Different selection orders leading to duplicate subsets </p>

In summary, given an input array $[x_1, x_2, \dots, x_n]$, let the selection sequence in the search process be $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$. This selection sequence must satisfy $i_1 \leq i_2 \leq \dots \leq i_m$; **any selection sequence that does not satisfy this condition will cause duplicates and should be pruned**.

### 3. &nbsp; Code Implementation

To implement this pruning, we initialize a variable `start` to indicate the starting point of traversal. **After making choice $x_{i}$, set the next round to start traversal from index $i$**. This ensures that the selection sequence satisfies $i_1 \leq i_2 \leq \dots \leq i_m$, guaranteeing subset uniqueness.

In addition, we have made the following two optimizations to the code:

- Before starting the search, first sort the array `nums`. When traversing all choices, **end the loop immediately when the subset sum exceeds `target`**, because subsequent elements are larger, and their subset sums must exceed `target`.
- Omit the element sum variable `total` and **use subtraction on `target` to track the sum of elements**. Record the solution when `target` equals $0$.

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking algorithm: Subset sum I"""
        # When the subset sum equals target, record the solution
        if target == 0:
            res.append(list(state))
            return
        # Traverse all choices
        # Pruning 2: start traversing from start to avoid generating duplicate subsets
        for i in range(start, len(choices)):
            # Pruning 1: if the subset sum exceeds target, end the loop directly
            # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0:
                break
            # Attempt: make choice, update target, start
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res)
            # Backtrack: undo choice, restore to previous state
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum I"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Start point for traversal
        res = []  # Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.size(); i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.pop_back();
        }
    }

    /* Solve subset sum I */
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
    /* Backtracking algorithm: Subset sum I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I */
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
    /* Backtracking algorithm: Subset sum I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* Backtracking algorithm: Subset sum I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for i := start; i < len(*choices); i++ {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target-(*choices)[i] < 0 {
                break
            }
            // Attempt: make choice, update target, start
            *state = append(*state, (*choices)[i])
            // Proceed to the next round of selection
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // Backtrack: undo choice, restore to previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum I */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        sort.Ints(nums)         // Sort nums
        start := 0              // Start point for traversal
        res := make([][]int, 0) // Result list (subset list)
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* Backtracking algorithm: Subset sum I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            res.append(state)
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for i in choices.indices.dropFirst(start) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0 {
                break
            }
            // Attempt: make choice, update target, start
            state.append(choices[i])
            // Proceed to the next round of selection
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // Backtrack: undo choice, restore to previous state
            state.removeLast()
        }
    }

    /* Solve subset sum I */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let nums = nums.sorted() // Sort nums
        let start = 0 // Start point for traversal
        var res: [[Int]] = [] // Result list (subset list)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* Backtracking algorithm: Subset sum I */
    function backtrack(state, target, choices, start, res) {
        // When the subset sum equals target, record the solution
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    function subsetSumI(nums, target) {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Start point for traversal
        const res = []; // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* Backtracking algorithm: Subset sum I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // When the subset sum equals target, record the solution
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Start point for traversal
        const res = []; // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // When the subset sum equals target, record the solution
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Traverse all choices
      // Pruning 2: start traversing from start to avoid generating duplicate subsets
      for (int i = start; i < choices.length; i++) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
          break;
        }
        // Attempt: make choice, update target, start
        state.add(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo choice, restore to previous state
        state.removeLast();
      }
    }

    /* Solve subset sum I */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      nums.sort(); // Sort nums
      int start = 0; // Start point for traversal
      List<List<int>> res = []; // Result list (subset list)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* Backtracking algorithm: Subset sum I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for i in start..choices.len() {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0 {
                break;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        nums.sort(); // Sort nums
        let start = 0; // Start point for traversal
        let mut res = Vec::new(); // Result list (subset list)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* Backtracking algorithm: Subset sum I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (int i = start; i < choicesSize; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Attempt: make choice, update target, start
            state[stateSize] = choices[i];
            stateSize++;
            // Proceed to the next round of selection
            backtrack(target - choices[i], choices, choicesSize, i);
            // Backtrack: undo choice, restore to previous state
            stateSize--;
        }
    }

    /* Solve subset sum I */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // Sort nums
        int start = 0;                           // Start point for traversal
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* Backtracking algorithm: Subset sum I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        for (i in start..<choices.size) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break
            }
            // Attempt: make choice, update target, start
            state.add(choices[i])
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i, res)
            // Backtrack: undo choice, restore to previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum I */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        nums.sort() // Sort nums
        val start = 0 // Start point for traversal
        val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    ### Backtracking: subset sum I ###
    def backtrack(state, target, choices, start, res)
      # When the subset sum equals target, record the solution
      if target.zero?
        res << state.dup
        return
      end
      # Traverse all choices
      # Pruning 2: start traversing from start to avoid generating duplicate subsets
      for i in start...choices.length
        # Pruning 1: if the subset sum exceeds target, end the loop directly
        # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        break if target - choices[i] < 0
        # Attempt: make choice, update target, start
        state << choices[i]
        # Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i, res)
        # Backtrack: undo choice, restore to previous state
        state.pop
      end
    end

    ### Solve subset sum I ###
    def subset_sum_i(nums, target)
      state = [] # State (subset)
      nums.sort! # Sort nums
      start = 0 # Start point for traversal
      res = [] # Result list (subset list)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

Figure 13-12 shows the complete backtracking process when array $[3, 4, 5]$ and target element $9$ are input to the above code.

![Subset-sum I backtracking process](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> Figure 13-12 &nbsp; Subset-sum I backtracking process </p>

## 13.3.2 &nbsp; With Duplicate Elements in Array

!!! question

    Given a positive integer array `nums` and a target positive integer `target`, find all possible combinations where the sum of elements in the combination equals `target`. **The given array may contain duplicate elements, and each element can be selected at most once**. Return these combinations in list form, where the list should not contain duplicate combinations.

Compared to the previous problem, **the input array in this problem may contain duplicate elements**, which introduces new challenges. For example, given array $[4, \hat{4}, 5]$ and target element $9$, the output of the existing code is $[4, 5], [\hat{4}, 5]$, which contains duplicate subsets.

**The reason for this duplication is that equal elements are selected multiple times in a certain round**. In Figure 13-13, the first round has three choices, two of which are $4$, creating two duplicate search branches that output duplicate subsets. Similarly, the two $4$'s in the second round also produce duplicate subsets.

![Duplicate subsets caused by equal elements](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> Figure 13-13 &nbsp; Duplicate subsets caused by equal elements </p>

### 1. &nbsp; Pruning Equal Elements

To solve this problem, **we need to limit equal elements to be selected only once in each round**. The implementation is quite clever: since the array is already sorted, equal elements are adjacent. This means that in a certain round of selection, if the current element equals the element to its left, it means this element has already been selected, so we skip the current element directly.

At the same time, **this problem specifies that each array element can only be selected once**. Fortunately, we can also use the variable `start` to satisfy this constraint: after making choice $x_{i}$, set the next round to start traversal from index $i + 1$ onwards. This both eliminates duplicate subsets and avoids selecting elements multiple times.

### 2. &nbsp; Code Implementation

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking algorithm: Subset sum II"""
        # When the subset sum equals target, record the solution
        if target == 0:
            res.append(list(state))
            return
        # Traverse all choices
        # Pruning 2: start traversing from start to avoid generating duplicate subsets
        # Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for i in range(start, len(choices)):
            # Pruning 1: if the subset sum exceeds target, end the loop directly
            # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0:
                break
            # Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if i > start and choices[i] == choices[i - 1]:
                continue
            # Attempt: make choice, update target, start
            state.append(choices[i])
            # Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res)
            # Backtrack: undo choice, restore to previous state
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum II"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Start point for traversal
        res = []  # Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* Backtracking algorithm: Subset sum II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.size(); i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state.push_back(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.pop_back();
        }
    }

    /* Solve subset sum II */
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
    /* Backtracking algorithm: Subset sum II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state.add(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum II */
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
    /* Backtracking algorithm: Subset sum II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state.Add(choices[i]);
            // Proceed to the next round of selection
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Start point for traversal
        List<List<int>> res = []; // Result list (subset list)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* Backtracking algorithm: Subset sum II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for i := start; i < len(*choices); i++ {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target-(*choices)[i] < 0 {
                break
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // Attempt: make choice, update target, start
            *state = append(*state, (*choices)[i])
            // Proceed to the next round of selection
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // Backtrack: undo choice, restore to previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum II */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        sort.Ints(nums)         // Sort nums
        start := 0              // Start point for traversal
        res := make([][]int, 0) // Result list (subset list)
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* Backtracking algorithm: Subset sum II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            res.append(state)
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for i in choices.indices.dropFirst(start) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0 {
                break
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // Attempt: make choice, update target, start
            state.append(choices[i])
            // Proceed to the next round of selection
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // Backtrack: undo choice, restore to previous state
            state.removeLast()
        }
    }

    /* Solve subset sum II */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let nums = nums.sorted() // Sort nums
        let start = 0 // Start point for traversal
        var res: [[Int]] = [] // Result list (subset list)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* Backtracking algorithm: Subset sum II */
    function backtrack(state, target, choices, start, res) {
        // When the subset sum equals target, record the solution
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    function subsetSumII(nums, target) {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Start point for traversal
        const res = []; // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* Backtracking algorithm: Subset sum II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // When the subset sum equals target, record the solution
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Start point for traversal
        const res = []; // Result list (subset list)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* Backtracking algorithm: Subset sum II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // When the subset sum equals target, record the solution
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Traverse all choices
      // Pruning 2: start traversing from start to avoid generating duplicate subsets
      // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
      for (int i = start; i < choices.length; i++) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
          break;
        }
        // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // Attempt: make choice, update target, start
        state.add(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Backtrack: undo choice, restore to previous state
        state.removeLast();
      }
    }

    /* Solve subset sum II */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      nums.sort(); // Sort nums
      int start = 0; // Start point for traversal
      List<List<int>> res = []; // Result list (subset list)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* Backtracking algorithm: Subset sum II */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // When the subset sum equals target, record the solution
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for i in start..choices.len() {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if target - choices[i] < 0 {
                break;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // Attempt: make choice, update target, start
            state.push(choices[i]);
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo choice, restore to previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        nums.sort(); // Sort nums
        let start = 0; // Start point for traversal
        let mut res = Vec::new(); // Result list (subset list)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* Backtracking algorithm: Subset sum II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (int i = start; i < choicesSize; i++) {
            // Pruning 1: Skip if subset sum exceeds target
            if (target - choices[i] < 0) {
                continue;
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Attempt: make choice, update target, start
            state[stateSize] = choices[i];
            stateSize++;
            // Proceed to the next round of selection
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // Backtrack: undo choice, restore to previous state
            stateSize--;
        }
    }

    /* Solve subset sum II */
    void subsetSumII(int *nums, int numsSize, int target) {
        // Sort nums
        qsort(nums, numsSize, sizeof(int), cmp);
        // Start backtracking
        backtrack(target, nums, numsSize, 0);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    /* Backtracking algorithm: Subset sum II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // When the subset sum equals target, record the solution
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Traverse all choices
        // Pruning 2: start traversing from start to avoid generating duplicate subsets
        // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
        for (i in start..<choices.size) {
            // Pruning 1: if the subset sum exceeds target, end the loop directly
            // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
            if (target - choices[i] < 0) {
                break
            }
            // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // Attempt: make choice, update target, start
            state.add(choices[i])
            // Proceed to the next round of selection
            backtrack(state, target - choices[i], choices, i + 1, res)
            // Backtrack: undo choice, restore to previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum II */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        nums.sort() // Sort nums
        val start = 0 // Start point for traversal
        val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    ### Backtracking: subset sum II ###
    def backtrack(state, target, choices, start, res)
      # When the subset sum equals target, record the solution
      if target.zero?
        res << state.dup
        return
      end

      # Traverse all choices
      # Pruning 2: start traversing from start to avoid generating duplicate subsets
      # Pruning 3: start traversing from start to avoid repeatedly selecting the same element
      for i in start...choices.length
        # Pruning 1: if the subset sum exceeds target, end the loop directly
        # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        break if target - choices[i] < 0
        # Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
        next if i > start && choices[i] == choices[i - 1]
        # Attempt: make choice, update target, start
        state << choices[i]
        # Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Backtrack: undo choice, restore to previous state
        state.pop
      end
    end

    ### Solve subset sum II ###
    def subset_sum_ii(nums, target)
      state = [] # State (subset)
      nums.sort! # Sort nums
      start = 0 # Start point for traversal
      res = [] # Result list (subset list)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

Figure 13-14 shows the backtracking process for array $[4, 4, 5]$ and target element $9$, which includes four types of pruning operations. Combine the illustration with the code comments to understand the entire search process and how each pruning operation works.

![Subset-sum II backtracking process](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-14 &nbsp; Subset-sum II backtracking process </p>
