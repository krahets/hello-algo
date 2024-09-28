---
comments: true
---

# 13.3 &nbsp; 子集和問題

## 13.3.1 &nbsp; 無重複元素的情況

!!! question

    給定一個正整數陣列 `nums` 和一個目標正整數 `target` ，請找出所有可能的組合，使得組合中的元素和等於 `target` 。給定陣列無重複元素，每個元素可以被選取多次。請以串列形式返回這些組合，串列中不應包含重複組合。

例如，輸入集合 $\{3, 4, 5\}$ 和目標整數 $9$ ，解為 $\{3, 3, 3\}, \{4, 5\}$ 。需要注意以下兩點。

- 輸入集合中的元素可以被無限次重複選取。
- 子集不區分元素順序，比如 $\{4, 5\}$ 和 $\{5, 4\}$ 是同一個子集。

### 1. &nbsp; 參考全排列解法

類似於全排列問題，我們可以把子集的生成過程想象成一系列選擇的結果，並在選擇過程中實時更新“元素和”，當元素和等於 `target` 時，就將子集記錄至結果串列。

而與全排列問題不同的是，**本題集合中的元素可以被無限次選取**，因此無須藉助 `selected` 布林串列來記錄元素是否已被選擇。我們可以對全排列程式碼進行小幅修改，初步得到解題程式碼：

=== "Python"

    ```python title="subset_sum_i_naive.py"
    def backtrack(
        state: list[int],
        target: int,
        total: int,
        choices: list[int],
        res: list[list[int]],
    ):
        """回溯演算法：子集和 I"""
        # 子集和等於 target 時，記錄解
        if total == target:
            res.append(list(state))
            return
        # 走訪所有選擇
        for i in range(len(choices)):
            # 剪枝：若子集和超過 target ，則跳過該選擇
            if total + choices[i] > target:
                continue
            # 嘗試：做出選擇，更新元素和 total
            state.append(choices[i])
            # 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res)
            # 回退：撤銷選擇，恢復到之前的狀態
            state.pop()

    def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 I（包含重複子集）"""
        state = []  # 狀態（子集）
        total = 0  # 子集和
        res = []  # 結果串列（子集串列）
        backtrack(state, target, total, nums, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i_naive.cpp"
    /* 回溯演算法：子集和 I */
    void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.push_back(state);
            return;
        }
        // 走訪所有選擇
        for (size_t i = 0; i < choices.size(); i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.push_back(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop_back();
        }
    }

    /* 求解子集和 I（包含重複子集） */
    vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
        vector<int> state;       // 狀態（子集）
        int total = 0;           // 子集和
        vector<vector<int>> res; // 結果串列（子集串列）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i_naive.java"
    /* 回溯演算法：子集和 I */
    void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.add(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I（包含重複子集） */
    List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 狀態（子集）
        int total = 0; // 子集和
        List<List<Integer>> res = new ArrayList<>(); // 結果串列（子集串列）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i_naive.cs"
    /* 回溯演算法：子集和 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choices.Length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.Add(choices[i]);
            // 進行下一輪選擇
            Backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I（包含重複子集） */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 狀態（子集）
        int total = 0; // 子集和
        List<List<int>> res = []; // 結果串列（子集串列）
        Backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i_naive.go"
    /* 回溯演算法：子集和 I */
    func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
        // 子集和等於 target 時，記錄解
        if target == total {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 走訪所有選擇
        for i := 0; i < len(*choices); i++ {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if total+(*choices)[i] > target {
                continue
            }
            // 嘗試：做出選擇，更新元素和 total
            *state = append(*state, (*choices)[i])
            // 進行下一輪選擇
            backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 I（包含重複子集） */
    func subsetSumINaive(nums []int, target int) [][]int {
        state := make([]int, 0) // 狀態（子集）
        total := 0              // 子集和
        res := make([][]int, 0) // 結果串列（子集串列）
        backtrackSubsetSumINaive(total, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i_naive.swift"
    /* 回溯演算法：子集和 I */
    func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
        // 子集和等於 target 時，記錄解
        if total == target {
            res.append(state)
            return
        }
        // 走訪所有選擇
        for i in choices.indices {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if total + choices[i] > target {
                continue
            }
            // 嘗試：做出選擇，更新元素和 total
            state.append(choices[i])
            // 進行下一輪選擇
            backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeLast()
        }
    }

    /* 求解子集和 I（包含重複子集） */
    func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 狀態（子集）
        let total = 0 // 子集和
        var res: [[Int]] = [] // 結果串列（子集串列）
        backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i_naive.js"
    /* 回溯演算法：子集和 I */
    function backtrack(state, target, total, choices, res) {
        // 子集和等於 target 時，記錄解
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        for (let i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I（包含重複子集） */
    function subsetSumINaive(nums, target) {
        const state = []; // 狀態（子集）
        const total = 0; // 子集和
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i_naive.ts"
    /* 回溯演算法：子集和 I */
    function backtrack(
        state: number[],
        target: number,
        total: number,
        choices: number[],
        res: number[][]
    ): void {
        // 子集和等於 target 時，記錄解
        if (total === target) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        for (let i = 0; i < choices.length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I（包含重複子集） */
    function subsetSumINaive(nums: number[], target: number): number[][] {
        const state = []; // 狀態（子集）
        const total = 0; // 子集和
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, total, nums, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i_naive.dart"
    /* 回溯演算法：子集和 I */
    void backtrack(
      List<int> state,
      int target,
      int total,
      List<int> choices,
      List<List<int>> res,
    ) {
      // 子集和等於 target 時，記錄解
      if (total == target) {
        res.add(List.from(state));
        return;
      }
      // 走訪所有選擇
      for (int i = 0; i < choices.length; i++) {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if (total + choices[i] > target) {
          continue;
        }
        // 嘗試：做出選擇，更新元素和 total
        state.add(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeLast();
      }
    }

    /* 求解子集和 I（包含重複子集） */
    List<List<int>> subsetSumINaive(List<int> nums, int target) {
      List<int> state = []; // 狀態（子集）
      int total = 0; // 元素和
      List<List<int>> res = []; // 結果串列（子集串列）
      backtrack(state, target, total, nums, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i_naive.rs"
    /* 回溯演算法：子集和 I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        total: i32,
        choices: &[i32],
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等於 target 時，記錄解
        if total == target {
            res.push(state.clone());
            return;
        }
        // 走訪所有選擇
        for i in 0..choices.len() {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if total + choices[i] > target {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I（包含重複子集） */
    fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 狀態（子集）
        let total = 0; // 子集和
        let mut res = Vec::new(); // 結果串列（子集串列）
        backtrack(&mut state, target, total, nums, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i_naive.c"
    /* 回溯演算法：子集和 I */
    void backtrack(int target, int total, int *choices, int choicesSize) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choicesSize; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state[stateSize++] = choices[i];
            // 進行下一輪選擇
            backtrack(target, total + choices[i], choices, choicesSize);
            // 回退：撤銷選擇，恢復到之前的狀態
            stateSize--;
        }
    }

    /* 求解子集和 I（包含重複子集） */
    void subsetSumINaive(int *nums, int numsSize, int target) {
        resSize = 0; // 初始化解的數量為0
        backtrack(target, 0, nums, numsSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i_naive.kt"
    /* 回溯演算法：子集和 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        total: Int,
        choices: IntArray,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.add(state.toMutableList())
            return
        }
        // 走訪所有選擇
        for (i in choices.indices) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue
            }
            // 嘗試：做出選擇，更新元素和 total
            state.add(choices[i])
            // 進行下一輪選擇
            backtrack(state, target, total + choices[i], choices, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 I（包含重複子集） */
    fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 狀態（子集）
        val total = 0 // 子集和
        val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
        backtrack(state, target, total, nums, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i_naive.rb"
    ### 回溯演算法：子集和 I ###
    def backtrack(state, target, total, choices, res)
      # 子集和等於 target 時，記錄解
      if total == target
        res << state.dup
        return
      end

      # 走訪所有選擇
      for i in 0...choices.length
        # 剪枝：若子集和超過 target ，則跳過該選擇
        next if total + choices[i] > target
        # 嘗試：做出選擇，更新元素和 total
        state << choices[i]
        # 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res)
        # 回退：撤銷選擇，恢復到之前的狀態
        state.pop
      end
    end

    ### 求解子集和 I（包含重複子集）###
    def subset_sum_i_naive(nums, target)
      state = [] # 狀態（子集）
      total = 0 # 子集和
      res = [] # 結果串列（子集串列）
      backtrack(state, target, total, nums, res)
      res
    end
    ```

