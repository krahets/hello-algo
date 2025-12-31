---
comments: true
---

# 13.2 &nbsp; Permutations Problem

The permutations problem is a classic application of backtracking algorithms. It is defined as finding all possible arrangements of elements in a given collection (such as an array or string).

Table 13-2 shows several example datasets, including input arrays and their corresponding permutations.

<p align="center"> Table 13-2 &nbsp; Permutations Examples </p>

<div class="center-table" markdown>

| Input Array | All Permutations                                                   |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

</div>

## 13.2.1 &nbsp; Case with Distinct Elements

!!! question

    Given an integer array with no duplicate elements, return all possible permutations.

From the perspective of backtracking algorithms, **we can imagine the process of generating permutations as the result of a series of choices**. Suppose the input array is $[1, 2, 3]$. If we first choose $1$, then choose $3$, and finally choose $2$, we obtain the permutation $[1, 3, 2]$. Backtracking means undoing a choice and then trying other choices.

From the perspective of backtracking code, the candidate set `choices` consists of all elements in the input array, and the state `state` is the elements that have been chosen so far. Note that each element can only be chosen once, **therefore all elements in `state` should be unique**.

As shown in Figure 13-5, we can unfold the search process into a recursion tree, where each node in the tree represents the current state `state`. Starting from the root node, after three rounds of choices, we reach a leaf node, and each leaf node corresponds to a permutation.

![Recursion tree of permutations](permutations_problem.assets/permutations_i.png){ class="animation-figure" }

<p align="center"> Figure 13-5 &nbsp; Recursion tree of permutations </p>

### 1. &nbsp; Pruning Duplicate Choices

To ensure that each element is chosen only once, we consider introducing a boolean array `selected`, where `selected[i]` indicates whether `choices[i]` has been chosen. We implement the following pruning operation based on it.

- After making a choice `choice[i]`, we set `selected[i]` to $\text{True}$, indicating that it has been chosen.
- When traversing the candidate list `choices`, we skip all nodes that have been chosen, which is pruning.

As shown in Figure 13-6, suppose we choose $1$ in the first round, $3$ in the second round, and $2$ in the third round. Then we need to prune the branch of element $1$ in the second round and prune the branches of elements $1$ and $3$ in the third round.

