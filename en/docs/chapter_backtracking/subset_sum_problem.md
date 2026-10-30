---
comments: true
---

# 13.3 &nbsp; Subset sum problem

## 13.3.1 &nbsp; Distinct elements

!!! question

    Given an array of positive integers `nums` and a positive target integer `target`, find all combinations whose elements sum to `target`. The array has no duplicate elements, and each element may be chosen multiple times. Return the combinations as a list containing no duplicates.

For example, with input $\{3, 4, 5\}$ and target $9$, the solutions are $\{3, 3, 3\}, \{4, 5\}$. Keep two points in mind.

- Each input element may be chosen an unlimited number of times.
- Element order does not matter: $\{4, 5\}$ and $\{5, 4\}$ represent the same subset.

### 1. &nbsp; Starting from the permutations solution

As with permutations, we can view generating a subset as a sequence of choices. Update the sum as we make choices, and record the subset when the sum equals `target`.

Unlike permutations, **each element may be chosen an unlimited number of times**, so we do not need a Boolean `selected` list. A small modification to the permutations code gives an initial solution:

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """Backtracking: subset sum I"""
        # Record a solution when the subset sum equals target
        if total == target:
            res.append(list(state))
            return
        # Iterate over all choices
        for i in range(len(choices)):
            # Prune: skip this choice if the subset sum would exceed target
            if total + choices[i] > target:
                continue
            # Try: make a choice and update the sum total
            state.append(choices[i])
            # Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res)
            # Backtrack: undo the choice and restore the previous state
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum I (with duplicate subsets)"""
        state = []  # State (subset)
        total = 0  # Subset sum
        res = []  # Result list (list of subsets)
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* Backtracking: subset sum I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            res.push_back(state);
            return;
        }
        // Iterate over all choices
        for (size_t i = 0; i < choices.size(); i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.push_back(choices[i]);
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop_back();
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // State (subset)
        int total = 0;           // Subset sum
        vector<vector<int>> res; // Result list (list of subsets)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* Backtracking: subset sum I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Iterate over all choices
        for (int i = 0; i < choices.length; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.add(choices[i]);
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        int total = 0; // Subset sum
        List<List<Integer>> res = new ArrayList<>(); // Result list (list of subsets)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    /* Backtracking: subset sum I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        for (int i = 0; i < choices.Length; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.Add(choices[i]);
            // Proceed to the next choice
            Backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // State (subset)
        int total = 0; // Subset sum
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* Backtracking: subset sum I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // Record a solution when the subset sum equals target
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Iterate over all choices
        for i := 0; i < len(*choices); i++ {
            // Prune: skip this choice if the subset sum would exceed target
            if total+(*choices)[i] > target {
                continue
            }
            // Try: make a choice and update the sum total
            *state = append(*state, (*choices)[i])
            // Proceed to the next choice
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // Backtrack: undo the choice and restore the previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        total := 0              // Subset sum
        res := make([][]int, 0) // Result list (list of subsets)
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* Backtracking: subset sum I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // Record a solution when the subset sum equals target
        if total == target {
            res.append(state)
            return
        }
        // Iterate over all choices
        for i in choices.indices {
            // Prune: skip this choice if the subset sum would exceed target
            if total + choices[i] > target {
                continue
            }
            // Try: make a choice and update the sum total
            state.append(choices[i])
            // Proceed to the next choice
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // Backtrack: undo the choice and restore the previous state
            state.removeLast()
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let total = 0 // Subset sum
        var res: [[Int]] = [] // Result list (list of subsets)
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* Backtracking: subset sum I */
    function backtrack(state, target, total, choices, res) {
        // Record a solution when the subset sum equals target
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        for (let i = 0; i < choices.length; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    function subsetSumINaive(nums, target) {
        const state = []; // State (subset)
        const total = 0; // Subset sum
        const res = []; // Result list (list of subsets)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* Backtracking: subset sum I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // Record a solution when the subset sum equals target
        if (total === target) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        for (let i = 0; i < choices.length; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        const total = 0; // Subset sum
        const res = []; // Result list (list of subsets)
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* Backtracking: subset sum I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // Record a solution when the subset sum equals target
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // Iterate over all choices
      for (int i = 0; i < choices.length; i++) {
        // Prune: skip this choice if the subset sum would exceed target
        if (total + choices[i] > target) {
          continue;
        }
        // Try: make a choice and update the sum total
        state.add(choices[i]);
        // Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice and restore the previous state
        state.removeLast();
      }
    }

    /* Solve subset sum I (with duplicate subsets) */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      int total = 0; // Sum of the elements
      List<List<int>> res = []; // Result list (list of subsets)
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* Backtracking: subset sum I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // Record a solution when the subset sum equals target
        if total == target {
            res.push(state.clone());
            return;
        }
        // Iterate over all choices
        for i in 0..choices.len() {
            // Prune: skip this choice if the subset sum would exceed target
            if total + choices[i] > target {
                continue;
            }
            // Try: make a choice and update the sum total
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        let total = 0; // Subset sum
        let mut res = Vec::new(); // Result list (list of subsets)
        backtrack(&mut state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* Backtracking: subset sum I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Iterate over all choices
        for (int i = 0; i < choicesSize; i++) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue;
            }
            // Try: make a choice and update the sum total
            state[stateSize++] = choices[i];
            // Proceed to the next choice
            backtrack(target, total + choices[i], choices, choicesSize);
            // Backtrack: undo the choice and restore the previous state
            stateSize--;
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // Initialize the solution count to 0
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* Backtracking: subset sum I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // Record a solution when the subset sum equals target
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // Iterate over all choices
        for (i in choices.indices) {
            // Prune: skip this choice if the subset sum would exceed target
            if (total + choices[i] > target) {
                continue
            }
            // Try: make a choice and update the sum total
            state.add(choices[i])
            // Proceed to the next choice
            backtrack(state, target, total + choices[i], choices, res)
            // Backtrack: undo the choice and restore the previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum I (with duplicate subsets) */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        val total = 0 // Subset sum
        val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
        backtrack(state, target, total, nums, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    ### Backtracking: subset sum I ###
    def backtrack(state, target, total, choices, res)
      # Record a solution when the subset sum equals target
      if total == target
        res << state.dup
        return
      end

      # Iterate over all choices
      for i in 0...choices.length
        # Prune: skip this choice if the subset sum would exceed target
        next if total + choices[i] > target
        # Try: make a choice and update the sum total
        state << choices[i]
        # Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop
      end
    end

    ### Solve subset sum I (with duplicate subsets)###
    def subset_sum_i_naive(nums, target)
      state = [] # State (subset)
      total = 0 # Subset sum
      res = [] # Result list (list of subsets)
      backtrack(state, target, total, nums, res)
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20I%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20subset%20sum%20equals%20target%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Prune%3A%20skip%20this%20choice%20if%20the%20subset%20sum%20would%20exceed%20target%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20the%20sum%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20I%20%28with%20duplicate%20subsets%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20total%20%3D%200%20%20%23%20Subset%20sum%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22Note%20that%20this%20method%20produces%20duplicate%20subsets%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20I%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20subset%20sum%20equals%20target%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Prune%3A%20skip%20this%20choice%20if%20the%20subset%20sum%20would%20exceed%20target%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20the%20sum%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20I%20%28with%20duplicate%20subsets%29%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20total%20%3D%200%20%20%23%20Subset%20sum%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22Note%20that%20this%20method%20produces%20duplicate%20subsets%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

For input array $[3, 4, 5]$ and target $9$, this code returns $[3, 3, 3], [4, 5], [5, 4]$. **It finds all subsets summing to $9$, but includes the duplicate subsets $[4, 5]$ and $[5, 4]$**.

The search distinguishes the order of choices, whereas subsets do not. As shown in Figure 13-10, choosing $4$ then $5$ and choosing $5$ then $4$ follow different branches but produce the same subset.

![Subset search and pruning when the sum exceeds the target](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> Figure 13-10 &nbsp; Subset search and pruning when the sum exceeds the target </p>

**One straightforward way to remove duplicate subsets is to deduplicate the result list**. However, this is inefficient for two reasons.

- With many array elements, especially when `target` is large, the search generates many duplicate subsets.
- Comparing subsets (arrays) is expensive: we must sort them first, then compare their elements one by one.

### 2. &nbsp; Pruning duplicate subsets

**Instead, we can eliminate duplicates by pruning during the search**. As shown in Figure 13-11, duplicates arise when array elements are chosen in different orders, as in the following example.

1. Choosing $3$ and then $4$ in the first two rounds generates all subsets beginning with these choices, denoted by $[3, 4, \dots]$.
2. Later, after choosing $4$ first, **we should skip $3$ in the second round**, because subsets $[4, 3, \dots]$ duplicate those generated in step `1.`.

At each level of the search, choices are tried from left to right, so branches farther to the right have more choices pruned.

1. Choosing $3$ and then $5$ generates subsets $[3, 5, \dots]$.
2. Choosing $4$ and then $5$ generates subsets $[4, 5, \dots]$.
3. If $5$ is chosen first, **skip both $3$ and $4$ in the second round**, because $[5, 3, \dots]$ and $[5, 4, \dots]$ duplicate the subsets described in steps `1.` and `2.`.

![Duplicate subsets caused by different choice orders](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-11 &nbsp; Duplicate subsets caused by different choice orders </p>

In general, for input $[x_1, x_2, \dots, x_n]$, a sequence of choices $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$ must satisfy $i_1 \leq i_2 \leq \dots \leq i_m$. **Any sequence violating this condition creates a duplicate and should be pruned**.

### 3. &nbsp; Code implementation

To implement this pruning, introduce `start` to specify where iteration begins. **After choosing $x_{i}$, begin the next round at index $i$**. This enforces $i_1 \leq i_2 \leq \dots \leq i_m$ and ensures that each subset is unique.

We also make two further improvements.

- Sort `nums` before starting the search. While iterating over choices, **stop the loop as soon as the subset sum exceeds `target`**, because all later elements are larger and would also exceed it.
- Remove the sum variable `total` and **track the sum by subtracting from `target`**. Record a solution when `target` reaches $0$.

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking: subset sum I"""
        # Record a solution when the remaining target is zero
        if target == 0:
            res.append(list(state))
            return
        # Iterate over all choices
        # Pruning 2: iterate from start to avoid generating duplicate subsets
        for i in range(start, len(choices)):
            # Pruning 1: exit the loop if this choice exceeds the remaining target
            # The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0:
                break
            # Try: make a choice and update target and start
            state.append(choices[i])
            # Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res)
            # Backtrack: undo the choice and restore the previous state
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum I"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Starting index for iteration
        res = []  # Result list (list of subsets)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* Backtracking: subset sum I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // Record a solution when the remaining target reaches 0
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (int i = start; i < choices.size(); i++) {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.push_back(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop_back();
        }
    }

    /* Solve subset sum I */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // State (subset)
        sort(nums.begin(), nums.end()); // Sort nums
        int start = 0;                  // Starting index for iteration
        vector<vector<int>> res;        // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* Backtracking: subset sum I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Record a solution when the remaining target is zero, so the subset sums to the original target
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if the next element exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.add(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum I */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<Integer>> res = new ArrayList<>(); // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    /* Backtracking: subset sum I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.Add(choices[i]);
            // Proceed to the next choice
            Backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* Backtracking: subset sum I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // Record a solution when the subset reaches the original target sum (remaining target is zero)
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for i := start; i < len(*choices); i++ {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target-(*choices)[i] < 0 {
                break
            }
            // Try: make a choice and update target and start
            *state = append(*state, (*choices)[i])
            // Proceed to the next choice
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // Backtrack: undo the choice and restore the previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum I */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        sort.Ints(nums)         // Sort nums
        start := 0              // Starting index for iteration
        res := make([][]int, 0) // Result list (list of subsets)
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* Backtracking: subset sum I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // Record a solution when the remaining target reaches zero
        if target == 0 {
            res.append(state)
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for i in choices.indices.dropFirst(start) {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0 {
                break
            }
            // Try: make a choice and update target and start
            state.append(choices[i])
            // Proceed to the next choice
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // Backtrack: undo the choice and restore the previous state
            state.removeLast()
        }
    }

    /* Solve subset sum I */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let nums = nums.sorted() // Sort nums
        let start = 0 // Starting index for iteration
        var res: [[Int]] = [] // Result list (list of subsets)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* Backtracking: subset sum I */
    function backtrack(state, target, choices, start, res) {
        // Record a solution when the remaining target is zero, so the subset sum equals the original target
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if the next choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    function subsetSumI(nums, target) {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Starting index for iteration
        const res = []; // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* Backtracking: subset sum I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Starting index for iteration
        const res = []; // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* Backtracking: subset sum I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // Record a solution when the subset sum reaches the original target (the remaining target is 0)
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Iterate over all choices
      // Pruning 2: iterate from start to avoid generating duplicate subsets
      for (int i = start; i < choices.length; i++) {
        // Pruning 1: exit the loop if this choice exceeds the remaining target
        // The array is sorted, so later elements are at least as large and also exceed the remaining target
        if (target - choices[i] < 0) {
          break;
        }
        // Try: make a choice and update target and start
        state.add(choices[i]);
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice and restore the previous state
        state.removeLast();
      }
    }

    /* Solve subset sum I */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      nums.sort(); // Sort nums
      int start = 0; // Starting index for iteration
      List<List<int>> res = []; // Result list (list of subsets)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* Backtracking: subset sum I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // Record a solution when the remaining target is zero
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for i in start..choices.len() {
            // Pruning 1: exit the loop if the next element exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0 {
                break;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum I */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        nums.sort(); // Sort nums
        let start = 0; // Starting index for iteration
        let mut res = Vec::new(); // Result list (list of subsets)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* Backtracking: subset sum I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // Record a solution when the remaining target is 0
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (int i = start; i < choicesSize; i++) {
            // Pruning 1: exit the loop if the choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Try: make a choice and update target and start
            state[stateSize] = choices[i];
            stateSize++;
            // Proceed to the next choice
            backtrack(target - choices[i], choices, choicesSize, i);
            // Backtrack: undo the choice and restore the previous state
            stateSize--;
        }
    }

    /* Solve subset sum I */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // Sort nums
        int start = 0;                           // Starting index for iteration
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* Backtracking: subset sum I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        for (i in start..<choices.size) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break
            }
            // Try: make a choice and update target and start
            state.add(choices[i])
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i, res)
            // Backtrack: undo the choice and restore the previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum I */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        nums.sort() // Sort nums
        val start = 0 // Starting index for iteration
        val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    ### Backtracking: subset sum I ###
    def backtrack(state, target, choices, start, res)
      # Record a solution when the remaining target reaches zero
      if target.zero?
        res << state.dup
        return
      end
      # Iterate over all choices
      # Pruning 2: iterate from start to avoid generating duplicate subsets
      for i in start...choices.length
        # Pruning 1: exit the loop if this choice would exceed the remaining target
        # The array is sorted, so later elements are at least as large and would also exceed the remaining target
        break if target - choices[i] < 0
        # Try: make a choice and update target and start
        state << choices[i]
        # Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop
      end
    end

    ### Solve subset sum I ###
    def subset_sum_i(nums, target)
      state = [] # State (subset)
      nums.sort! # Sort nums
      start = 0 # Starting index for iteration
      res = [] # Result list (list of subsets)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20I%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20remaining%20target%20is%20zero%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20%23%20Pruning%202%3A%20iterate%20from%20start%20to%20avoid%20generating%20duplicate%20subsets%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Pruning%201%3A%20exit%20the%20loop%20if%20the%20chosen%20value%20exceeds%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20%23%20The%20array%20is%20sorted,%20so%20later%20elements%20are%20at%20least%20as%20large%20and%20also%20exceed%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20target%20and%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20Sort%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20Starting%20index%20for%20iteration%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20I%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20remaining%20target%20is%20zero%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20%23%20Pruning%202%3A%20iterate%20from%20start%20to%20avoid%20generating%20duplicate%20subsets%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Pruning%201%3A%20exit%20the%20loop%20if%20the%20chosen%20value%20exceeds%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20%23%20The%20array%20is%20sorted,%20so%20later%20elements%20are%20at%20least%20as%20large%20and%20also%20exceed%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20target%20and%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20Sort%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20Starting%20index%20for%20iteration%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 13-12 shows the complete backtracking process for input $[3, 4, 5]$ and target $9$.

![Backtracking for subset sum I](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> Figure 13-12 &nbsp; Backtracking for subset sum I </p>

## 13.3.2 &nbsp; Duplicate elements

!!! question

    Given an array of positive integers `nums` and a positive target integer `target`, find all combinations whose elements sum to `target`. **The array may contain duplicate elements, and each element may be chosen only once**. Return the combinations as a list containing no duplicates.

Unlike the previous problem, **the input may contain duplicate elements**, which introduces a new issue. For array $[4, \hat{4}, 5]$ and target $9$, for example, the existing code produces $[4, 5], [\hat{4}, 5]$: duplicate subsets.

**These duplicates occur because equal elements are tried more than once in a single round**. In Figure 13-13, the first round has three choices, two of which are $4$. They generate duplicate branches and therefore duplicate subsets. The two occurrences of $4$ in the second round cause the same problem.

![Duplicate subsets caused by equal elements](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> Figure 13-13 &nbsp; Duplicate subsets caused by equal elements </p>

### 1. &nbsp; Pruning equal elements

To solve this, **try each value only once in each round**. The implementation uses the fact that equal elements are adjacent in a sorted array. Within a round, if an element equals the preceding element, that value has already been tried, so skip the current element.

In addition, **each array element may be chosen only once**. Fortunately, `start` can enforce this constraint too: after choosing $x_{i}$, begin the next round at index $i + 1$. This both eliminates duplicate subsets and prevents reusing an element.

### 2. &nbsp; Code implementation

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """Backtracking: subset sum II"""
        # Record a solution when the remaining target is zero
        if target == 0:
            res.append(list(state))
            return
        # Iterate over all choices
        # Pruning 2: iterate from start to avoid generating duplicate subsets
        # Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for i in range(start, len(choices)):
            # Pruning 1: exit the loop if this choice exceeds the remaining target
            # The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0:
                break
            # Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if i > start and choices[i] == choices[i - 1]:
                continue
            # Try: make a choice and update target and start
            state.append(choices[i])
            # Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res)
            # Backtrack: undo the choice and restore the previous state
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """Solve subset sum II"""
        state = []  # State (subset)
        nums.sort()  # Sort nums
        start = 0  # Starting index for iteration
        res = []  # Result list (list of subsets)
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* Backtracking: subset sum II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // Record a solution when the remaining target reaches 0
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: iterate from start to avoid choosing the same element again
        for (int i = start; i < choices.size(); i++) {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.push_back(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop_back();
        }
    }

    /* Solve subset sum II */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // State (subset)
        sort(nums.begin(), nums.end()); // Sort nums
        int start = 0;                  // Starting index for iteration
        vector<vector<int>> res;        // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* Backtracking: subset sum II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Record a solution when the remaining target is zero, so the subset sums to the original target
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: iterate from start to avoid choosing the same element again
        for (int i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if the next element exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.add(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.remove(state.size() - 1);
        }
    }

    /* Solve subset sum II */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // State (subset)
        Arrays.sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<Integer>> res = new ArrayList<>(); // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    /* Backtracking: subset sum II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for (int i = start; i < choices.Length; i++) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.Add(choices[i]);
            // Proceed to the next choice
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Solve subset sum II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // State (subset)
        Array.Sort(nums); // Sort nums
        int start = 0; // Starting index for iteration
        List<List<int>> res = []; // Result list (list of subsets)
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* Backtracking: subset sum II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // Record a solution when the subset reaches the original target sum (remaining target is zero)
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for i := start; i < len(*choices); i++ {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target-(*choices)[i] < 0 {
                break
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // Try: make a choice and update target and start
            *state = append(*state, (*choices)[i])
            // Proceed to the next choice
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // Backtrack: undo the choice and restore the previous state
            *state = (*state)[:len(*state)-1]
        }
    }

    /* Solve subset sum II */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // State (subset)
        sort.Ints(nums)         // Sort nums
        start := 0              // Starting index for iteration
        res := make([][]int, 0) // Result list (list of subsets)
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* Backtracking: subset sum II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // Record a solution when the remaining target reaches zero
        if target == 0 {
            res.append(state)
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for i in choices.indices.dropFirst(start) {
            // Pruning 1: exit the loop if this choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0 {
                break
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // Try: make a choice and update target and start
            state.append(choices[i])
            // Proceed to the next choice
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // Backtrack: undo the choice and restore the previous state
            state.removeLast()
        }
    }

    /* Solve subset sum II */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // State (subset)
        let nums = nums.sorted() // Sort nums
        let start = 0 // Starting index for iteration
        var res: [[Int]] = [] // Result list (list of subsets)
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* Backtracking: subset sum II */
    function backtrack(state, target, choices, start, res) {
        // Record a solution when the remaining target is zero, so the subset sum equals the original target
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if the next choice exceeds the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    function subsetSumII(nums, target) {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Starting index for iteration
        const res = []; // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* Backtracking: subset sum II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for (let i = start; i < choices.length; i++) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // State (subset)
        nums.sort((a, b) => a - b); // Sort nums
        const start = 0; // Starting index for iteration
        const res = []; // Result list (list of subsets)
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* Backtracking: subset sum II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // Record a solution when the subset sum reaches the original target (the remaining target is 0)
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // Iterate over all choices
      // Pruning 2: iterate from start to avoid generating duplicate subsets
      // Pruning 3: start after the previously chosen index to avoid choosing the same element again
      for (int i = start; i < choices.length; i++) {
        // Pruning 1: exit the loop if this choice exceeds the remaining target
        // The array is sorted, so later elements are at least as large and also exceed the remaining target
        if (target - choices[i] < 0) {
          break;
        }
        // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // Try: make a choice and update target and start
        state.add(choices[i]);
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Backtrack: undo the choice and restore the previous state
        state.removeLast();
      }
    }

    /* Solve subset sum II */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // State (subset)
      nums.sort(); // Sort nums
      int start = 0; // Starting index for iteration
      List<List<int>> res = []; // Result list (list of subsets)
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* Backtracking: subset sum II */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // Record a solution when the remaining target is zero
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: iterate from start to avoid choosing the same element again
        for i in start..choices.len() {
            // Pruning 1: exit the loop if the next element exceeds the remaining target
            // The array is sorted, so later elements are at least as large and also exceed the remaining target
            if target - choices[i] < 0 {
                break;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // Try: make a choice and update target and start
            state.push(choices[i]);
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack: undo the choice and restore the previous state
            state.pop();
        }
    }

    /* Solve subset sum II */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // State (subset)
        nums.sort(); // Sort nums
        let start = 0; // Starting index for iteration
        let mut res = Vec::new(); // Result list (list of subsets)
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* Backtracking: subset sum II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // Record a solution when the remaining target is 0
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: iterate from start to avoid choosing the same element again
        for (int i = start; i < choicesSize; i++) {
            // Pruning 1: skip this choice if it exceeds the remaining target
            if (target - choices[i] < 0) {
                continue;
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: make a choice and update target and start
            state[stateSize] = choices[i];
            stateSize++;
            // Proceed to the next choice
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // Backtrack: undo the choice and restore the previous state
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
    /* Backtracking: subset sum II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // Record a solution when the subset reaches the original target (remaining target is 0)
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // Iterate over all choices
        // Pruning 2: iterate from start to avoid generating duplicate subsets
        // Pruning 3: start after the previously chosen index to avoid choosing the same element again
        for (i in start..<choices.size) {
            // Pruning 1: exit the loop if this choice would exceed the remaining target
            // The array is sorted, so later elements are at least as large and would also exceed the remaining target
            if (target - choices[i] < 0) {
                break
            }
            // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // Try: make a choice and update target and start
            state.add(choices[i])
            // Proceed to the next choice
            backtrack(state, target - choices[i], choices, i + 1, res)
            // Backtrack: undo the choice and restore the previous state
            state.removeAt(state.size - 1)
        }
    }

    /* Solve subset sum II */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // State (subset)
        nums.sort() // Sort nums
        val start = 0 // Starting index for iteration
        val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    ### Backtracking: subset sum II ###
    def backtrack(state, target, choices, start, res)
      # Record a solution when the remaining target reaches zero
      if target.zero?
        res << state.dup
        return
      end

      # Iterate over all choices
      # Pruning 2: iterate from start to avoid generating duplicate subsets
      # Pruning 3: start after the previously chosen index to avoid choosing the same element again
      for i in start...choices.length
        # Pruning 1: exit the loop if this choice would exceed the remaining target
        # The array is sorted, so later elements are at least as large and would also exceed the remaining target
        break if target - choices[i] < 0
        # Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
        next if i > start && choices[i] == choices[i - 1]
        # Try: make a choice and update target and start
        state << choices[i]
        # Proceed to the next choice
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop
      end
    end

    ### Solve subset sum II ###
    def subset_sum_ii(nums, target)
      state = [] # State (subset)
      nums.sort! # Sort nums
      start = 0 # Starting index for iteration
      res = [] # Result list (list of subsets)
      backtrack(state, target, nums, start, res)
      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20II%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20remaining%20target%20is%20zero%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20%23%20Pruning%202%3A%20iterate%20from%20start%20to%20avoid%20generating%20duplicate%20subsets%0A%20%20%20%20%23%20Pruning%203%3A%20start%20after%20the%20previously%20chosen%20index%20to%20avoid%20choosing%20the%20same%20element%20again%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Pruning%201%3A%20exit%20the%20loop%20if%20the%20chosen%20value%20exceeds%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20%23%20The%20array%20is%20sorted,%20so%20later%20elements%20are%20at%20least%20as%20large%20and%20also%20exceed%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20Pruning%204%3A%20if%20this%20element%20equals%20its%20left%20neighbor%20at%20the%20same%20search%20depth,%20the%20branch%20is%20a%20duplicate%3B%20skip%20it%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20target%20and%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20Sort%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20Starting%20index%20for%20iteration%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20subset%20sum%20II%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20the%20remaining%20target%20is%20zero%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20choices%0A%20%20%20%20%23%20Pruning%202%3A%20iterate%20from%20start%20to%20avoid%20generating%20duplicate%20subsets%0A%20%20%20%20%23%20Pruning%203%3A%20start%20after%20the%20previously%20chosen%20index%20to%20avoid%20choosing%20the%20same%20element%20again%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20Pruning%201%3A%20exit%20the%20loop%20if%20the%20chosen%20value%20exceeds%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20%23%20The%20array%20is%20sorted,%20so%20later%20elements%20are%20at%20least%20as%20large%20and%20also%20exceed%20the%20remaining%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20Pruning%204%3A%20if%20this%20element%20equals%20its%20left%20neighbor%20at%20the%20same%20search%20depth,%20the%20branch%20is%20a%20duplicate%3B%20skip%20it%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20Try%3A%20make%20a%20choice%20and%20update%20target%20and%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20Proceed%20to%20the%20next%20choice%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20undo%20the%20choice%20and%20restore%20the%20previous%20state%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20subset%20sum%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20State%20%28subset%29%0A%20%20%20%20nums.sort%28%29%20%20%23%20Sort%20nums%0A%20%20%20%20start%20%3D%200%20%20%23%20Starting%20index%20for%20iteration%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20Result%20list%20%28list%20of%20subsets%29%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22Input%20array%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22All%20subsets%20with%20sum%20%7Btarget%7D%3A%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 13-14 shows backtracking for array $[4, 4, 5]$ and target $9$, including four types of pruning. Follow the illustration alongside the code comments to understand the full search and how each pruning rule works.

![Backtracking for subset sum II](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-14 &nbsp; Backtracking for subset sum II </p>
