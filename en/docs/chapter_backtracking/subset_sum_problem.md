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
        """回溯算法：子集和 I"""
        # 子集和等于 target 时，记录解
        if total == target:
            res.append(list(state))
            return
        # 遍历所有选择
        for i in range(len(choices)):
            # 剪枝：若子集和超过 target ，则跳过该选择
            if total + choices[i] > target:
                continue
            # 尝试：做出选择，更新元素和 total
            state.append(choices[i])
            # 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res)
            # 回退：撤销选择，恢复到之前的状态
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 I（包含重复子集）"""
        state = []  # 状态（子集）
        total = 0  # 子集和
        res = []  # 结果列表（子集列表）
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* 回溯算法：子集和 I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            res.push_back(state);
            return;
        }
        // 遍历所有选择
        for (size_t i = 0; i < choices.size(); i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.push_back(choices[i]);
            // 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop_back();
        }
    }

    /* 求解子集和 I（包含重复子集） */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // 状态（子集）
        int total = 0;           // 子集和
        vector<vector<int>> res; // 结果列表（子集列表）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* 回溯算法：子集和 I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.add(choices[i]);
            // 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I（包含重复子集） */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状态（子集）
        int total = 0; // 子集和
        List<List<Integer>> res = new ArrayList<>(); // 结果列表（子集列表）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    /* 回溯算法：子集和 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.Length; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.Add(choices[i]);
            // 进行下一轮选择
            Backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I（包含重复子集） */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 状态（子集）
        int total = 0; // 子集和
        List<List<int>> res = []; // 结果列表（子集列表）
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* 回溯算法：子集和 I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // 子集和等于 target 时，记录解
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 遍历所有选择
        for i := 0; i < len(*choices); i++ {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if total+(*choices)[i] > target {
                continue
            }
            // 尝试：做出选择，更新元素和 total
            *state = append(*state, (*choices)[i])
            // 进行下一轮选择
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // 回退：撤销选择，恢复到之前的状态
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 I（包含重复子集） */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // 状态（子集）
        total := 0              // 子集和
        res := make([][]int, 0) // 结果列表（子集列表）
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* 回溯算法：子集和 I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // 子集和等于 target 时，记录解
        if total == target {
            res.append(state)
            return
        }
        // 遍历所有选择
        for i in choices.indices {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if total + choices[i] > target {
                continue
            }
            // 尝试：做出选择，更新元素和 total
            state.append(choices[i])
            // 进行下一轮选择
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeLast()
        }
    }

    /* 求解子集和 I（包含重复子集） */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 状态（子集）
        let total = 0 // 子集和
        var res: [[Int]] = [] // 结果列表（子集列表）
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* 回溯算法：子集和 I */
    function backtrack(state, target, total, choices, res) {
        // 子集和等于 target 时，记录解
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        for (let i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I（包含重复子集） */
    function subsetSumINaive(nums, target) {
        const state = []; // 状态（子集）
        const total = 0; // 子集和
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* 回溯算法：子集和 I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // 子集和等于 target 时，记录解
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        for (let i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I（包含重复子集） */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // 状态（子集）
        const total = 0; // 子集和
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* 回溯算法：子集和 I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // 子集和等于 target 时，记录解
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // 遍历所有选择
      for (int i = 0; i < choices.length; i++) {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if (total + choices[i] > target) {
          continue;
        }
        // 尝试：做出选择，更新元素和 total
        state.add(choices[i]);
        // 进行下一轮选择
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤销选择，恢复到之前的状态
        state.removeLast();
      }
    }

    /* 求解子集和 I（包含重复子集） */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // 状态（子集）
      int total = 0; // 元素和
      List<List<int>> res = []; // 结果列表（子集列表）
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* 回溯算法：子集和 I */
    fn backtrack(
        mut state: Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等于 target 时，记录解
        if total == target {
            res.push(state);
            return;
        }
        // 遍历所有选择
        for i in 0..choices.len() {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if total + choices[i] > target {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state.clone(), target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I（包含重复子集） */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let state = Vec::new(); // 状态（子集）
        let total = 0; // 子集和
        let mut res = Vec::new(); // 结果列表（子集列表）
        backtrack(state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* 回溯算法：子集和 I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choicesSize; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state[stateSize++] = choices[i];
            // 进行下一轮选择
            backtrack(target, total + choices[i], choices, choicesSize);
            // 回退：撤销选择，恢复到之前的状态
            stateSize--;
        }
    }

    /* 求解子集和 I（包含重复子集） */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // 初始化解的数量为0
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* 回溯算法：子集和 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // 遍历所有选择
        for (i in choices.indices) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue
            }
            // 尝试：做出选择，更新元素和 total
            state.add(choices[i])
            // 进行下一轮选择
            backtrack(state, target, total + choices[i], choices, res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 I（包含重复子集） */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 状态（子集）
        val total = 0 // 子集和
        val res = mutableListOf<MutableList<Int>?>() // 结果列表（子集列表）
        backtrack(state, target, total, nums, res)
        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E8%B7%B3%E8%BF%87%E8%AF%A5%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%E5%92%8C%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%EF%BC%88%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%EF%BC%89%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20total%20%3D%200%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E8%AF%B7%E6%B3%A8%E6%84%8F%EF%BC%8C%E8%AF%A5%E6%96%B9%E6%B3%95%E8%BE%93%E5%87%BA%E7%9A%84%E7%BB%93%E6%9E%9C%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E9%9B%86%E5%90%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%0A%20%20%20%20target%3A%20int,%0A%20%20%20%20total%3A%20int,%0A%20%20%20%20choices%3A%20list%5Bint%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E8%B7%B3%E8%BF%87%E8%AF%A5%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%E5%92%8C%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target,%20total%20%2B%20choices%5Bi%5D,%20choices,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%EF%BC%88%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%EF%BC%89%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20total%20%3D%200%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20total,%20nums,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E8%AF%B7%E6%B3%A8%E6%84%8F%EF%BC%8C%E8%AF%A5%E6%96%B9%E6%B3%95%E8%BE%93%E5%87%BA%E7%9A%84%E7%BB%93%E6%9E%9C%E5%8C%85%E5%90%AB%E9%87%8D%E5%A4%8D%E9%9B%86%E5%90%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

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
        """回溯算法：子集和 I"""
        # 子集和等于 target 时，记录解
        if target == 0:
            res.append(list(state))
            return
        # 遍历所有选择
        # 剪枝二：从 start 开始遍历，避免生成重复子集
        for i in range(start, len(choices)):
            # 剪枝一：若子集和超过 target ，则直接结束循环
            # 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0:
                break
            # 尝试：做出选择，更新 target, start
            state.append(choices[i])
            # 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res)
            # 回退：撤销选择，恢复到之前的状态
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 I"""
        state = []  # 状态（子集）
        nums.sort()  # 对 nums 进行排序
        start = 0  # 遍历起始点
        res = []  # 结果列表（子集列表）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* 回溯算法：子集和 I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (int i = start; i < choices.size(); i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.push_back(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop_back();
        }
    }

    /* 求解子集和 I */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // 状态（子集）
        sort(nums.begin(), nums.end()); // 对 nums 进行排序
        int start = 0;                  // 遍历起始点
        vector<vector<int>> res;        // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* 回溯算法：子集和 I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (int i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.add(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状态（子集）
        Arrays.sort(nums); // 对 nums 进行排序
        int start = 0; // 遍历起始点
        List<List<Integer>> res = new ArrayList<>(); // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    /* 回溯算法：子集和 I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (int i = start; i < choices.Length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.Add(choices[i]);
            // 进行下一轮选择
            Backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // 状态（子集）
        Array.Sort(nums); // 对 nums 进行排序
        int start = 0; // 遍历起始点
        List<List<int>> res = []; // 结果列表（子集列表）
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* 回溯算法：子集和 I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for i := start; i < len(*choices); i++ {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target-(*choices)[i] < 0 {
                break
            }
            // 尝试：做出选择，更新 target, start
            *state = append(*state, (*choices)[i])
            // 进行下一轮选择
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // 回退：撤销选择，恢复到之前的状态
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 I */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // 状态（子集）
        sort.Ints(nums)         // 对 nums 进行排序
        start := 0              // 遍历起始点
        res := make([][]int, 0) // 结果列表（子集列表）
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* 回溯算法：子集和 I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            res.append(state)
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for i in choices.indices.dropFirst(start) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0 {
                break
            }
            // 尝试：做出选择，更新 target, start
            state.append(choices[i])
            // 进行下一轮选择
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeLast()
        }
    }

    /* 求解子集和 I */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 状态（子集）
        let nums = nums.sorted() // 对 nums 进行排序
        let start = 0 // 遍历起始点
        var res: [[Int]] = [] // 结果列表（子集列表）
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* 回溯算法：子集和 I */
    function backtrack(state, target, choices, start, res) {
        // 子集和等于 target 时，记录解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I */
    function subsetSumI(nums, target) {
        const state = []; // 状态（子集）
        nums.sort((a, b) => a - b); // 对 nums 进行排序
        const start = 0; // 遍历起始点
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* 回溯算法：子集和 I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 子集和等于 target 时，记录解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // 状态（子集）
        nums.sort((a, b) => a - b); // 对 nums 进行排序
        const start = 0; // 遍历起始点
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* 回溯算法：子集和 I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 子集和等于 target 时，记录解
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 遍历所有选择
      // 剪枝二：从 start 开始遍历，避免生成重复子集
      for (int i = start; i < choices.length; i++) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if (target - choices[i] < 0) {
          break;
        }
        // 尝试：做出选择，更新 target, start
        state.add(choices[i]);
        // 进行下一轮选择
        backtrack(state, target - choices[i], choices, i, res);
        // 回退：撤销选择，恢复到之前的状态
        state.removeLast();
      }
    }

    /* 求解子集和 I */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // 状态（子集）
      nums.sort(); // 对 nums 进行排序
      int start = 0; // 遍历起始点
      List<List<int>> res = []; // 结果列表（子集列表）
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* 回溯算法：子集和 I */
    fn backtrack(
        mut state: Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            res.push(state);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for i in start..choices.len() {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0 {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state.clone(), target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 I */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let state = Vec::new(); // 状态（子集）
        nums.sort(); // 对 nums 进行排序
        let start = 0; // 遍历起始点
        let mut res = Vec::new(); // 结果列表（子集列表）
        backtrack(state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* 回溯算法：子集和 I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (int i = start; i < choicesSize; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 尝试：做出选择，更新 target, start
            state[stateSize] = choices[i];
            stateSize++;
            // 进行下一轮选择
            backtrack(target - choices[i], choices, choicesSize, i);
            // 回退：撤销选择，恢复到之前的状态
            stateSize--;
        }
    }

    /* 求解子集和 I */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // 对 nums 进行排序
        int start = 0;                           // 遍历起始点
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* 回溯算法：子集和 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        for (i in start..<choices.size) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break
            }
            // 尝试：做出选择，更新 target, start
            state.add(choices[i])
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i, res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 I */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 状态（子集）
        nums.sort() // 对 nums 进行排序
        val start = 0 // 遍历起始点
        val res = mutableListOf<MutableList<Int>?>() // 结果列表（子集列表）
        backtrack(state, target, nums, start, res)
        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E7%BB%93%E6%9D%9F%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%99%E6%98%AF%E5%9B%A0%E4%B8%BA%E6%95%B0%E7%BB%84%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%90%8E%E8%BE%B9%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E8%BF%87%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%20target,%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%AF%B9%20nums%20%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E9%81%8D%E5%8E%86%E8%B5%B7%E5%A7%8B%E7%82%B9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E7%BB%93%E6%9D%9F%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%99%E6%98%AF%E5%9B%A0%E4%B8%BA%E6%95%B0%E7%BB%84%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%90%8E%E8%BE%B9%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E8%BF%87%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%20target,%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%AF%B9%20nums%20%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E9%81%8D%E5%8E%86%E8%B5%B7%E5%A7%8B%E7%82%B9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

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
        """回溯算法：子集和 II"""
        # 子集和等于 target 时，记录解
        if target == 0:
            res.append(list(state))
            return
        # 遍历所有选择
        # 剪枝二：从 start 开始遍历，避免生成重复子集
        # 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for i in range(start, len(choices)):
            # 剪枝一：若子集和超过 target ，则直接结束循环
            # 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0:
                break
            # 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if i > start and choices[i] == choices[i - 1]:
                continue
            # 尝试：做出选择，更新 target, start
            state.append(choices[i])
            # 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res)
            # 回退：撤销选择，恢复到之前的状态
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 II"""
        state = []  # 状态（子集）
        nums.sort()  # 对 nums 进行排序
        start = 0  # 遍历起始点
        res = []  # 结果列表（子集列表）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* 回溯算法：子集和 II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (int i = start; i < choices.size(); i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.push_back(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop_back();
        }
    }

    /* 求解子集和 II */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // 状态（子集）
        sort(nums.begin(), nums.end()); // 对 nums 进行排序
        int start = 0;                  // 遍历起始点
        vector<vector<int>> res;        // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* 回溯算法：子集和 II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (int i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.add(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤销选择，恢复到之前的状态
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 II */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 状态（子集）
        Arrays.sort(nums); // 对 nums 进行排序
        int start = 0; // 遍历起始点
        List<List<Integer>> res = new ArrayList<>(); // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    /* 回溯算法：子集和 II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (int i = start; i < choices.Length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.Add(choices[i]);
            // 进行下一轮选择
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤销选择，恢复到之前的状态
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // 状态（子集）
        Array.Sort(nums); // 对 nums 进行排序
        int start = 0; // 遍历起始点
        List<List<int>> res = []; // 结果列表（子集列表）
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* 回溯算法：子集和 II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for i := start; i < len(*choices); i++ {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target-(*choices)[i] < 0 {
                break
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // 尝试：做出选择，更新 target, start
            *state = append(*state, (*choices)[i])
            // 进行下一轮选择
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // 回退：撤销选择，恢复到之前的状态
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 II */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // 状态（子集）
        sort.Ints(nums)         // 对 nums 进行排序
        start := 0              // 遍历起始点
        res := make([][]int, 0) // 结果列表（子集列表）
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* 回溯算法：子集和 II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            res.append(state)
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for i in choices.indices.dropFirst(start) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0 {
                break
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // 尝试：做出选择，更新 target, start
            state.append(choices[i])
            // 进行下一轮选择
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeLast()
        }
    }

    /* 求解子集和 II */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 状态（子集）
        let nums = nums.sorted() // 对 nums 进行排序
        let start = 0 // 遍历起始点
        var res: [[Int]] = [] // 结果列表（子集列表）
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* 回溯算法：子集和 II */
    function backtrack(state, target, choices, start, res) {
        // 子集和等于 target 时，记录解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 II */
    function subsetSumII(nums, target) {
        const state = []; // 状态（子集）
        nums.sort((a, b) => a - b); // 对 nums 进行排序
        const start = 0; // 遍历起始点
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* 回溯算法：子集和 II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 子集和等于 target 时，记录解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 II */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // 状态（子集）
        nums.sort((a, b) => a - b); // 对 nums 进行排序
        const start = 0; // 遍历起始点
        const res = []; // 结果列表（子集列表）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* 回溯算法：子集和 II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 子集和等于 target 时，记录解
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 遍历所有选择
      // 剪枝二：从 start 开始遍历，避免生成重复子集
      // 剪枝三：从 start 开始遍历，避免重复选择同一元素
      for (int i = start; i < choices.length; i++) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if (target - choices[i] < 0) {
          break;
        }
        // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // 尝试：做出选择，更新 target, start
        state.add(choices[i]);
        // 进行下一轮选择
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 回退：撤销选择，恢复到之前的状态
        state.removeLast();
      }
    }

    /* 求解子集和 II */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // 状态（子集）
      nums.sort(); // 对 nums 进行排序
      int start = 0; // 遍历起始点
      List<List<int>> res = []; // 结果列表（子集列表）
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* 回溯算法：子集和 II */
    fn backtrack(
        mut state: Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等于 target 时，记录解
        if target == 0 {
            res.push(state);
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for i in start..choices.len() {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if target - choices[i] < 0 {
                break;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state.push(choices[i]);
            // 进行下一轮选择
            backtrack(state.clone(), target - choices[i], choices, i, res);
            // 回退：撤销选择，恢复到之前的状态
            state.pop();
        }
    }

    /* 求解子集和 II */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let state = Vec::new(); // 状态（子集）
        nums.sort(); // 对 nums 进行排序
        let start = 0; // 遍历起始点
        let mut res = Vec::new(); // 结果列表（子集列表）
        backtrack(state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* 回溯算法：子集和 II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (int i = start; i < choicesSize; i++) {
            // 剪枝一：若子集和超过 target ，则直接跳过
            if (target - choices[i] < 0) {
                continue;
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 尝试：做出选择，更新 target, start
            state[stateSize] = choices[i];
            stateSize++;
            // 进行下一轮选择
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // 回退：撤销选择，恢复到之前的状态
            stateSize--;
        }
    }

    /* 求解子集和 II */
    void subsetSumII(int *nums, int numsSize, int target) {
        // 对 nums 进行排序
        qsort(nums, numsSize, sizeof(int), cmp);
        // 开始回溯
        backtrack(target, nums, numsSize, 0);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    /* 回溯算法：子集和 II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等于 target 时，记录解
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 遍历所有选择
        // 剪枝二：从 start 开始遍历，避免生成重复子集
        // 剪枝三：从 start 开始遍历，避免重复选择同一元素
        for (i in start..<choices.size) {
            // 剪枝一：若子集和超过 target ，则直接结束循环
            // 这是因为数组已排序，后边元素更大，子集和一定超过 target
            if (target - choices[i] < 0) {
                break
            }
            // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // 尝试：做出选择，更新 target, start
            state.add(choices[i])
            // 进行下一轮选择
            backtrack(state, target - choices[i], choices, i + 1, res)
            // 回退：撤销选择，恢复到之前的状态
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 II */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 状态（子集）
        nums.sort() // 对 nums 进行排序
        val start = 0 // 遍历起始点
        val res = mutableListOf<MutableList<Int>?>() // 结果列表（子集列表）
        backtrack(state, target, nums, start, res)
        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%89%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%90%8C%E4%B8%80%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E7%BB%93%E6%9D%9F%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%99%E6%98%AF%E5%9B%A0%E4%B8%BA%E6%95%B0%E7%BB%84%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%90%8E%E8%BE%B9%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E8%BF%87%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E5%9B%9B%EF%BC%9A%E5%A6%82%E6%9E%9C%E8%AF%A5%E5%85%83%E7%B4%A0%E4%B8%8E%E5%B7%A6%E8%BE%B9%E5%85%83%E7%B4%A0%E7%9B%B8%E7%AD%89%EF%BC%8C%E8%AF%B4%E6%98%8E%E8%AF%A5%E6%90%9C%E7%B4%A2%E5%88%86%E6%94%AF%E9%87%8D%E5%A4%8D%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E8%BF%87%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%20target,%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%AF%B9%20nums%20%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E9%81%8D%E5%8E%86%E8%B5%B7%E5%A7%8B%E7%82%B9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D,%20target%3A%20int,%20choices%3A%20list%5Bint%5D,%20start%3A%20int,%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E4%BA%8E%20target%20%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E5%A4%8D%E5%AD%90%E9%9B%86%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%89%EF%BC%9A%E4%BB%8E%20start%20%E5%BC%80%E5%A7%8B%E9%81%8D%E5%8E%86%EF%BC%8C%E9%81%BF%E5%85%8D%E9%87%8D%E5%A4%8D%E9%80%89%E6%8B%A9%E5%90%8C%E4%B8%80%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i%20in%20range%28start,%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E8%BF%87%20target%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E7%BB%93%E6%9D%9F%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%99%E6%98%AF%E5%9B%A0%E4%B8%BA%E6%95%B0%E7%BB%84%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%90%8E%E8%BE%B9%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E8%BF%87%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E5%9B%9B%EF%BC%9A%E5%A6%82%E6%9E%9C%E8%AF%A5%E5%85%83%E7%B4%A0%E4%B8%8E%E5%B7%A6%E8%BE%B9%E5%85%83%E7%B4%A0%E7%9B%B8%E7%AD%89%EF%BC%8C%E8%AF%B4%E6%98%8E%E8%AF%A5%E6%90%9C%E7%B4%A2%E5%88%86%E6%94%AF%E9%87%8D%E5%A4%8D%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E8%BF%87%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%20target,%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%9B%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BD%AE%E9%80%89%E6%8B%A9%0A%20%20%20%20%20%20%20%20backtrack%28state,%20target%20-%20choices%5Bi%5D,%20choices,%20i%20%2B%201,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%94%80%E9%80%89%E6%8B%A9%EF%BC%8C%E6%81%A2%E5%A4%8D%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8A%B6%E6%80%81%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%AF%B9%20nums%20%E8%BF%9B%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E9%81%8D%E5%8E%86%E8%B5%B7%E5%A7%8B%E7%82%B9%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%BB%93%E6%9E%9C%E5%88%97%E8%A1%A8%EF%BC%88%E5%AD%90%E9%9B%86%E5%88%97%E8%A1%A8%EF%BC%89%0A%20%20%20%20backtrack%28state,%20target,%20nums,%20start,%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%204,%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums,%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%95%B0%E7%BB%84%20nums%20%3D%20%7Bnums%7D,%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E4%BA%8E%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Figure 13-14 shows the backtracking process for the array $[4, 4, 5]$ and target element $9$, including four types of pruning operations. Please combine the illustration with the code comments to understand the entire search process and how each type of pruning operation works.

![Subset sum II backtracking process](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> Figure 13-14 &nbsp; Subset sum II backtracking process </p>