=== "Zig"

    ```zig title="subset_sum_i_naive.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumINaive}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%0A%20%20%20%20target%3A%20int%2C%0A%20%20%20%20total%3A%20int%2C%0A%20%20%20%20choices%3A%20list%5Bint%5D%2C%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D%2C%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E8%B7%B3%E9%81%8E%E8%A9%B2%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%E5%92%8C%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%2C%20total%20%2B%20choices%5Bi%5D%2C%20choices%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%EF%BC%88%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%EF%BC%89%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20total%20%3D%200%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20total%2C%20nums%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E8%AB%8B%E6%B3%A8%E6%84%8F%EF%BC%8C%E8%A9%B2%E6%96%B9%E6%B3%95%E8%BC%B8%E5%87%BA%E7%9A%84%E7%B5%90%E6%9E%9C%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E9%9B%86%E5%90%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%0A%20%20%20%20target%3A%20int%2C%0A%20%20%20%20total%3A%20int%2C%0A%20%20%20%20choices%3A%20list%5Bint%5D%2C%0A%20%20%20%20res%3A%20list%5Blist%5Bint%5D%5D%2C%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20total%20%3D%3D%20target%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20for%20i%20in%20range%28len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E8%B7%B3%E9%81%8E%E8%A9%B2%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20if%20total%20%2B%20choices%5Bi%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%E5%85%83%E7%B4%A0%E5%92%8C%20total%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%2C%20total%20%2B%20choices%5Bi%5D%2C%20choices%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i_naive%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%EF%BC%88%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%EF%BC%89%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20total%20%3D%200%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20total%2C%20nums%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i_naive%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29%0A%20%20%20%20print%28f%22%E8%AB%8B%E6%B3%A8%E6%84%8F%EF%BC%8C%E8%A9%B2%E6%96%B9%E6%B3%95%E8%BC%B8%E5%87%BA%E7%9A%84%E7%B5%90%E6%9E%9C%E5%8C%85%E5%90%AB%E9%87%8D%E8%A4%87%E9%9B%86%E5%90%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

向以上程式碼輸入陣列 $[3, 4, 5]$ 和目標元素 $9$ ，輸出結果為 $[3, 3, 3], [4, 5], [5, 4]$ 。**雖然成功找出了所有和為 $9$ 的子集，但其中存在重複的子集 $[4, 5]$ 和 $[5, 4]$** 。

這是因為搜尋過程是區分選擇順序的，然而子集不區分選擇順序。如圖 13-10 所示，先選 $4$ 後選 $5$ 與先選 $5$ 後選 $4$ 是不同的分支，但對應同一個子集。

![子集搜尋與越界剪枝](subset_sum_problem.assets/subset_sum_i_naive.png){ class="animation-figure" }

<p align="center"> 圖 13-10 &nbsp; 子集搜尋與越界剪枝 </p>

為了去除重複子集，**一種直接的思路是對結果串列進行去重**。但這個方法效率很低，有兩方面原因。

- 當陣列元素較多，尤其是當 `target` 較大時，搜尋過程會產生大量的重複子集。
- 比較子集（陣列）的異同非常耗時，需要先排序陣列，再比較陣列中每個元素的異同。

### 2. &nbsp; 重複子集剪枝

**我們考慮在搜尋過程中透過剪枝進行去重**。觀察圖 13-11 ，重複子集是在以不同順序選擇陣列元素時產生的，例如以下情況。

1. 當第一輪和第二輪分別選擇 $3$ 和 $4$ 時，會生成包含這兩個元素的所有子集，記為 $[3, 4, \dots]$ 。
2. 之後，當第一輪選擇 $4$ 時，**則第二輪應該跳過 $3$** ，因為該選擇產生的子集 $[4, 3, \dots]$ 和第 `1.` 步中生成的子集完全重複。

在搜尋過程中，每一層的選擇都是從左到右被逐個嘗試的，因此越靠右的分支被剪掉的越多。

1. 前兩輪選擇 $3$ 和 $5$ ，生成子集 $[3, 5, \dots]$ 。
2. 前兩輪選擇 $4$ 和 $5$ ，生成子集 $[4, 5, \dots]$ 。
3. 若第一輪選擇 $5$ ，**則第二輪應該跳過 $3$ 和 $4$** ，因為子集 $[5, 3, \dots]$ 和 $[5, 4, \dots]$ 與第 `1.` 步和第 `2.` 步中描述的子集完全重複。

![不同選擇順序導致的重複子集](subset_sum_problem.assets/subset_sum_i_pruning.png){ class="animation-figure" }

<p align="center"> 圖 13-11 &nbsp; 不同選擇順序導致的重複子集 </p>

總結來看，給定輸入陣列 $[x_1, x_2, \dots, x_n]$ ，設搜尋過程中的選擇序列為 $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$ ，則該選擇序列需要滿足 $i_1 \leq i_2 \leq \dots \leq i_m$ ，**不滿足該條件的選擇序列都會造成重複，應當剪枝**。

### 3. &nbsp; 程式碼實現

為實現該剪枝，我們初始化變數 `start` ，用於指示走訪起始點。**當做出選擇 $x_{i}$ 後，設定下一輪從索引 $i$ 開始走訪**。這樣做就可以讓選擇序列滿足 $i_1 \leq i_2 \leq \dots \leq i_m$ ，從而保證子集唯一。

除此之外，我們還對程式碼進行了以下兩項最佳化。

- 在開啟搜尋前，先將陣列 `nums` 排序。在走訪所有選擇時，**當子集和超過 `target` 時直接結束迴圈**，因為後邊的元素更大，其子集和一定超過 `target` 。
- 省去元素和變數 `total` ，**透過在 `target` 上執行減法來統計元素和**，當 `target` 等於 $0$ 時記錄解。

=== "Python"

    ```python title="subset_sum_i.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """回溯演算法：子集和 I"""
        # 子集和等於 target 時，記錄解
        if target == 0:
            res.append(list(state))
            return
        # 走訪所有選擇
        # 剪枝二：從 start 開始走訪，避免生成重複子集
        for i in range(start, len(choices)):
            # 剪枝一：若子集和超過 target ，則直接結束迴圈
            # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0:
                break
            # 嘗試：做出選擇，更新 target, start
            state.append(choices[i])
            # 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res)
            # 回退：撤銷選擇，恢復到之前的狀態
            state.pop()

    def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 I"""
        state = []  # 狀態（子集）
        nums.sort()  # 對 nums 進行排序
        start = 0  # 走訪起始點
        res = []  # 結果串列（子集串列）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_i.cpp"
    /* 回溯演算法：子集和 I */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (int i = start; i < choices.size(); i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push_back(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop_back();
        }
    }

    /* 求解子集和 I */
    vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
        vector<int> state;              // 狀態（子集）
        sort(nums.begin(), nums.end()); // 對 nums 進行排序
        int start = 0;                  // 走訪起始點
        vector<vector<int>> res;        // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_i.java"
    /* 回溯演算法：子集和 I */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (int i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.add(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 I */
    List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 狀態（子集）
        Arrays.sort(nums); // 對 nums 進行排序
        int start = 0; // 走訪起始點
        List<List<Integer>> res = new ArrayList<>(); // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_i.cs"
    /* 回溯演算法：子集和 I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (int i = start; i < choices.Length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.Add(choices[i]);
            // 進行下一輪選擇
            Backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // 狀態（子集）
        Array.Sort(nums); // 對 nums 進行排序
        int start = 0; // 走訪起始點
        List<List<int>> res = []; // 結果串列（子集串列）
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_i.go"
    /* 回溯演算法：子集和 I */
    func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for i := start; i < len(*choices); i++ {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target-(*choices)[i] < 0 {
                break
            }
            // 嘗試：做出選擇，更新 target, start
            *state = append(*state, (*choices)[i])
            // 進行下一輪選擇
            backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 I */
    func subsetSumI(nums []int, target int) [][]int {
        state := make([]int, 0) // 狀態（子集）
        sort.Ints(nums)         // 對 nums 進行排序
        start := 0              // 走訪起始點
        res := make([][]int, 0) // 結果串列（子集串列）
        backtrackSubsetSumI(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_i.swift"
    /* 回溯演算法：子集和 I */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            res.append(state)
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for i in choices.indices.dropFirst(start) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0 {
                break
            }
            // 嘗試：做出選擇，更新 target, start
            state.append(choices[i])
            // 進行下一輪選擇
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeLast()
        }
    }

    /* 求解子集和 I */
    func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 狀態（子集）
        let nums = nums.sorted() // 對 nums 進行排序
        let start = 0 // 走訪起始點
        var res: [[Int]] = [] // 結果串列（子集串列）
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_i.js"
    /* 回溯演算法：子集和 I */
    function backtrack(state, target, choices, start, res) {
        // 子集和等於 target 時，記錄解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I */
    function subsetSumI(nums, target) {
        const state = []; // 狀態（子集）
        nums.sort((a, b) => a - b); // 對 nums 進行排序
        const start = 0; // 走訪起始點
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_i.ts"
    /* 回溯演算法：子集和 I */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 子集和等於 target 時，記錄解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I */
    function subsetSumI(nums: number[], target: number): number[][] {
        const state = []; // 狀態（子集）
        nums.sort((a, b) => a - b); // 對 nums 進行排序
        const start = 0; // 走訪起始點
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_i.dart"
    /* 回溯演算法：子集和 I */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 子集和等於 target 時，記錄解
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 走訪所有選擇
      // 剪枝二：從 start 開始走訪，避免生成重複子集
      for (int i = start; i < choices.length; i++) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if (target - choices[i] < 0) {
          break;
        }
        // 嘗試：做出選擇，更新 target, start
        state.add(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeLast();
      }
    }

    /* 求解子集和 I */
    List<List<int>> subsetSumI(List<int> nums, int target) {
      List<int> state = []; // 狀態（子集）
      nums.sort(); // 對 nums 進行排序
      int start = 0; // 走訪起始點
      List<List<int>> res = []; // 結果串列（子集串列）
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_i.rs"
    /* 回溯演算法：子集和 I */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for i in start..choices.len() {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0 {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 I */
    fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 狀態（子集）
        nums.sort(); // 對 nums 進行排序
        let start = 0; // 走訪起始點
        let mut res = Vec::new(); // 結果串列（子集串列）
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_i.c"
    /* 回溯演算法：子集和 I */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            for (int i = 0; i < stateSize; ++i) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (int i = start; i < choicesSize; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 嘗試：做出選擇，更新 target, start
            state[stateSize] = choices[i];
            stateSize++;
            // 進行下一輪選擇
            backtrack(target - choices[i], choices, choicesSize, i);
            // 回退：撤銷選擇，恢復到之前的狀態
            stateSize--;
        }
    }

    /* 求解子集和 I */
    void subsetSumI(int *nums, int numsSize, int target) {
        qsort(nums, numsSize, sizeof(int), cmp); // 對 nums 進行排序
        int start = 0;                           // 走訪起始點
        backtrack(target, nums, numsSize, start);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_i.kt"
    /* 回溯演算法：子集和 I */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        for (i in start..<choices.size) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break
            }
            // 嘗試：做出選擇，更新 target, start
            state.add(choices[i])
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 I */
    fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 狀態（子集）
        nums.sort() // 對 nums 進行排序
        val start = 0 // 走訪起始點
        val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_i.rb"
    ### 回溯演算法：子集和 I ###
    def backtrack(state, target, choices, start, res)
      # 子集和等於 target 時，記錄解
      if target.zero?
        res << state.dup
        return
      end
      # 走訪所有選擇
      # 剪枝二：從 start 開始走訪，避免生成重複子集
      for i in start...choices.length
        # 剪枝一：若子集和超過 target ，則直接結束迴圈
        # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        break if target - choices[i] < 0
        # 嘗試：做出選擇，更新 target, start
        state << choices[i]
        # 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i, res)
        # 回退：撤銷選擇，恢復到之前的狀態
        state.pop
      end
    end

    ### 求解子集和 I ###
    def subset_sum_i(nums, target)
      state = [] # 狀態（子集）
      nums.sort! # 對 nums 進行排序
      start = 0 # 走訪起始點
      res = [] # 結果串列（子集串列）
      backtrack(state, target, nums, start, res)
      res
    end
    ```

=== "Zig"

    ```zig title="subset_sum_i.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumI}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E7%B5%90%E6%9D%9F%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%23%20%E9%80%99%E6%98%AF%E5%9B%A0%E7%82%BA%E9%99%A3%E5%88%97%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%BE%8C%E9%82%8A%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E9%81%8E%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%20target%2C%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%B0%8D%20nums%20%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E8%B5%B0%E8%A8%AA%E8%B5%B7%E5%A7%8B%E9%BB%9E%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E7%B5%90%E6%9D%9F%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%23%20%E9%80%99%E6%98%AF%E5%9B%A0%E7%82%BA%E9%99%A3%E5%88%97%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%BE%8C%E9%82%8A%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E9%81%8E%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%20target%2C%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_i%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20I%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%B0%8D%20nums%20%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E8%B5%B0%E8%A8%AA%E8%B5%B7%E5%A7%8B%E9%BB%9E%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B3%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_i%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 13-12 所示為將陣列 $[3, 4, 5]$ 和目標元素 $9$ 輸入以上程式碼後的整體回溯過程。

![子集和 I 回溯過程](subset_sum_problem.assets/subset_sum_i.png){ class="animation-figure" }

<p align="center"> 圖 13-12 &nbsp; 子集和 I 回溯過程 </p>

## 13.3.2 &nbsp; 考慮重複元素的情況

!!! question

    給定一個正整數陣列 `nums` 和一個目標正整數 `target` ，請找出所有可能的組合，使得組合中的元素和等於 `target` 。**給定陣列可能包含重複元素，每個元素只可被選擇一次**。請以串列形式返回這些組合，串列中不應包含重複組合。

相比於上題，**本題的輸入陣列可能包含重複元素**，這引入了新的問題。例如，給定陣列 $[4, \hat{4}, 5]$ 和目標元素 $9$ ，則現有程式碼的輸出結果為 $[4, 5], [\hat{4}, 5]$ ，出現了重複子集。

**造成這種重複的原因是相等元素在某輪中被多次選擇**。在圖 13-13 中，第一輪共有三個選擇，其中兩個都為 $4$ ，會產生兩個重複的搜尋分支，從而輸出重複子集；同理，第二輪的兩個 $4$ 也會產生重複子集。

![相等元素導致的重複子集](subset_sum_problem.assets/subset_sum_ii_repeat.png){ class="animation-figure" }

<p align="center"> 圖 13-13 &nbsp; 相等元素導致的重複子集 </p>

### 1. &nbsp; 相等元素剪枝

為解決此問題，**我們需要限制相等元素在每一輪中只能被選擇一次**。實現方式比較巧妙：由於陣列是已排序的，因此相等元素都是相鄰的。這意味著在某輪選擇中，若當前元素與其左邊元素相等，則說明它已經被選擇過，因此直接跳過當前元素。

與此同時，**本題規定每個陣列元素只能被選擇一次**。幸運的是，我們也可以利用變數 `start` 來滿足該約束：當做出選擇 $x_{i}$ 後，設定下一輪從索引 $i + 1$ 開始向後走訪。這樣既能去除重複子集，也能避免重複選擇元素。

### 2. &nbsp; 程式碼實現

=== "Python"

    ```python title="subset_sum_ii.py"
    def backtrack(
        state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
    ):
        """回溯演算法：子集和 II"""
        # 子集和等於 target 時，記錄解
        if target == 0:
            res.append(list(state))
            return
        # 走訪所有選擇
        # 剪枝二：從 start 開始走訪，避免生成重複子集
        # 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for i in range(start, len(choices)):
            # 剪枝一：若子集和超過 target ，則直接結束迴圈
            # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0:
                break
            # 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if i > start and choices[i] == choices[i - 1]:
                continue
            # 嘗試：做出選擇，更新 target, start
            state.append(choices[i])
            # 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res)
            # 回退：撤銷選擇，恢復到之前的狀態
            state.pop()

    def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
        """求解子集和 II"""
        state = []  # 狀態（子集）
        nums.sort()  # 對 nums 進行排序
        start = 0  # 走訪起始點
        res = []  # 結果串列（子集串列）
        backtrack(state, target, nums, start, res)
        return res
    ```

=== "C++"

    ```cpp title="subset_sum_ii.cpp"
    /* 回溯演算法：子集和 II */
    void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.push_back(state);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (int i = start; i < choices.size(); i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push_back(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop_back();
        }
    }

    /* 求解子集和 II */
    vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
        vector<int> state;              // 狀態（子集）
        sort(nums.begin(), nums.end()); // 對 nums 進行排序
        int start = 0;                  // 走訪起始點
        vector<vector<int>> res;        // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Java"

    ```java title="subset_sum_ii.java"
    /* 回溯演算法：子集和 II */
    void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (int i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.add(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.remove(state.size() - 1);
        }
    }

    /* 求解子集和 II */
    List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // 狀態（子集）
        Arrays.sort(nums); // 對 nums 進行排序
        int start = 0; // 走訪起始點
        List<List<Integer>> res = new ArrayList<>(); // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "C#"

    ```csharp title="subset_sum_ii.cs"
    /* 回溯演算法：子集和 II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (int i = start; i < choices.Length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.Add(choices[i]);
            // 進行下一輪選擇
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // 狀態（子集）
        Array.Sort(nums); // 對 nums 進行排序
        int start = 0; // 走訪起始點
        List<List<int>> res = []; // 結果串列（子集串列）
        Backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Go"

    ```go title="subset_sum_ii.go"
    /* 回溯演算法：子集和 II */
    func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            newState := append([]int{}, *state...)
            *res = append(*res, newState)
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for i := start; i < len(*choices); i++ {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target-(*choices)[i] < 0 {
                break
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if i > start && (*choices)[i] == (*choices)[i-1] {
                continue
            }
            // 嘗試：做出選擇，更新 target, start
            *state = append(*state, (*choices)[i])
            // 進行下一輪選擇
            backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            *state = (*state)[:len(*state)-1]
        }
    }

    /* 求解子集和 II */
    func subsetSumII(nums []int, target int) [][]int {
        state := make([]int, 0) // 狀態（子集）
        sort.Ints(nums)         // 對 nums 進行排序
        start := 0              // 走訪起始點
        res := make([][]int, 0) // 結果串列（子集串列）
        backtrackSubsetSumII(start, target, &state, &nums, &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="subset_sum_ii.swift"
    /* 回溯演算法：子集和 II */
    func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            res.append(state)
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for i in choices.indices.dropFirst(start) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0 {
                break
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if i > start, choices[i] == choices[i - 1] {
                continue
            }
            // 嘗試：做出選擇，更新 target, start
            state.append(choices[i])
            // 進行下一輪選擇
            backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeLast()
        }
    }

    /* 求解子集和 II */
    func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
        var state: [Int] = [] // 狀態（子集）
        let nums = nums.sorted() // 對 nums 進行排序
        let start = 0 // 走訪起始點
        var res: [[Int]] = [] // 結果串列（子集串列）
        backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
        return res
    }
    ```

=== "JS"

    ```javascript title="subset_sum_ii.js"
    /* 回溯演算法：子集和 II */
    function backtrack(state, target, choices, start, res) {
        // 子集和等於 target 時，記錄解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 II */
    function subsetSumII(nums, target) {
        const state = []; // 狀態（子集）
        nums.sort((a, b) => a - b); // 對 nums 進行排序
        const start = 0; // 走訪起始點
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "TS"

    ```typescript title="subset_sum_ii.ts"
    /* 回溯演算法：子集和 II */
    function backtrack(
        state: number[],
        target: number,
        choices: number[],
        start: number,
        res: number[][]
    ): void {
        // 子集和等於 target 時，記錄解
        if (target === 0) {
            res.push([...state]);
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (let i = start; i < choices.length; i++) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] === choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 II */
    function subsetSumII(nums: number[], target: number): number[][] {
        const state = []; // 狀態（子集）
        nums.sort((a, b) => a - b); // 對 nums 進行排序
        const start = 0; // 走訪起始點
        const res = []; // 結果串列（子集串列）
        backtrack(state, target, nums, start, res);
        return res;
    }
    ```

=== "Dart"

    ```dart title="subset_sum_ii.dart"
    /* 回溯演算法：子集和 II */
    void backtrack(
      List<int> state,
      int target,
      List<int> choices,
      int start,
      List<List<int>> res,
    ) {
      // 子集和等於 target 時，記錄解
      if (target == 0) {
        res.add(List.from(state));
        return;
      }
      // 走訪所有選擇
      // 剪枝二：從 start 開始走訪，避免生成重複子集
      // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
      for (int i = start; i < choices.length; i++) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if (target - choices[i] < 0) {
          break;
        }
        // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
        if (i > start && choices[i] == choices[i - 1]) {
          continue;
        }
        // 嘗試：做出選擇，更新 target, start
        state.add(choices[i]);
        // 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeLast();
      }
    }

    /* 求解子集和 II */
    List<List<int>> subsetSumII(List<int> nums, int target) {
      List<int> state = []; // 狀態（子集）
      nums.sort(); // 對 nums 進行排序
      int start = 0; // 走訪起始點
      List<List<int>> res = []; // 結果串列（子集串列）
      backtrack(state, target, nums, start, res);
      return res;
    }
    ```

=== "Rust"

    ```rust title="subset_sum_ii.rs"
    /* 回溯演算法：子集和 II */
    fn backtrack(
        state: &mut Vec<i32>,
        target: i32,
        choices: &[i32],
        start: usize,
        res: &mut Vec<Vec<i32>>,
    ) {
        // 子集和等於 target 時，記錄解
        if target == 0 {
            res.push(state.clone());
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for i in start..choices.len() {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if target - choices[i] < 0 {
                break;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if i > start && choices[i] == choices[i - 1] {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state.push(choices[i]);
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.pop();
        }
    }

    /* 求解子集和 II */
    fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
        let mut state = Vec::new(); // 狀態（子集）
        nums.sort(); // 對 nums 進行排序
        let start = 0; // 走訪起始點
        let mut res = Vec::new(); // 結果串列（子集串列）
        backtrack(&mut state, target, nums, start, &mut res);
        res
    }
    ```

=== "C"

    ```c title="subset_sum_ii.c"
    /* 回溯演算法：子集和 II */
    void backtrack(int target, int *choices, int choicesSize, int start) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            for (int i = 0; i < stateSize; i++) {
                res[resSize][i] = state[i];
            }
            resColSizes[resSize++] = stateSize;
            return;
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (int i = start; i < choicesSize; i++) {
            // 剪枝一：若子集和超過 target ，則直接跳過
            if (target - choices[i] < 0) {
                continue;
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target, start
            state[stateSize] = choices[i];
            stateSize++;
            // 進行下一輪選擇
            backtrack(target - choices[i], choices, choicesSize, i + 1);
            // 回退：撤銷選擇，恢復到之前的狀態
            stateSize--;
        }
    }

    /* 求解子集和 II */
    void subsetSumII(int *nums, int numsSize, int target) {
        // 對 nums 進行排序
        qsort(nums, numsSize, sizeof(int), cmp);
        // 開始回溯
        backtrack(target, nums, numsSize, 0);
    }
    ```

=== "Kotlin"

    ```kotlin title="subset_sum_ii.kt"
    /* 回溯演算法：子集和 II */
    fun backtrack(
        state: MutableList<Int>,
        target: Int,
        choices: IntArray,
        start: Int,
        res: MutableList<MutableList<Int>?>
    ) {
        // 子集和等於 target 時，記錄解
        if (target == 0) {
            res.add(state.toMutableList())
            return
        }
        // 走訪所有選擇
        // 剪枝二：從 start 開始走訪，避免生成重複子集
        // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
        for (i in start..<choices.size) {
            // 剪枝一：若子集和超過 target ，則直接結束迴圈
            // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
            if (target - choices[i] < 0) {
                break
            }
            // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
            if (i > start && choices[i] == choices[i - 1]) {
                continue
            }
            // 嘗試：做出選擇，更新 target, start
            state.add(choices[i])
            // 進行下一輪選擇
            backtrack(state, target - choices[i], choices, i + 1, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            state.removeAt(state.size - 1)
        }
    }

    /* 求解子集和 II */
    fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
        val state = mutableListOf<Int>() // 狀態（子集）
        nums.sort() // 對 nums 進行排序
        val start = 0 // 走訪起始點
        val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
        backtrack(state, target, nums, start, res)
        return res
    }
    ```

=== "Ruby"

    ```ruby title="subset_sum_ii.rb"
    ### 回溯演算法：子集和 II ###
    def backtrack(state, target, choices, start, res)
      # 子集和等於 target 時，記錄解
      if target.zero?
        res << state.dup
        return
      end

      # 走訪所有選擇
      # 剪枝二：從 start 開始走訪，避免生成重複子集
      # 剪枝三：從 start 開始走訪，避免重複選擇同一元素
      for i in start...choices.length
        # 剪枝一：若子集和超過 target ，則直接結束迴圈
        # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        break if target - choices[i] < 0
        # 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
        next if i > start && choices[i] == choices[i - 1]
        # 嘗試：做出選擇，更新 target, start
        state << choices[i]
        # 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res)
        # 回退：撤銷選擇，恢復到之前的狀態
        state.pop
      end
    end

    ### 求解子集和 II ###
    def subset_sum_ii(nums, target)
      state = [] # 狀態（子集）
      nums.sort! # 對 nums 進行排序
      start = 0 # 走訪起始點
      res = [] # 結果串列（子集串列）
      backtrack(state, target, nums, start, res)
      res
    end
    ```

=== "Zig"

    ```zig title="subset_sum_ii.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{subsetSumII}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%89%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E9%87%8D%E8%A4%87%E9%81%B8%E6%93%87%E5%90%8C%E4%B8%80%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E7%B5%90%E6%9D%9F%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%23%20%E9%80%99%E6%98%AF%E5%9B%A0%E7%82%BA%E9%99%A3%E5%88%97%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%BE%8C%E9%82%8A%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E9%81%8E%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E5%9B%9B%EF%BC%9A%E5%A6%82%E6%9E%9C%E8%A9%B2%E5%85%83%E7%B4%A0%E8%88%87%E5%B7%A6%E9%82%8A%E5%85%83%E7%B4%A0%E7%9B%B8%E7%AD%89%EF%BC%8C%E8%AA%AA%E6%98%8E%E8%A9%B2%E6%90%9C%E5%B0%8B%E5%88%86%E6%94%AF%E9%87%8D%E8%A4%87%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%20target%2C%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%20%2B%201%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%B0%8D%20nums%20%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E8%B5%B0%E8%A8%AA%E8%B5%B7%E5%A7%8B%E9%BB%9E%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20state%3A%20list%5Bint%5D%2C%20target%3A%20int%2C%20choices%3A%20list%5Bint%5D%2C%20start%3A%20int%2C%20res%3A%20list%5Blist%5Bint%5D%5D%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9A%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E9%9B%86%E5%92%8C%E7%AD%89%E6%96%BC%20target%20%E6%99%82%EF%BC%8C%E8%A8%98%E9%8C%84%E8%A7%A3%0A%20%20%20%20if%20target%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20res.append%28list%28state%29%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%BA%8C%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E7%94%9F%E6%88%90%E9%87%8D%E8%A4%87%E5%AD%90%E9%9B%86%0A%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%89%EF%BC%9A%E5%BE%9E%20start%20%E9%96%8B%E5%A7%8B%E8%B5%B0%E8%A8%AA%EF%BC%8C%E9%81%BF%E5%85%8D%E9%87%8D%E8%A4%87%E9%81%B8%E6%93%87%E5%90%8C%E4%B8%80%E5%85%83%E7%B4%A0%0A%20%20%20%20for%20i%20in%20range%28start%2C%20len%28choices%29%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E4%B8%80%EF%BC%9A%E8%8B%A5%E5%AD%90%E9%9B%86%E5%92%8C%E8%B6%85%E9%81%8E%20target%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E7%B5%90%E6%9D%9F%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%23%20%E9%80%99%E6%98%AF%E5%9B%A0%E7%82%BA%E9%99%A3%E5%88%97%E5%B7%B2%E6%8E%92%E5%BA%8F%EF%BC%8C%E5%BE%8C%E9%82%8A%E5%85%83%E7%B4%A0%E6%9B%B4%E5%A4%A7%EF%BC%8C%E5%AD%90%E9%9B%86%E5%92%8C%E4%B8%80%E5%AE%9A%E8%B6%85%E9%81%8E%20target%0A%20%20%20%20%20%20%20%20if%20target%20-%20choices%5Bi%5D%20%3C%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%E5%9B%9B%EF%BC%9A%E5%A6%82%E6%9E%9C%E8%A9%B2%E5%85%83%E7%B4%A0%E8%88%87%E5%B7%A6%E9%82%8A%E5%85%83%E7%B4%A0%E7%9B%B8%E7%AD%89%EF%BC%8C%E8%AA%AA%E6%98%8E%E8%A9%B2%E6%90%9C%E5%B0%8B%E5%88%86%E6%94%AF%E9%87%8D%E8%A4%87%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%0A%20%20%20%20%20%20%20%20if%20i%20%3E%20start%20and%20choices%5Bi%5D%20%3D%3D%20choices%5Bi%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%20target%2C%20start%0A%20%20%20%20%20%20%20%20state.append%28choices%5Bi%5D%29%0A%20%20%20%20%20%20%20%20%23%20%E9%80%B2%E8%A1%8C%E4%B8%8B%E4%B8%80%E8%BC%AA%E9%81%B8%E6%93%87%0A%20%20%20%20%20%20%20%20backtrack%28state%2C%20target%20-%20choices%5Bi%5D%2C%20choices%2C%20i%20%2B%201%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E6%92%A4%E9%8A%B7%E9%81%B8%E6%93%87%EF%BC%8C%E6%81%A2%E5%BE%A9%E5%88%B0%E4%B9%8B%E5%89%8D%E7%9A%84%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20state.pop%28%29%0A%0A%0Adef%20subset_sum_ii%28nums%3A%20list%5Bint%5D%2C%20target%3A%20int%29%20-%3E%20list%5Blist%5Bint%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%E5%AD%90%E9%9B%86%E5%92%8C%20II%22%22%22%0A%20%20%20%20state%20%3D%20%5B%5D%20%20%23%20%E7%8B%80%E6%85%8B%EF%BC%88%E5%AD%90%E9%9B%86%EF%BC%89%0A%20%20%20%20nums.sort%28%29%20%20%23%20%E5%B0%8D%20nums%20%E9%80%B2%E8%A1%8C%E6%8E%92%E5%BA%8F%0A%20%20%20%20start%20%3D%200%20%20%23%20%E8%B5%B0%E8%A8%AA%E8%B5%B7%E5%A7%8B%E9%BB%9E%0A%20%20%20%20res%20%3D%20%5B%5D%20%20%23%20%E7%B5%90%E6%9E%9C%E4%B8%B2%E5%88%97%EF%BC%88%E5%AD%90%E9%9B%86%E4%B8%B2%E5%88%97%EF%BC%89%0A%20%20%20%20backtrack%28state%2C%20target%2C%20nums%2C%20start%2C%20res%29%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4%2C%204%2C%205%5D%0A%20%20%20%20target%20%3D%209%0A%20%20%20%20res%20%3D%20subset_sum_ii%28nums%2C%20target%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E9%99%A3%E5%88%97%20nums%20%3D%20%7Bnums%7D%2C%20target%20%3D%20%7Btarget%7D%22%29%0A%20%20%20%20print%28f%22%E6%89%80%E6%9C%89%E5%92%8C%E7%AD%89%E6%96%BC%20%7Btarget%7D%20%E7%9A%84%E5%AD%90%E9%9B%86%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 13-14 展示了陣列 $[4, 4, 5]$ 和目標元素 $9$ 的回溯過程，共包含四種剪枝操作。請你將圖示與程式碼註釋相結合，理解整個搜尋過程，以及每種剪枝操作是如何工作的。

![子集和 II 回溯過程](subset_sum_problem.assets/subset_sum_ii.png){ class="animation-figure" }

<p align="center"> 圖 13-14 &nbsp; 子集和 II 回溯過程 </p>
