---
comments: true
---

# 13.2 &nbsp; Permutation problem

The permutation problem is a typical application of the backtracking algorithm. It involves finding all possible arrangements (permutations) of elements from a given set, such as an array or a string.

Table 13-2 shows several examples, including input arrays and their corresponding permutations.

<p align="center"> Table 13-2 &nbsp; Permutation examples </p>

<div class="center-table" markdown>

| Input array | Permutations                                                       |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

</div>

## 13.2.1 &nbsp; Cases without duplicate elements

!!! question

    Given an integer array with no duplicate elements, return all possible permutations.

From a backtracking perspective, **we can view the process of generating permutations as a series of choices.** Suppose the input array is $[1, 2, 3]$. If we choose $1$ first, then $3$, and finally $2$, we get the permutation $[1, 3, 2]$. "Backtracking" means undoing a previous choice and exploring alternative options.

From a coding perspective, the candidate set `choices` consists of all elements in the input array, while `state` holds the elements selected so far. Since each element can only be chosen once, **all elements in `state` must be unique**.

As illustrated in Figure 13-5, we can expand the search process into a recursive tree, where each node represents the current `state`. Starting from the root node, after three rounds of selections, we reach the leaf nodes—each corresponding to a permutation.

![Permutation recursive tree](permutations_problem.assets/permutations_i.png){ class="animation-figure" }

<p align="center"> Figure 13-5 &nbsp; Permutation recursive tree </p>

### 1. &nbsp; Repeated-choice pruning

To ensure each element is selected only once, we introduce a boolean array `selected`, where `selected[i]` indicates whether `choices[i]` has been chosen. We then base our pruning steps on this array:

- After choosing `choice[i]`, set `selected[i]` to $\text{True}$ to mark it as chosen.
- While iterating through `choices`, skip all elements marked as chosen (i.e., prune those branches).

As shown in Figure 13-6, suppose we choose 1 in the first round, then 3 in the second round, and finally 2 in the third round. We need to prune the branch for element 1 in the second round and the branches for elements 1 and 3 in the third round.

