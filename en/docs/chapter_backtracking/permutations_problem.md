---
comments: true
---

# 13.2 &nbsp; Permutation problem

The permutation problem is a typical application of the backtracking algorithm. It is defined as finding all possible arrangements of elements from a given set (such as an array or string).

Table 13-2 lists several example data, including the input arrays and their corresponding permutations.

<p align="center"> Table 13-2 &nbsp; Permutation examples </p>

<div class="center-table" markdown>

| Input array | Permutations                                                       |
| :---------- | :----------------------------------------------------------------- |
| $[1]$       | $[1]$                                                              |
| $[1, 2]$    | $[1, 2], [2, 1]$                                                   |
| $[1, 2, 3]$ | $[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]$ |

</div>

## 13.2.1 &nbsp; Cases without equal elements

!!! question

    Enter an integer array without duplicate elements and return all possible permutations.

From the perspective of the backtracking algorithm, **we can imagine the process of generating permutations as a series of choices**. Suppose the input array is $[1, 2, 3]$, if we first choose $1$, then $3$, and finally $2$, we obtain the permutation $[1, 3, 2]$. Backtracking means undoing a choice and then continuing to try other choices.

From the code perspective, the candidate set `choices` contains all elements of the input array, and the state `state` contains elements that have been selected so far. Please note that each element can only be chosen once, **thus all elements in `state` must be unique**.

As shown in Figure 13-5, we can unfold the search process into a recursive tree, where each node represents the current state `state`. Starting from the root node, after three rounds of choices, we reach the leaf nodes, each corresponding to a permutation.

![Permutation recursive tree](permutations_problem.assets/permutations_i.png){ class="animation-figure" }

<p align="center"> Figure 13-5 &nbsp; Permutation recursive tree </p>

### 1. &nbsp; Pruning of repeated choices

To ensure that each element is selected only once, we consider introducing a boolean array `selected`, where `selected[i]` indicates whether `choices[i]` has been selected. We base our pruning operations on this array:

- After making the choice `choice[i]`, we set `selected[i]` to $\text{True}$, indicating it has been chosen.
- When iterating through the choice list `choices`, skip all nodes that have already been selected, i.e., prune.

As shown in Figure 13-6, suppose we choose 1 in the first round, 3 in the second round, and 2 in the third round, we need to prune the branch of element 1 in the second round and elements 1 and 3 in the third round.