![Pruning example of permutations](permutations_problem.assets/permutations_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-6 &nbsp; Pruning example of permutations </p>

Observing the above figure, we find that this pruning operation reduces the search space size from $O(n^n)$ to $O(n!)$.

### 2. &nbsp; Code Implementation

After understanding the above information, we can fill in the blanks in the template code. To shorten the overall code, we do not implement each function in the template separately, but instead unfold them in the `backtrack()` function:

=== "Python"

    ```python title="permutations_i.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Backtracking algorithm: Permutations I"""
        # When the state length equals the number of elements, record the solution
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Traverse all choices
        for i, choice in enumerate(choices):
            # Pruning: do not allow repeated selection of elements
            if not selected[i]:
                # Attempt: make choice, update state
                selected[i] = True
                state.append(choice)
                # Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                # Backtrack: undo choice, restore to previous state
                selected[i] = False
                state.pop()

    def permutations_i(nums: list[int]) -> list[list[int]]:
        """Permutations I"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_i.cpp"
    /* Backtracking algorithm: Permutations I */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state.push_back(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Permutations I */
    vector<vector<int>> permutationsI(vector<int> nums) {
        vector<int> state;
        vector<bool> selected(nums.size(), false);
        vector<vector<int>> res;
        backtrack(state, nums, selected, res);
        return res;
    }
    ```

=== "Java"

    ```java title="permutations_i.java"
    /* Backtracking algorithm: Permutations I */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state.add(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Permutations I */
    List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_i.cs"
    /* Backtracking algorithm: Permutations I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state.Add(choice);
                // Proceed to the next round of selection
                Backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Permutations I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_i.go"
    /* Backtracking algorithm: Permutations I */
    func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // When the state length equals the number of elements, record the solution
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Traverse all choices
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Pruning: do not allow repeated selection of elements
            if !(*selected)[i] {
                // Attempt: make choice, update state
                (*selected)[i] = true
                *state = append(*state, choice)
                // Proceed to the next round of selection
                backtrackI(state, choices, selected, res)
                // Backtrack: undo choice, restore to previous state
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Permutations I */
    func permutationsI(nums []int) [][]int {
        res := make([][]int, 0)
        state := make([]int, 0)
        selected := make([]bool, len(nums))
        backtrackI(&state, &nums, &selected, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="permutations_i.swift"
    /* Backtracking algorithm: Permutations I */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // When the state length equals the number of elements, record the solution
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Traverse all choices
        for (i, choice) in choices.enumerated() {
            // Pruning: do not allow repeated selection of elements
            if !selected[i] {
                // Attempt: make choice, update state
                selected[i] = true
                state.append(choice)
                // Proceed to the next round of selection
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Backtrack: undo choice, restore to previous state
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Permutations I */
    func permutationsI(nums: [Int]) -> [[Int]] {
        var state: [Int] = []
        var selected = Array(repeating: false, count: nums.count)
        var res: [[Int]] = []
        backtrack(state: &state, choices: nums, selected: &selected, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="permutations_i.js"
    /* Backtracking algorithm: Permutations I */
    function backtrack(state, choices, selected, res) {
        // When the state length equals the number of elements, record the solution
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        choices.forEach((choice, i) => {
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Permutations I */
    function permutationsI(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_i.ts"
    /* Backtracking algorithm: Permutations I */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // When the state length equals the number of elements, record the solution
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        choices.forEach((choice, i) => {
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Permutations I */
    function permutationsI(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_i.dart"
    /* Backtracking algorithm: Permutations I */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // When the state length equals the number of elements, record the solution
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Traverse all choices
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Pruning: do not allow repeated selection of elements
        if (!selected[i]) {
          // Attempt: make choice, update state
          selected[i] = true;
          state.add(choice);
          // Proceed to the next round of selection
          backtrack(state, choices, selected, res);
          // Backtrack: undo choice, restore to previous state
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Permutations I */
    List<List<int>> permutationsI(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_i.rs"
    /* Backtracking algorithm: Permutations I */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // When the state length equals the number of elements, record the solution
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Traverse all choices
        for i in 0..choices.len() {
            let choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if !selected[i] {
                // Attempt: make choice, update state
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state.clone(), choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Permutations I */
    fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new(); // State (subset)
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_i.c"
    /* Backtracking algorithm: Permutations I */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // When the state length equals the number of elements, record the solution
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Traverse all choices
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true;
                state[stateSize] = choice;
                // Proceed to the next round of selection
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
            }
        }
    }

    /* Permutations I */
    int **permutationsI(int *nums, int numsSize, int *returnSize) {
        int *state = (int *)malloc(numsSize * sizeof(int));
        bool *selected = (bool *)malloc(numsSize * sizeof(bool));
        for (int i = 0; i < numsSize; i++) {
            selected[i] = false;
        }
        int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
        *returnSize = 0;

        backtrack(state, 0, nums, numsSize, selected, res, returnSize);

        free(state);
        free(selected);

        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="permutations_i.kt"
    /* Backtracking algorithm: Permutations I */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // When the state length equals the number of elements, record the solution
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Traverse all choices
        for (i in choices.indices) {
            val choice = choices[i]
            // Pruning: do not allow repeated selection of elements
            if (!selected[i]) {
                // Attempt: make choice, update state
                selected[i] = true
                state.add(choice)
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                // Backtrack: undo choice, restore to previous state
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Permutations I */
    fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_i.rb"
    ### Backtracking: permutations I ###
    def backtrack(state, choices, selected, res)
      # When the state length equals the number of elements, record the solution
      if state.length == choices.length
        res << state.dup
        return
      end

      # Traverse all choices
      choices.each_with_index do |choice, i|
        # Pruning: do not allow repeated selection of elements
        unless selected[i]
          # Attempt: make choice, update state
          selected[i] = true
          state << choice
          # Proceed to the next round of selection
          backtrack(state, choices, selected, res)
          # Backtrack: undo choice, restore to previous state
          selected[i] = false
          state.pop
        end
      end
    end

    ### Permutations I ###
    def permutations_i(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

## 13.2.2 &nbsp; Case with Duplicate Elements

!!! question

    Given an integer array that **may contain duplicate elements**, return all unique permutations.

Suppose the input array is $[1, 1, 2]$. To distinguish the two duplicate elements $1$, we denote the second $1$ as $\hat{1}$.

As shown in Figure 13-7, the method described above generates permutations where half are duplicates.

![Duplicate permutations](permutations_problem.assets/permutations_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-7 &nbsp; Duplicate permutations </p>

So how do we remove duplicate permutations? The most direct approach is to use a hash set to directly deduplicate the permutation results. However, this is not elegant because **the search branches that generate duplicate permutations are unnecessary and should be identified and pruned early**, which can further improve algorithm efficiency.

### 1. &nbsp; Pruning Duplicate Elements

Observe Figure 13-8. In the first round, choosing $1$ or choosing $\hat{1}$ is equivalent. All permutations generated under these two choices are duplicates. Therefore, we should prune $\hat{1}$.

Similarly, after choosing $2$ in the first round, the $1$ and $\hat{1}$ in the second round also produce duplicate branches, so the second round's $\hat{1}$ should also be pruned.

Essentially, **our goal is to ensure that multiple equal elements are chosen only once in a certain round of choices**.

![Pruning duplicate permutations](permutations_problem.assets/permutations_ii_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-8 &nbsp; Pruning duplicate permutations </p>

### 2. &nbsp; Code Implementation

Building on the code from the previous problem, we consider opening a hash set `duplicated` in each round of choices to record which elements have been tried in this round, and prune duplicate elements:

=== "Python"

    ```python title="permutations_ii.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Backtracking algorithm: Permutations II"""
        # When the state length equals the number of elements, record the solution
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Traverse all choices
        duplicated = set[int]()
        for i, choice in enumerate(choices):
            # Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if not selected[i] and choice not in duplicated:
                # Attempt: make choice, update state
                duplicated.add(choice)  # Record the selected element value
                selected[i] = True
                state.append(choice)
                # Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                # Backtrack: undo choice, restore to previous state
                selected[i] = False
                state.pop()

    def permutations_ii(nums: list[int]) -> list[list[int]]:
        """Permutations II"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_ii.cpp"
    /* Backtracking algorithm: Permutations II */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // Traverse all choices
        unordered_set<int> duplicated;
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
                // Attempt: make choice, update state
                duplicated.emplace(choice); // Record the selected element value
                selected[i] = true;
                state.push_back(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Permutations II */
    vector<vector<int>> permutationsII(vector<int> nums) {
        vector<int> state;
        vector<bool> selected(nums.size(), false);
        vector<vector<int>> res;
        backtrack(state, nums, selected, res);
        return res;
    }
    ```

=== "Java"

    ```java title="permutations_ii.java"
    /* Backtracking algorithm: Permutations II */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Traverse all choices
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.contains(choice)) {
                // Attempt: make choice, update state
                duplicated.add(choice); // Record the selected element value
                selected[i] = true;
                state.add(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Permutations II */
    List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_ii.cs"
    /* Backtracking algorithm: Permutations II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // When the state length equals the number of elements, record the solution
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Traverse all choices
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Attempt: make choice, update state
                duplicated.Add(choice); // Record the selected element value
                selected[i] = true;
                state.Add(choice);
                // Proceed to the next round of selection
                Backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Permutations II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_ii.go"
    /* Backtracking algorithm: Permutations II */
    func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // When the state length equals the number of elements, record the solution
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // Traverse all choices
        duplicated := make(map[int]struct{}, 0)
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
                // Attempt: make choice, update state
                // Record the selected element value
                duplicated[choice] = struct{}{}
                (*selected)[i] = true
                *state = append(*state, choice)
                // Proceed to the next round of selection
                backtrackII(state, choices, selected, res)
                // Backtrack: undo choice, restore to previous state
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* Permutations II */
    func permutationsII(nums []int) [][]int {
        res := make([][]int, 0)
        state := make([]int, 0)
        selected := make([]bool, len(nums))
        backtrackII(&state, &nums, &selected, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="permutations_ii.swift"
    /* Backtracking algorithm: Permutations II */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // When the state length equals the number of elements, record the solution
        if state.count == choices.count {
            res.append(state)
            return
        }
        // Traverse all choices
        var duplicated: Set<Int> = []
        for (i, choice) in choices.enumerated() {
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if !selected[i], !duplicated.contains(choice) {
                // Attempt: make choice, update state
                duplicated.insert(choice) // Record the selected element value
                selected[i] = true
                state.append(choice)
                // Proceed to the next round of selection
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // Backtrack: undo choice, restore to previous state
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* Permutations II */
    func permutationsII(nums: [Int]) -> [[Int]] {
        var state: [Int] = []
        var selected = Array(repeating: false, count: nums.count)
        var res: [[Int]] = []
        backtrack(state: &state, choices: nums, selected: &selected, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="permutations_ii.js"
    /* Backtracking algorithm: Permutations II */
    function backtrack(state, choices, selected, res) {
        // When the state length equals the number of elements, record the solution
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.has(choice)) {
                // Attempt: make choice, update state
                duplicated.add(choice); // Record the selected element value
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Permutations II */
    function permutationsII(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_ii.ts"
    /* Backtracking algorithm: Permutations II */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // When the state length equals the number of elements, record the solution
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // Traverse all choices
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.has(choice)) {
                // Attempt: make choice, update state
                duplicated.add(choice); // Record the selected element value
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* Permutations II */
    function permutationsII(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_ii.dart"
    /* Backtracking algorithm: Permutations II */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // When the state length equals the number of elements, record the solution
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // Traverse all choices
      Set<int> duplicated = {};
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if (!selected[i] && !duplicated.contains(choice)) {
          // Attempt: make choice, update state
          duplicated.add(choice); // Record the selected element value
          selected[i] = true;
          state.add(choice);
          // Proceed to the next round of selection
          backtrack(state, choices, selected, res);
          // Backtrack: undo choice, restore to previous state
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* Permutations II */
    List<List<int>> permutationsII(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_ii.rs"
    /* Backtracking algorithm: Permutations II */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // When the state length equals the number of elements, record the solution
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // Traverse all choices
        let mut duplicated = HashSet::<i32>::new();
        for i in 0..choices.len() {
            let choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if !selected[i] && !duplicated.contains(&choice) {
                // Attempt: make choice, update state
                duplicated.insert(choice); // Record the selected element value
                selected[i] = true;
                state.push(choice);
                // Proceed to the next round of selection
                backtrack(state.clone(), choices, selected, res);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
                state.pop();
            }
        }
    }

    /* Permutations II */
    fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_ii.c"
    /* Backtracking algorithm: Permutations II */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // When the state length equals the number of elements, record the solution
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // Traverse all choices
        bool duplicated[MAX_SIZE] = {false};
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated[choice]) {
                // Attempt: make choice, update state
                duplicated[choice] = true; // Record the selected element value
                selected[i] = true;
                state[stateSize] = choice;
                // Proceed to the next round of selection
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // Backtrack: undo choice, restore to previous state
                selected[i] = false;
            }
        }
    }

    /* Permutations II */
    int **permutationsII(int *nums, int numsSize, int *returnSize) {
        int *state = (int *)malloc(numsSize * sizeof(int));
        bool *selected = (bool *)malloc(numsSize * sizeof(bool));
        for (int i = 0; i < numsSize; i++) {
            selected[i] = false;
        }
        int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
        *returnSize = 0;

        backtrack(state, 0, nums, numsSize, selected, res, returnSize);

        free(state);
        free(selected);

        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="permutations_ii.kt"
    /* Backtracking algorithm: Permutations II */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // When the state length equals the number of elements, record the solution
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // Traverse all choices
        val duplicated = HashSet<Int>()
        for (i in choices.indices) {
            val choice = choices[i]
            // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if (!selected[i] && !duplicated.contains(choice)) {
                // Attempt: make choice, update state
                duplicated.add(choice) // Record the selected element value
                selected[i] = true
                state.add(choice)
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                // Backtrack: undo choice, restore to previous state
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* Permutations II */
    fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="permutations_ii.rb"
    ### Backtracking: permutations II ###
    def backtrack(state, choices, selected, res)
      # When the state length equals the number of elements, record the solution
      if state.length == choices.length
        res << state.dup
        return
      end

      # Traverse all choices
      duplicated = Set.new
      choices.each_with_index do |choice, i|
        # Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if !selected[i] && !duplicated.include?(choice)
          # Attempt: make choice, update state
          duplicated.add(choice)
          selected[i] = true
          state << choice
          # Proceed to the next round of selection
          backtrack(state, choices, selected, res)
          # Backtrack: undo choice, restore to previous state
          selected[i] = false
          state.pop
        end
      end
    end

    ### Permutations II ###
    def permutations_ii(nums)
      res = []
      backtrack([], nums, Array.new(nums.length, false), res)
      res
    end
    ```

Assuming elements are pairwise distinct, there are $n!$ (factorial) permutations of $n$ elements. When recording results, we need to copy a list of length $n$, using $O(n)$ time. **Therefore, the time complexity is $O(n! \cdot n)$**.

The maximum recursion depth is $n$, using $O(n)$ stack frame space. `selected` uses $O(n)$ space. At most $n$ `duplicated` sets exist simultaneously, using $O(n^2)$ space. **Therefore, the space complexity is $O(n^2)$**.

### 3. &nbsp; Comparison of Two Pruning Methods

Note that although both `selected` and `duplicated` are used for pruning, they have different objectives.

- **Pruning duplicate choices**: There is only one `selected` throughout the entire search process. It records which elements are included in the current state, and its purpose is to prevent an element from appearing repeatedly in `state`.
- **Pruning duplicate elements**: Each round of choices (each `backtrack` function call) contains a `duplicated` set. It records which elements have been chosen in this round's iteration (the `for` loop), and its purpose is to ensure that equal elements are chosen only once.

Figure 13-9 shows the effective scope of the two pruning conditions. Note that each node in the tree represents a choice, and the nodes on the path from the root to a leaf node form a permutation.

![Effective scope of two pruning conditions](permutations_problem.assets/permutations_ii_pruning_summary.png){ class="animation-figure" }

<p align="center"> Figure 13-9 &nbsp; Effective scope of two pruning conditions </p>