![Permutation pruning example](permutations_problem.assets/permutations_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-6 &nbsp; Permutation pruning example </p>

From the figure, we can see that this pruning process reduces the search space from $O(n^n)$ to $O(n!)$.

### 2. &nbsp; Code implementation

With this understanding, we can "fill in the blanks" of our framework code. To keep the overall code concise, we won’t implement each part of the framework separately but instead expand everything in the `backtrack()` function:

=== "Python"

    ```python title="permutations_i.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Backtracking algorithm: Permutation I"""
        # When the state length equals the number of elements, record the solution
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Traverse all choices
        for i, choice in enumerate(choices):
            # Pruning: do not allow repeated selection of elements
            if not selected[i]:
                # Attempt: make a choice, update the state
                selected[i] = True
                state.append(choice)
                # Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                # Retract: undo the choice, restore to the previous state
                selected[i] = False
                state.pop()

    def permutations_i(nums: list[int]) -> list[list[int]]:
        """Permutation I"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_i.cpp"
    /* Backtracking algorithm: Permutation I */
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
                // Attempt: make a choice, update the state
                selected[i] = true;
                state.push_back(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Retract: undo the choice, restore to the previous state
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Permutation I */
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
    /* Backtracking algorithm: Permutation I */
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
                // Attempt: make a choice, update the state
                selected[i] = true;
                state.add(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Retract: undo the choice, restore to the previous state
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Permutation I */
    List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_i.cs"
    [class]{permutations_i}-[func]{Backtrack}

    [class]{permutations_i}-[func]{PermutationsI}
    ```

=== "Go"

    ```go title="permutations_i.go"
    [class]{}-[func]{backtrackI}

    [class]{}-[func]{permutationsI}
    ```

=== "Swift"

    ```swift title="permutations_i.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "JS"

    ```javascript title="permutations_i.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "TS"

    ```typescript title="permutations_i.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "Dart"

    ```dart title="permutations_i.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "Rust"

    ```rust title="permutations_i.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutations_i}
    ```

=== "C"

    ```c title="permutations_i.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "Kotlin"

    ```kotlin title="permutations_i.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

=== "Ruby"

    ```ruby title="permutations_i.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutations_i}
    ```

=== "Zig"

    ```zig title="permutations_i.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsI}
    ```

## 13.2.2 &nbsp; Considering duplicate elements

!!! question

    Given an integer array**that may contain duplicate elements**, return all unique permutations.

Suppose the input array is $[1, 1, 2]$. To distinguish between the two identical elements $1$, we label the second one as $\hat{1}$.

As shown in Figure 13-7, half of the permutations produced by this method are duplicates:

![Duplicate permutations](permutations_problem.assets/permutations_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-7 &nbsp; Duplicate permutations </p>

So how can we eliminate these duplicate permutations? One direct approach is to use a hash set to remove duplicates after generating all permutations. However, this is less elegant **because branches that produce duplicates are inherently unnecessary and should be pruned in advance,** thus improving the algorithm’s efficiency.

### 1. &nbsp; Equal-element pruning

Looking at Figure 13-8, in the first round, choosing $1$ or $\hat{1}$ leads to the same permutations, so we prune $\hat{1}$.

Similarly, after choosing $2$ in the first round, choosing $1$ or $\hat{1}$ in the second round also leads to duplicate branches, so we prune $\hat{1}$ then as well.

Essentially, **our goal is to ensure that multiple identical elements are only selected once per round of choices.**

![Duplicate permutations pruning](permutations_problem.assets/permutations_ii_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-8 &nbsp; Duplicate permutations pruning </p>

### 2. &nbsp; Code implementation

Based on the code from the previous problem, we introduce a hash set `duplicated` in each round. This set keeps track of elements we have already attempted, so we can prune duplicates:

=== "Python"

    ```python title="permutations_ii.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """Backtracking algorithm: Permutation II"""
        # When the state length equals the number of elements, record the solution
        if len(state) == len(choices):
            res.append(list(state))
            return
        # Traverse all choices
        duplicated = set[int]()
        for i, choice in enumerate(choices):
            # Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
            if not selected[i] and choice not in duplicated:
                # Attempt: make a choice, update the state
                duplicated.add(choice)  # Record selected element values
                selected[i] = True
                state.append(choice)
                # Proceed to the next round of selection
                backtrack(state, choices, selected, res)
                # Retract: undo the choice, restore to the previous state
                selected[i] = False
                state.pop()

    def permutations_ii(nums: list[int]) -> list[list[int]]:
        """Permutation II"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_ii.cpp"
    /* Backtracking algorithm: Permutation II */
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
                // Attempt: make a choice, update the state
                duplicated.emplace(choice); // Record selected element values
                selected[i] = true;
                state.push_back(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Retract: undo the choice, restore to the previous state
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* Permutation II */
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
    /* Backtracking algorithm: Permutation II */
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
                // Attempt: make a choice, update the state
                duplicated.add(choice); // Record selected element values
                selected[i] = true;
                state.add(choice);
                // Proceed to the next round of selection
                backtrack(state, choices, selected, res);
                // Retract: undo the choice, restore to the previous state
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Permutation II */
    List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_ii.cs"
    [class]{permutations_ii}-[func]{Backtrack}

    [class]{permutations_ii}-[func]{PermutationsII}
    ```

=== "Go"

    ```go title="permutations_ii.go"
    [class]{}-[func]{backtrackII}

    [class]{}-[func]{permutationsII}
    ```

=== "Swift"

    ```swift title="permutations_ii.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "JS"

    ```javascript title="permutations_ii.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "TS"

    ```typescript title="permutations_ii.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "Dart"

    ```dart title="permutations_ii.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "Rust"

    ```rust title="permutations_ii.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutations_ii}
    ```

=== "C"

    ```c title="permutations_ii.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "Kotlin"

    ```kotlin title="permutations_ii.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

=== "Ruby"

    ```ruby title="permutations_ii.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutations_ii}
    ```

=== "Zig"

    ```zig title="permutations_ii.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{permutationsII}
    ```

Assuming all elements are distinct, there are $n!$ (factorial) permutations of $n$ elements. Recording each result requires copying a list of length $n$, which takes $O(n)$ time. **Hence, the total time complexity is $O(n!n)$.**

The maximum recursion depth is $n$, using $O(n)$ stack space. The `selected` array also requires $O(n)$ space. Because there can be up to $n$ separate `duplicated` sets at any one time, they collectively occupy $O(n^2)$ space. **Therefore, the space complexity is $O(n^2)$.**

### 3. &nbsp; Comparing the two pruning methods

Although both `selected` and `duplicated` serve as pruning mechanisms, they target different issues:

- **Repeated-choice pruning**(via `selected`): There is a single `selected` array for the entire search, indicating which elements are already in the current state. This prevents the same element from appearing more than once in `state`.
- **Equal-element pruning**(via `duplicated`): Each call to the `backtrack` function uses its own `duplicated` set, recording which elements have already been chosen in that specific iteration (`for` loop). This ensures that equal elements are selected only once per round of choices.

Figure 13-9 shows the scope of these two pruning strategies. Each node in the tree represents a choice; the path from the root to any leaf corresponds to one complete permutation.

![Scope of the two pruning conditions](permutations_problem.assets/permutations_ii_pruning_summary.png){ class="animation-figure" }

<p align="center"> Figure 13-9 &nbsp; Scope of the two pruning conditions </p>