![Permutation pruning example](permutations_problem.assets/permutations_i_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-6 &nbsp; Permutation pruning example </p>

Observing Figure 13-6, this pruning operation reduces the search space size from $O(n^n)$ to $O(n!)$.

### 2. &nbsp; Code implementation

After understanding the above information, we can "fill in the blanks" in the framework code. To shorten the overall code, we do not implement individual functions within the framework code separately, but expand them in the `backtrack()` function:

=== "Python"

    ```python title="permutations_i.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """回溯算法：全排列 I"""
        # 当状态长度等于元素数量时，记录解
        if len(state) == len(choices):
            res.append(list(state))
            return
        # 遍历所有选择
        for i, choice in enumerate(choices):
            # 剪枝：不允许重复选择元素
            if not selected[i]:
                # 尝试：做出选择，更新状态
                selected[i] = True
                state.append(choice)
                # 进行下一轮选择
                backtrack(state, choices, selected, res)
                # 回退：撤销选择，恢复到之前的状态
                selected[i] = False
                state.pop()

    def permutations_i(nums: list[int]) -> list[list[int]]:
        """全排列 I"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_i.cpp"
    /* 回溯算法：全排列 I */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // 当状态长度等于元素数量时，记录解
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.push_back(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* 全排列 I */
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
    /* 回溯算法：全排列 I */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.add(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 全排列 I */
    List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_i.cs"
    /* 回溯算法：全排列 I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.Add(choice);
                // 进行下一轮选择
                Backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* 全排列 I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_i.go"
    /* 回溯算法：全排列 I */
    func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // 当状态长度等于元素数量时，记录解
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // 遍历所有选择
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // 剪枝：不允许重复选择元素
            if !(*selected)[i] {
                // 尝试：做出选择，更新状态
                (*selected)[i] = true
                *state = append(*state, choice)
                // 进行下一轮选择
                backtrackI(state, choices, selected, res)
                // 回退：撤销选择，恢复到之前的状态
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* 全排列 I */
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
    /* 回溯算法：全排列 I */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // 当状态长度等于元素数量时，记录解
        if state.count == choices.count {
            res.append(state)
            return
        }
        // 遍历所有选择
        for (i, choice) in choices.enumerated() {
            // 剪枝：不允许重复选择元素
            if !selected[i] {
                // 尝试：做出选择，更新状态
                selected[i] = true
                state.append(choice)
                // 进行下一轮选择
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* 全排列 I */
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
    /* 回溯算法：全排列 I */
    function backtrack(state, choices, selected, res) {
        // 当状态长度等于元素数量时，记录解
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        choices.forEach((choice, i) => {
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* 全排列 I */
    function permutationsI(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_i.ts"
    /* 回溯算法：全排列 I */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // 当状态长度等于元素数量时，记录解
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        choices.forEach((choice, i) => {
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* 全排列 I */
    function permutationsI(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_i.dart"
    /* 回溯算法：全排列 I */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // 当状态长度等于元素数量时，记录解
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // 遍历所有选择
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // 剪枝：不允许重复选择元素
        if (!selected[i]) {
          // 尝试：做出选择，更新状态
          selected[i] = true;
          state.add(choice);
          // 进行下一轮选择
          backtrack(state, choices, selected, res);
          // 回退：撤销选择，恢复到之前的状态
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* 全排列 I */
    List<List<int>> permutationsI(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_i.rs"
    /* 回溯算法：全排列 I */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // 当状态长度等于元素数量时，记录解
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // 遍历所有选择
        for i in 0..choices.len() {
            let choice = choices[i];
            // 剪枝：不允许重复选择元素
            if !selected[i] {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state.clone(), choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.remove(state.len() - 1);
            }
        }
    }

    /* 全排列 I */
    fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new(); // 状态（子集）
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_i.c"
    /* 回溯算法：全排列 I */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // 当状态长度等于元素数量时，记录解
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true;
                state[stateSize] = choice;
                // 进行下一轮选择
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
            }
        }
    }

    /* 全排列 I */
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
    /* 回溯算法：全排列 I */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // 当状态长度等于元素数量时，记录解
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // 遍历所有选择
        for (i in choices.indices) {
            val choice = choices[i]
            // 剪枝：不允许重复选择元素
            if (!selected[i]) {
                // 尝试：做出选择，更新状态
                selected[i] = true
                state.add(choice)
                // 进行下一轮选择
                backtrack(state, choices, selected, res)
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* 全排列 I */
    fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%85%A8%E6%8E%92%E5%88%97%20I%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%8A%B6%E6%80%81%E9%95%BF%E5%BA%A6%E7%AD%89%E4%BA%8E%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E5%85%A8%E6%8E%92%E5%88%97%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20*%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E6%8E%92%E5%88%97%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%85%A8%E6%8E%92%E5%88%97%20I%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%8A%B6%E6%80%81%E9%95%BF%E5%BA%A6%E7%AD%89%E4%BA%8E%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_i%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E5%85%A8%E6%8E%92%E5%88%97%20I%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20*%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%203%5D%0A%0A%20%20%20%20res%20%3D%20permutations_i%28nums%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E6%8E%92%E5%88%97%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 13.2.2 &nbsp; Considering cases with equal elements

!!! question

    Enter an integer array, **which may contain duplicate elements**, and return all unique permutations.

Suppose the input array is $[1, 1, 2]$. To differentiate the two duplicate elements $1$, we mark the second $1$ as $\hat{1}$.

As shown in Figure 13-7, half of the permutations generated by the above method are duplicates.

![Duplicate permutations](permutations_problem.assets/permutations_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-7 &nbsp; Duplicate permutations </p>

So, how do we eliminate duplicate permutations? Most directly, consider using a hash set to deduplicate permutation results. However, this is not elegant, **as branches generating duplicate permutations are unnecessary and should be identified and pruned in advance**, which can further improve algorithm efficiency.

### 1. &nbsp; Pruning of equal elements

Observing Figure 13-8, in the first round, choosing $1$ or $\hat{1}$ results in identical permutations under both choices, thus we should prune $\hat{1}$.

Similarly, after choosing $2$ in the first round, choosing $1$ and $\hat{1}$ in the second round also produces duplicate branches, so we should also prune $\hat{1}$ in the second round.

Essentially, **our goal is to ensure that multiple equal elements are only selected once in each round of choices**.

![Duplicate permutations pruning](permutations_problem.assets/permutations_ii_pruning.png){ class="animation-figure" }

<p align="center"> Figure 13-8 &nbsp; Duplicate permutations pruning </p>

### 2. &nbsp; Code implementation

Based on the code from the previous problem, we consider initiating a hash set `duplicated` in each round of choices, used to record elements that have been tried in that round, and prune duplicate elements:

=== "Python"

    ```python title="permutations_ii.py"
    def backtrack(
        state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
    ):
        """回溯算法：全排列 II"""
        # 当状态长度等于元素数量时，记录解
        if len(state) == len(choices):
            res.append(list(state))
            return
        # 遍历所有选择
        duplicated = set[int]()
        for i, choice in enumerate(choices):
            # 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if not selected[i] and choice not in duplicated:
                # 尝试：做出选择，更新状态
                duplicated.add(choice)  # 记录选择过的元素值
                selected[i] = True
                state.append(choice)
                # 进行下一轮选择
                backtrack(state, choices, selected, res)
                # 回退：撤销选择，恢复到之前的状态
                selected[i] = False
                state.pop()

    def permutations_ii(nums: list[int]) -> list[list[int]]:
        """全排列 II"""
        res = []
        backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
        return res
    ```

=== "C++"

    ```cpp title="permutations_ii.cpp"
    /* 回溯算法：全排列 II */
    void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
        // 当状态长度等于元素数量时，记录解
        if (state.size() == choices.size()) {
            res.push_back(state);
            return;
        }
        // 遍历所有选择
        unordered_set<int> duplicated;
        for (int i = 0; i < choices.size(); i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
                // 尝试：做出选择，更新状态
                duplicated.emplace(choice); // 记录选择过的元素值
                selected[i] = true;
                state.push_back(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop_back();
            }
        }
    }

    /* 全排列 II */
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
    /* 回溯算法：全排列 II */
    void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // 遍历所有选择
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.contains(choice)) {
                // 尝试：做出选择，更新状态
                duplicated.add(choice); // 记录选择过的元素值
                selected[i] = true;
                state.add(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* 全排列 II */
    List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="permutations_ii.cs"
    /* 回溯算法：全排列 II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.Contains(choice)) {
                // 尝试：做出选择，更新状态
                duplicated.Add(choice); // 记录选择过的元素值
                selected[i] = true;
                state.Add(choice);
                // 进行下一轮选择
                Backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* 全排列 II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }
    ```

=== "Go"

    ```go title="permutations_ii.go"
    /* 回溯算法：全排列 II */
    func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
        // 当状态长度等于元素数量时，记录解
        if len(*state) == len(*choices) {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
        }
        // 遍历所有选择
        duplicated := make(map[int]struct{}, 0)
        for i := 0; i < len(*choices); i++ {
            choice := (*choices)[i]
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
                // 尝试：做出选择，更新状态
                // 记录选择过的元素值
                duplicated[choice] = struct{}{}
                (*selected)[i] = true
                *state = append(*state, choice)
                // 进行下一轮选择
                backtrackII(state, choices, selected, res)
                // 回退：撤销选择，恢复到之前的状态
                (*selected)[i] = false
                *state = (*state)[:len(*state)-1]
            }
        }
    }

    /* 全排列 II */
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
    /* 回溯算法：全排列 II */
    func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
        // 当状态长度等于元素数量时，记录解
        if state.count == choices.count {
            res.append(state)
            return
        }
        // 遍历所有选择
        var duplicated: Set<Int> = []
        for (i, choice) in choices.enumerated() {
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if !selected[i], !duplicated.contains(choice) {
                // 尝试：做出选择，更新状态
                duplicated.insert(choice) // 记录选择过的元素值
                selected[i] = true
                state.append(choice)
                // 进行下一轮选择
                backtrack(state: &state, choices: choices, selected: &selected, res: &res)
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false
                state.removeLast()
            }
        }
    }

    /* 全排列 II */
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
    /* 回溯算法：全排列 II */
    function backtrack(state, choices, selected, res) {
        // 当状态长度等于元素数量时，记录解
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.has(choice)) {
                // 尝试：做出选择，更新状态
                duplicated.add(choice); // 记录选择过的元素值
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* 全排列 II */
    function permutationsII(nums) {
        const res = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="permutations_ii.ts"
    /* 回溯算法：全排列 II */
    function backtrack(
        state: number[],
        choices: number[],
        selected: boolean[],
        res: number[][]
    ): void {
        // 当状态长度等于元素数量时，记录解
        if (state.length === choices.length) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        const duplicated = new Set();
        choices.forEach((choice, i) => {
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.has(choice)) {
                // 尝试：做出选择，更新状态
                duplicated.add(choice); // 记录选择过的元素值
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state, choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.pop();
            }
        });
    }

    /* 全排列 II */
    function permutationsII(nums: number[]): number[][] {
        const res: number[][] = [];
        backtrack([], nums, Array(nums.length).fill(false), res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="permutations_ii.dart"
    /* 回溯算法：全排列 II */
    void backtrack(
      List<int> state,
      List<int> choices,
      List<bool> selected,
      List<List<int>> res,
    ) {
      // 当状态长度等于元素数量时，记录解
      if (state.length == choices.length) {
        res.add(List.from(state));
        return;
      }
      // 遍历所有选择
      Set<int> duplicated = {};
      for (int i = 0; i < choices.length; i++) {
        int choice = choices[i];
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        if (!selected[i] && !duplicated.contains(choice)) {
          // 尝试：做出选择，更新状态
          duplicated.add(choice); // 记录选择过的元素值
          selected[i] = true;
          state.add(choice);
          // 进行下一轮选择
          backtrack(state, choices, selected, res);
          // 回退：撤销选择，恢复到之前的状态
          selected[i] = false;
          state.removeLast();
        }
      }
    }

    /* 全排列 II */
    List<List<int>> permutationsII(List<int> nums) {
      List<List<int>> res = [];
      backtrack([], nums, List.filled(nums.length, false), res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="permutations_ii.rs"
    /* 回溯算法：全排列 II */
    fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
        // 当状态长度等于元素数量时，记录解
        if state.len() == choices.len() {
            res.push(state);
            return;
        }
        // 遍历所有选择
        let mut duplicated = HashSet::<i32>::new();
        for i in 0..choices.len() {
            let choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if !selected[i] && !duplicated.contains(&choice) {
                // 尝试：做出选择，更新状态
                duplicated.insert(choice); // 记录选择过的元素值
                selected[i] = true;
                state.push(choice);
                // 进行下一轮选择
                backtrack(state.clone(), choices, selected, res);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
                state.remove(state.len() - 1);
            }
        }
    }

    /* 全排列 II */
    fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
        let mut res = Vec::new();
        backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
        res
    }
    ```

=== "C"

    ```c title="permutations_ii.c"
    /* 回溯算法：全排列 II */
    void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
        // 当状态长度等于元素数量时，记录解
        if (stateSize == choicesSize) {
            res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
            for (int i = 0; i < choicesSize; i++) {
                res[*resSize][i] = state[i];
            }
            (*resSize)++;
            return;
        }
        // 遍历所有选择
        bool duplicated[MAX_SIZE] = {false};
        for (int i = 0; i < choicesSize; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated[choice]) {
                // 尝试：做出选择，更新状态
                duplicated[choice] = true; // 记录选择过的元素值
                selected[i] = true;
                state[stateSize] = choice;
                // 进行下一轮选择
                backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false;
            }
        }
    }

    /* 全排列 II */
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
    /* 回溯算法：全排列 II */
    fun backtrack(
        state: MutableList<Int>,
        choices: IntArray,
        selected: BooleanArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // 当状态长度等于元素数量时，记录解
        if (state.size == choices.size) {
            res.add(state.toMutableList())
            return
        }
        // 遍历所有选择
        val duplicated = HashSet<Int>()
        for (i in choices.indices) {
            val choice = choices[i]
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i] && !duplicated.contains(choice)) {
                // 尝试：做出选择，更新状态
                duplicated.add(choice) // 记录选择过的元素值
                selected[i] = true
                state.add(choice)
                // 进行下一轮选择
                backtrack(state, choices, selected, res)
                // 回退：撤销选择，恢复到之前的状态
                selected[i] = false
                state.removeAt(state.size - 1)
            }
        }
    }

    /* 全排列 II */
    fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
        val res = mutableListOf<MutableList<Int>?>()
        backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%85%A8%E6%8E%92%E5%88%97%20II%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%8A%B6%E6%80%81%E9%95%BF%E5%BA%A6%E7%AD%89%E4%BA%8E%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%85%83%E7%B4%A0%20%E4%B8%94%20%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E7%9B%B8%E7%AD%89%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%E8%AE%B0%E5%BD%95%E9%80%89%E6%8B%A9%E8%BF%87%E7%9A%84%E5%85%83%E7%B4%A0%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E5%85%A8%E6%8E%92%E5%88%97%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20*%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E6%8E%92%E5%88%97%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20choices%3A%20list%5Bint%5D,%20selected%3A%20list%5Bbool%5D,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%85%A8%E6%8E%92%E5%88%97%20II%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%8A%B6%E6%80%81%E9%95%BF%E5%BA%A6%E7%AD%89%E4%BA%8E%E5%85%83%E7%B4%A0%E6%95%B0%E9%87%8F%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20len%28state%29%20%3D%3D%20len%28choices%29%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20duplicated%20%3D%20set%5Bint%5D%28%29%0A%20%20%20%20for%20i,%20choice%20in%20enumerate%28choices%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%85%83%E7%B4%A0%20%E4%B8%94%20%E4%B8%8D%E5%85%81%E8%AE%B8%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E7%9B%B8%E7%AD%89%E5%85%83%E7%B4%A0%0A%20%20%20%20%20%20%20%20if%20not%20selected%5Bi%5D%20and%20choice%20not%20in%20duplicated%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20duplicated.add%28choice%29%20%20%23%20%E8%AE%B0%E5%BD%95%E9%80%89%E6%8B%A9%E8%BF%87%E7%9A%84%E5%85%83%E7%B4%A0%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20state.append%28choice%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28state,%20choices,%20selected,%20res%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20%20%20%20%20selected%5Bi%5D%20%3D%20False%0A%20%20%20%20%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20permutations_ii%28nums%3A%20list%5Bint%5D%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E5%85%A8%E6%8E%92%E5%88%97%20II%22%22%22%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%28state%3D%5B%5D,%20choices%3Dnums,%20selected%3D%5BFalse%5D%20*%20len%28nums%29,%20res%3Dres%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%202,%202%5D%0A%0A%20%20%20%20res%20%3D%20permutations_ii%28nums%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E6%8E%92%E5%88%97%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=13&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Assuming all elements are distinct from each other, there are $n!$ (factorial) permutations of $n$ elements; when recording results, it is necessary to copy a list of length $n$, using $O(n)$ time. **Thus, the time complexity is $O(n!n)$**.

The maximum recursion depth is $n$, using $O(n)$ frame space. `Selected` uses $O(n)$ space. At any one time, there can be up to $n$ `duplicated`, using $O(n^2)$ space. **Therefore, the space complexity is $O(n^2)$**.

### 3. &nbsp; Comparison of the two pruning methods

Please note, although both `selected` and `duplicated` are used for pruning, their targets are different.

- **Repeated choice pruning**: There is only one `selected` throughout the search process. It records which elements are currently in the state, aiming to prevent an element from appearing repeatedly in `state`.
- **Equal element pruning**: Each round of choices (each call to the `backtrack` function) contains a `duplicated`. It records which elements have been chosen in the current traversal (`for` loop), aiming to ensure equal elements are selected only once.

Figure 13-9 shows the scope of the two pruning conditions. Note, each node in the tree represents a choice, and the nodes from the root to the leaf form a permutation.

![Scope of the two pruning conditions](permutations_problem.assets/permutations_ii_pruning_summary.png){ class="animation-figure" }

<p align="center"> Figure 13-9 &nbsp; Scope of the two pruning conditions </p>
