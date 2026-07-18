---
comments: true
---

# 14.1 &nbsp; 初探動態規劃

<u>動態規劃（dynamic programming）</u>是一個重要的演算法範式，它將一個問題分解為一系列更小的子問題，並透過儲存子問題的解來避免重複計算，從而大幅提升時間效率。

在本節中，我們從一個經典例題入手，先給出它的暴力回溯解法，觀察其中包含的重疊子問題，再逐步導出更高效的動態規劃解法。

!!! question "爬樓梯"

    給定一個共有 $n$ 階的樓梯，你每步可以上 $1$ 階或者 $2$ 階，請問有多少種方案可以爬到樓頂？

如圖 14-1 所示，對於一個 $3$ 階樓梯，共有 $3$ 種方案可以爬到樓頂。

![爬到第 3 階的方案數量](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> 圖 14-1 &nbsp; 爬到第 3 階的方案數量 </p>

本題的目標是求解方案數量，**我們可以考慮透過回溯來窮舉所有可能性**。具體來說，將爬樓梯想象為一個多輪選擇的過程：從地面出發，每輪選擇上 $1$ 階或 $2$ 階，每當到達樓梯頂部時就將方案數量加 $1$ ，當越過樓梯頂部時就將其剪枝。程式碼如下所示：

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """回溯"""
        # 當爬到第 n 階時，方案數量加 1
        if state == n:
            res[0] += 1
        # 走訪所有選擇
        for choice in choices:
            # 剪枝：不允許越過第 n 階
            if state + choice > n:
                continue
            # 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res)
            # 回退

    def climbing_stairs_backtrack(n: int) -> int:
        """爬樓梯：回溯"""
        choices = [1, 2]  # 可選擇向上爬 1 階或 2 階
        state = 0  # 從第 0 階開始爬
        res = [0]  # 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* 回溯 */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res[0]++;
        // 走訪所有選擇
        for (auto &choice : choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // 可選擇向上爬 1 階或 2 階
        int state = 0;                // 從第 0 階開始爬
        vector<int> res = {0};        // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* 回溯 */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // 走訪所有選擇
        for (Integer choice : choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 可選擇向上爬 1 階或 2 階
        int state = 0; // 從第 0 階開始爬
        List<Integer> res = new ArrayList<>();
        res.add(0); // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    /* 回溯 */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res[0]++;
        // 走訪所有選擇
        foreach (int choice in choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            Backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
        int state = 0; // 從第 0 階開始爬
        List<int> res = [0]; // 使用 res[0] 記錄方案數量
        Backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    /* 回溯 */
    func backtrack(choices []int, state, n int, res []int) {
        // 當爬到第 n 階時，方案數量加 1
        if state == n {
            res[0] = res[0] + 1
        }
        // 走訪所有選擇
        for _, choice := range choices {
            // 剪枝：不允許越過第 n 階
            if state+choice > n {
                continue
            }
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state+choice, n, res)
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    func climbingStairsBacktrack(n int) int {
        // 可選擇向上爬 1 階或 2 階
        choices := []int{1, 2}
        // 從第 0 階開始爬
        state := 0
        res := make([]int, 1)
        // 使用 res[0] 記錄方案數量
        res[0] = 0
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    /* 回溯 */
    func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
        // 當爬到第 n 階時，方案數量加 1
        if state == n {
            res[0] += 1
        }
        // 走訪所有選擇
        for choice in choices {
            // 剪枝：不允許越過第 n 階
            if state + choice > n {
                continue
            }
            // 嘗試：做出選擇，更新狀態
            backtrack(choices: choices, state: state + choice, n: n, res: &res)
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    func climbingStairsBacktrack(n: Int) -> Int {
        let choices = [1, 2] // 可選擇向上爬 1 階或 2 階
        let state = 0 // 從第 0 階開始爬
        var res: [Int] = []
        res.append(0) // 使用 res[0] 記錄方案數量
        backtrack(choices: choices, state: state, n: n, res: &res)
        return res[0]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    /* 回溯 */
    function backtrack(choices, state, n, res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state === n) res.set(0, res.get(0) + 1);
        // 走訪所有選擇
        for (const choice of choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n) continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    function climbingStairsBacktrack(n) {
        const choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
        const state = 0; // 從第 0 階開始爬
        const res = new Map();
        res.set(0, 0); // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    /* 回溯 */
    function backtrack(
        choices: number[],
        state: number,
        n: number,
        res: Map<0, any>
    ): void {
        // 當爬到第 n 階時，方案數量加 1
        if (state === n) res.set(0, res.get(0) + 1);
        // 走訪所有選擇
        for (const choice of choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n) continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    function climbingStairsBacktrack(n: number): number {
        const choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
        const state = 0; // 從第 0 階開始爬
        const res = new Map();
        res.set(0, 0); // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    /* 回溯 */
    void backtrack(List<int> choices, int state, int n, List<int> res) {
      // 當爬到第 n 階時，方案數量加 1
      if (state == n) {
        res[0]++;
      }
      // 走訪所有選擇
      for (int choice in choices) {
        // 剪枝：不允許越過第 n 階
        if (state + choice > n) continue;
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 回退
      }
    }

    /* 爬樓梯：回溯 */
    int climbingStairsBacktrack(int n) {
      List<int> choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
      int state = 0; // 從第 0 階開始爬
      List<int> res = [];
      res.add(0); // 使用 res[0] 記錄方案數量
      backtrack(choices, state, n, res);
      return res[0];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    /* 回溯 */
    fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
        // 當爬到第 n 階時，方案數量加 1
        if state == n {
            res[0] = res[0] + 1;
        }
        // 走訪所有選擇
        for &choice in choices {
            // 剪枝：不允許越過第 n 階
            if state + choice > n {
                continue;
            }
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    fn climbing_stairs_backtrack(n: usize) -> i32 {
        let choices = vec![1, 2]; // 可選擇向上爬 1 階或 2 階
        let state = 0; // 從第 0 階開始爬
        let mut res = Vec::new();
        res.push(0); // 使用 res[0] 記錄方案數量
        backtrack(&choices, state, n as i32, &mut res);
        res[0]
    }
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    /* 回溯 */
    void backtrack(int *choices, int state, int n, int *res, int len) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res[0]++;
        // 走訪所有選擇
        for (int i = 0; i < len; i++) {
            int choice = choices[i];
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res, len);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    int climbingStairsBacktrack(int n) {
        int choices[2] = {1, 2}; // 可選擇向上爬 1 階或 2 階
        int state = 0;           // 從第 0 階開始爬
        int *res = (int *)malloc(sizeof(int));
        *res = 0; // 使用 res[0] 記錄方案數量
        int len = sizeof(choices) / sizeof(int);
        backtrack(choices, state, n, res, len);
        int result = *res;
        free(res);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    /* 回溯 */
    fun backtrack(
        choices: MutableList<Int>,
        state: Int,
        n: Int,
        res: MutableList<Int>
    ) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res[0] = res[0] + 1
        // 走訪所有選擇
        for (choice in choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n) continue
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res)
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    fun climbingStairsBacktrack(n: Int): Int {
        val choices = mutableListOf(1, 2) // 可選擇向上爬 1 階或 2 階
        val state = 0 // 從第 0 階開始爬
        val res = mutableListOf<Int>()
        res.add(0) // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    ### 回溯 ###
    def backtrack(choices, state, n, res)
      # 當爬到第 n 階時，方案數量加 1
      res[0] += 1 if state == n
      # 走訪所有選擇
      for choice in choices
        # 剪枝：不允許越過第 n 階
        next if state + choice > n

        # 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res)
      end
      # 回退
    end

    ### 爬樓梯：回溯 ###
    def climbing_stairs_backtrack(n)
      choices = [1, 2] # 可選擇向上爬 1 階或 2 階
      state = 0 # 從第 0 階開始爬
      res = [0] # 使用 res[0] 記錄方案數量
      backtrack(choices, state, n, res)
      res.first
    end
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20%23%20%E7%95%B6%E7%88%AC%E5%88%B0%E7%AC%AC%20n%20%E9%9A%8E%E6%99%82%EF%BC%8C%E6%96%B9%E6%A1%88%E6%95%B8%E9%87%8F%E5%8A%A0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%A8%B1%E8%B6%8A%E9%81%8E%E7%AC%AC%20n%20%E9%9A%8E%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%20%E5%8F%AF%E9%81%B8%E6%93%87%E5%90%91%E4%B8%8A%E7%88%AC%201%20%E9%9A%8E%E6%88%96%202%20%E9%9A%8E%0A%20%20%20%20state%20%3D%200%20%20%23%20%E5%BE%9E%E7%AC%AC%200%20%E9%9A%8E%E9%96%8B%E5%A7%8B%E7%88%AC%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%E4%BD%BF%E7%94%A8%20res%5B0%5D%20%E8%A8%98%E9%8C%84%E6%96%B9%E6%A1%88%E6%95%B8%E9%87%8F%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D%2C%20state%3A%20int%2C%20n%3A%20int%2C%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20%23%20%E7%95%B6%E7%88%AC%E5%88%B0%E7%AC%AC%20n%20%E9%9A%8E%E6%99%82%EF%BC%8C%E6%96%B9%E6%A1%88%E6%95%B8%E9%87%8F%E5%8A%A0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%89%80%E6%9C%89%E9%81%B8%E6%93%87%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%A8%B1%E8%B6%8A%E9%81%8E%E7%AC%AC%20n%20%E9%9A%8E%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%81%9A%E5%87%BA%E9%81%B8%E6%93%87%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8B%80%E6%85%8B%0A%20%20%20%20%20%20%20%20backtrack%28choices%2C%20state%20%2B%20choice%2C%20n%2C%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1%2C%202%5D%20%20%23%20%E5%8F%AF%E9%81%B8%E6%93%87%E5%90%91%E4%B8%8A%E7%88%AC%201%20%E9%9A%8E%E6%88%96%202%20%E9%9A%8E%0A%20%20%20%20state%20%3D%200%20%20%23%20%E5%BE%9E%E7%AC%AC%200%20%E9%9A%8E%E9%96%8B%E5%A7%8B%E7%88%AC%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%E4%BD%BF%E7%94%A8%20res%5B0%5D%20%E8%A8%98%E9%8C%84%E6%96%B9%E6%A1%88%E6%95%B8%E9%87%8F%0A%20%20%20%20backtrack%28choices%2C%20state%2C%20n%2C%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 14.1.1 &nbsp; 方法一：暴力搜尋

回溯演算法通常並不顯式地對問題進行拆解，而是將求解問題看作一系列決策步驟，透過試探和剪枝，搜尋所有可能的解。

我們可以嘗試從問題分解的角度分析這道題。設爬到第 $i$ 階共有 $dp[i]$ 種方案，那麼 $dp[i]$ 就是原問題，其子問題包括：

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

由於每輪只能上 $1$ 階或 $2$ 階，因此當我們站在第 $i$ 階樓梯上時，上一輪只可能站在第 $i - 1$ 階或第 $i - 2$ 階上。換句話說，我們只能從第 $i -1$ 階或第 $i - 2$ 階邁向第 $i$ 階。

由此便可得出一個重要推論：**爬到第 $i - 1$ 階的方案數加上爬到第 $i - 2$ 階的方案數就等於爬到第 $i$ 階的方案數**。公式如下：

$$
dp[i] = dp[i-1] + dp[i-2]
$$

這意味著在爬樓梯問題中，各個子問題之間存在遞推關係，**原問題的解可以由子問題的解構建得來**。圖 14-2 展示了該遞推關係。

![方案數量遞推關係](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> 圖 14-2 &nbsp; 方案數量遞推關係 </p>

我們可以根據遞推公式得到暴力搜尋解法。以 $dp[n]$ 為起始點，**遞迴地將一個較大問題拆解為兩個較小問題的和**，直至到達最小子問題 $dp[1]$ 和 $dp[2]$ 時返回。其中，最小子問題的解是已知的，即 $dp[1] = 1$、$dp[2] = 2$ ，表示爬到第 $1$、$2$ 階分別有 $1$、$2$ 種方案。

觀察以下程式碼，它和標準回溯程式碼都屬於深度優先搜尋，但更加簡潔：

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """搜尋"""
        # 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """爬樓梯：搜尋"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    /* 搜尋 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* 搜尋 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    /* 搜尋 */
    int DFS(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    /* 搜尋 */
    func dfs(i int) int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfs(i-1) + dfs(i-2)
        return count
    }

    /* 爬樓梯：搜尋 */
    func climbingStairsDFS(n int) int {
        return dfs(n)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    /* 搜尋 */
    func dfs(i: Int) -> Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1) + dfs(i: i - 2)
        return count
    }

    /* 爬樓梯：搜尋 */
    func climbingStairsDFS(n: Int) -> Int {
        dfs(i: n)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    /* 搜尋 */
    function dfs(i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    function climbingStairsDFS(n) {
        return dfs(n);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    /* 搜尋 */
    function dfs(i: number): number {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    function climbingStairsDFS(n: number): number {
        return dfs(n);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    /* 搜尋 */
    int dfs(int i) {
      // 已知 dp[1] 和 dp[2] ，返回之
      if (i == 1 || i == 2) return i;
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1) + dfs(i - 2);
      return count;
    }

    /* 爬樓梯：搜尋 */
    int climbingStairsDFS(int n) {
      return dfs(n);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    /* 搜尋 */
    fn dfs(i: usize) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1) + dfs(i - 2);
        count
    }

    /* 爬樓梯：搜尋 */
    fn climbing_stairs_dfs(n: usize) -> i32 {
        dfs(n)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    /* 搜尋 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    /* 搜尋 */
    fun dfs(i: Int): Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2) return i
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1) + dfs(i - 2)
        return count
    }

    /* 爬樓梯：搜尋 */
    fun climbingStairsDFS(n: Int): Int {
        return dfs(n)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    ### 搜尋 ###
    def dfs(i)
      # 已知 dp[1] 和 dp[2] ，返回之
      return i if i == 1 || i == 2
      # dp[i] = dp[i-1] + dp[i-2]
      dfs(i - 1) + dfs(i - 2)
    end

    ### 爬樓梯：搜尋 ###
    def climbing_stairs_dfs(n)
      dfs(n)
    end
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 14-3 展示了暴力搜尋形成的遞迴樹。對於問題 $dp[n]$ ，其遞迴樹的深度為 $n$ ，時間複雜度為 $O(2^n)$ 。指數階屬於爆炸式增長，如果我們輸入一個比較大的 $n$ ，則會陷入漫長的等待之中。

![爬樓梯對應遞迴樹](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> 圖 14-3 &nbsp; 爬樓梯對應遞迴樹 </p>

觀察圖 14-3 ，**指數階的時間複雜度是“重疊子問題”導致的**。例如 $dp[9]$ 被分解為 $dp[8]$ 和 $dp[7]$ ，$dp[8]$ 被分解為 $dp[7]$ 和 $dp[6]$ ，兩者都包含子問題 $dp[7]$ 。

以此類推，子問題中包含更小的重疊子問題，子子孫孫無窮盡也。絕大部分計算資源都浪費在這些重疊的子問題上。

## 14.1.2 &nbsp; 方法二：記憶化搜尋

為了提升演算法效率，**我們希望所有的重疊子問題都只被計算一次**。為此，我們宣告一個陣列 `mem` 來記錄每個子問題的解，並在搜尋過程中將重疊子問題剪枝。

1. 當首次計算 $dp[i]$ 時，我們將其記錄至 `mem[i]` ，以便之後使用。
2. 當再次需要計算 $dp[i]$ 時，我們便可直接從 `mem[i]` 中獲取結果，從而避免重複計算該子問題。

程式碼如下所示：

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """記憶化搜尋"""
        # 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 or i == 2:
            return i
        # 若存在記錄 dp[i] ，則直接返回之
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # 記錄 dp[i]
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """爬樓梯：記憶化搜尋"""
        # mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* 記憶化搜尋 */
    int dfs(int i, vector<int> &mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* 記憶化搜尋 */
    int dfs(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    /* 記憶化搜尋 */
    int DFS(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    /* 記憶化搜尋 */
    func dfsMem(i int, mem []int) int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // 若存在記錄 dp[i] ，則直接返回之
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
        // 記錄 dp[i]
        mem[i] = count
        return count
    }

    /* 爬樓梯：記憶化搜尋 */
    func climbingStairsDFSMem(n int) int {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        mem := make([]int, n+1)
        for i := range mem {
            mem[i] = -1
        }
        return dfsMem(n, mem)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    /* 記憶化搜尋 */
    func dfs(i: Int, mem: inout [Int]) -> Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // 若存在記錄 dp[i] ，則直接返回之
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
        // 記錄 dp[i]
        mem[i] = count
        return count
    }

    /* 爬樓梯：記憶化搜尋 */
    func climbingStairsDFSMem(n: Int) -> Int {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        var mem = Array(repeating: -1, count: n + 1)
        return dfs(i: n, mem: &mem)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    /* 記憶化搜尋 */
    function dfs(i, mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    function climbingStairsDFSMem(n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    /* 記憶化搜尋 */
    function dfs(i: number, mem: number[]): number {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    function climbingStairsDFSMem(n: number): number {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    /* 記憶化搜尋 */
    int dfs(int i, List<int> mem) {
      // 已知 dp[1] 和 dp[2] ，返回之
      if (i == 1 || i == 2) return i;
      // 若存在記錄 dp[i] ，則直接返回之
      if (mem[i] != -1) return mem[i];
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1, mem) + dfs(i - 2, mem);
      // 記錄 dp[i]
      mem[i] = count;
      return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int climbingStairsDFSMem(int n) {
      // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
      List<int> mem = List.filled(n + 1, -1);
      return dfs(n, mem);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    /* 記憶化搜尋 */
    fn dfs(i: usize, mem: &mut [i32]) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i as i32;
        }
        // 若存在記錄 dp[i] ，則直接返回之
        if mem[i] != -1 {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        count
    }

    /* 爬樓梯：記憶化搜尋 */
    fn climbing_stairs_dfs_mem(n: usize) -> i32 {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        let mut mem = vec![-1; n + 1];
        dfs(n, &mut mem)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    /* 記憶化搜尋 */
    int dfs(int i, int *mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        int *mem = (int *)malloc((n + 1) * sizeof(int));
        for (int i = 0; i <= n; i++) {
            mem[i] = -1;
        }
        int result = dfs(n, mem);
        free(mem);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    /* 記憶化搜尋 */
    fun dfs(i: Int, mem: IntArray): Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2) return i
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1) return mem[i]
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1, mem) + dfs(i - 2, mem)
        // 記錄 dp[i]
        mem[i] = count
        return count
    }

    /* 爬樓梯：記憶化搜尋 */
    fun climbingStairsDFSMem(n: Int): Int {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        val mem = IntArray(n + 1)
        mem.fill(-1)
        return dfs(n, mem)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    ### 記憶化搜尋 ###
    def dfs(i, mem)
      # 已知 dp[1] 和 dp[2] ，返回之
      return i if i == 1 || i == 2
      # 若存在記錄 dp[i] ，則直接返回之
      return mem[i] if mem[i] != -1

      # dp[i] = dp[i-1] + dp[i-2]
      count = dfs(i - 1, mem) + dfs(i - 2, mem)
      # 記錄 dp[i]
      mem[i] = count
    end

    ### 爬樓梯：記憶化搜尋 ###
    def climbing_stairs_dfs_mem(n)
      # mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
      mem = Array.new(n + 1, -1)
      dfs(n, mem)
    end
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%E8%8B%A5%E5%AD%98%E5%9C%A8%E8%A8%98%E9%8C%84%20dp%5Bi%5D%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%84%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E8%A8%98%E9%8C%84%E7%88%AC%E5%88%B0%E7%AC%AC%20i%20%E9%9A%8E%E7%9A%84%E6%96%B9%E6%A1%88%E7%B8%BD%E6%95%B8%EF%BC%8C-1%20%E4%BB%A3%E8%A1%A8%E7%84%A1%E8%A8%98%E9%8C%84%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%2C%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%E8%8B%A5%E5%AD%98%E5%9C%A8%E8%A8%98%E9%8C%84%20dp%5Bi%5D%20%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20mem%5Bi%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%2C%20mem%29%20%2B%20dfs%28i%20-%202%2C%20mem%29%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%84%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E8%A8%98%E9%8C%84%E7%88%AC%E5%88%B0%E7%AC%AC%20i%20%E9%9A%8E%E7%9A%84%E6%96%B9%E6%A1%88%E7%B8%BD%E6%95%B8%EF%BC%8C-1%20%E4%BB%A3%E8%A1%A8%E7%84%A1%E8%A8%98%E9%8C%84%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n%2C%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

觀察圖 14-4 ，**經過記憶化處理後，所有重疊子問題都只需計算一次，時間複雜度最佳化至 $O(n)$** ，這是一個巨大的飛躍。

![記憶化搜尋對應遞迴樹](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> 圖 14-4 &nbsp; 記憶化搜尋對應遞迴樹 </p>

## 14.1.3 &nbsp; 方法三：動態規劃

**記憶化搜尋是一種“從頂至底”的方法**：我們從原問題（根節點）開始，遞迴地將較大子問題分解為較小子問題，直至解已知的最小子問題（葉節點）。之後，透過回溯逐層收集子問題的解，構建出原問題的解。

與之相反，**動態規劃是一種“從底至頂”的方法**：從最小子問題的解開始，迭代地構建更大子問題的解，直至得到原問題的解。

由於動態規劃不包含回溯過程，因此只需使用迴圈迭代實現，無須使用遞迴。在以下程式碼中，我們初始化一個陣列 `dp` 來儲存子問題的解，它起到了與記憶化搜尋中陣列 `mem` 相同的記錄作用：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """爬樓梯：動態規劃"""
        if n == 1 or n == 2:
            return n
        # 初始化 dp 表，用於儲存子問題的解
        dp = [0] * (n + 1)
        # 初始狀態：預設最小子問題的解
        dp[1], dp[2] = 1, 2
        # 狀態轉移：從較小子問題逐步求解較大子問題
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 爬樓梯：動態規劃 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用於儲存子問題的解
        vector<int> dp(n + 1);
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 爬樓梯：動態規劃 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用於儲存子問題的解
        int[] dp = new int[n + 1];
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* 爬樓梯：動態規劃 */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用於儲存子問題的解
        int[] dp = new int[n + 1];
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* 爬樓梯：動態規劃 */
    func climbingStairsDP(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        // 初始化 dp 表，用於儲存子問題的解
        dp := make([]int, n+1)
        // 初始狀態：預設最小子問題的解
        dp[1] = 1
        dp[2] = 2
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for i := 3; i <= n; i++ {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 爬樓梯：動態規劃 */
    func climbingStairsDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        // 初始化 dp 表，用於儲存子問題的解
        var dp = Array(repeating: 0, count: n + 1)
        // 初始狀態：預設最小子問題的解
        dp[1] = 1
        dp[2] = 2
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for i in 3 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* 爬樓梯：動態規劃 */
    function climbingStairsDP(n) {
        if (n === 1 || n === 2) return n;
        // 初始化 dp 表，用於儲存子問題的解
        const dp = new Array(n + 1).fill(-1);
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* 爬樓梯：動態規劃 */
    function climbingStairsDP(n: number): number {
        if (n === 1 || n === 2) return n;
        // 初始化 dp 表，用於儲存子問題的解
        const dp = new Array(n + 1).fill(-1);
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* 爬樓梯：動態規劃 */
    int climbingStairsDP(int n) {
      if (n == 1 || n == 2) return n;
      // 初始化 dp 表，用於儲存子問題的解
      List<int> dp = List.filled(n + 1, 0);
      // 初始狀態：預設最小子問題的解
      dp[1] = 1;
      dp[2] = 2;
      // 狀態轉移：從較小子問題逐步求解較大子問題
      for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* 爬樓梯：動態規劃 */
    fn climbing_stairs_dp(n: usize) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if n == 1 || n == 2 {
            return n as i32;
        }
        // 初始化 dp 表，用於儲存子問題的解
        let mut dp = vec![-1; n + 1];
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for i in 3..=n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* 爬樓梯：動態規劃 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用於儲存子問題的解
        int *dp = (int *)malloc((n + 1) * sizeof(int));
        // 初始狀態：預設最小子問題的解
        dp[1] = 1;
        dp[2] = 2;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        int result = dp[n];
        free(dp);
        return result;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* 爬樓梯：動態規劃 */
    fun climbingStairsDP(n: Int): Int {
        if (n == 1 || n == 2) return n
        // 初始化 dp 表，用於儲存子問題的解
        val dp = IntArray(n + 1)
        // 初始狀態：預設最小子問題的解
        dp[1] = 1
        dp[2] = 2
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (i in 3..n) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### 爬樓梯：動態規劃 ###
    def climbing_stairs_dp(n)
      return n  if n == 1 || n == 2

      # 初始化 dp 表，用於儲存子問題的解
      dp = Array.new(n + 1, 0)
      # 初始狀態：預設最小子問題的解
      dp[1], dp[2] = 1, 2
      # 狀態轉移：從較小子問題逐步求解較大子問題
      (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

      dp[n]
    end
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E6%96%BC%E5%84%B2%E5%AD%98%E5%AD%90%E5%95%8F%E9%A1%8C%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8B%80%E6%85%8B%EF%BC%9A%E9%A0%90%E8%A8%AD%E6%9C%80%E5%B0%8F%E5%AD%90%E5%95%8F%E9%A1%8C%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%BE%9E%E8%BC%83%E5%B0%8F%E5%AD%90%E5%95%8F%E9%A1%8C%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BC%83%E5%A4%A7%E5%AD%90%E5%95%8F%E9%A1%8C%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E6%96%BC%E5%84%B2%E5%AD%98%E5%AD%90%E5%95%8F%E9%A1%8C%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8B%80%E6%85%8B%EF%BC%9A%E9%A0%90%E8%A8%AD%E6%9C%80%E5%B0%8F%E5%AD%90%E5%95%8F%E9%A1%8C%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D%2C%20dp%5B2%5D%20%3D%201%2C%202%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%BE%9E%E8%BC%83%E5%B0%8F%E5%AD%90%E5%95%8F%E9%A1%8C%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BC%83%E5%A4%A7%E5%AD%90%E5%95%8F%E9%A1%8C%0A%20%20%20%20for%20i%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 14-5 模擬了以上程式碼的執行過程。

![爬樓梯的動態規劃過程](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> 圖 14-5 &nbsp; 爬樓梯的動態規劃過程 </p>

與回溯演算法一樣，動態規劃也使用“狀態”概念來表示問題求解的特定階段，每個狀態都對應一個子問題以及相應的區域性最優解。例如，爬樓梯問題的狀態定義為當前所在樓梯階數 $i$ 。

根據以上內容，我們可以總結出動態規劃的常用術語。

- 將陣列 `dp` 稱為 <u>dp 表</u>，$dp[i]$ 表示狀態 $i$ 對應子問題的解。
- 將最小子問題對應的狀態（第 $1$ 階和第 $2$ 階樓梯）稱為<u>初始狀態</u>。
- 將遞推公式 $dp[i] = dp[i-1] + dp[i-2]$ 稱為<u>狀態轉移方程</u>。

## 14.1.4 &nbsp; 空間最佳化

細心的讀者可能發現了，**由於 $dp[i]$ 只與 $dp[i-1]$ 和 $dp[i-2]$ 有關，因此我們無須使用一個陣列 `dp` 來儲存所有子問題的解**，而只需兩個變數滾動前進即可。程式碼如下所示：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """爬樓梯：空間最佳化後的動態規劃"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    func climbingStairsDPComp(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        a, b := 1, 2
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for i := 3; i <= n; i++ {
            a, b = b, a+b
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    func climbingStairsDPComp(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var a = 1
        var b = 2
        for _ in 3 ... n {
            (a, b) = (b, a + b)
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    function climbingStairsDPComp(n) {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    function climbingStairsDPComp(n: number): number {
        if (n === 1 || n === 2) return n;
        let a = 1,
            b = 2;
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    int climbingStairsDPComp(int n) {
      if (n == 1 || n == 2) return n;
      int a = 1, b = 2;
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    fn climbing_stairs_dp_comp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return n as i32;
        }
        let (mut a, mut b) = (1, 2);
        for _ in 3..=n {
            let tmp = b;
            b = a + b;
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    /* 爬樓梯：空間最佳化後的動態規劃 */
    fun climbingStairsDPComp(n: Int): Int {
        if (n == 1 || n == 2) return n
        var a = 1
        var b = 2
        for (i in 3..n) {
            val temp = b
            b += a
            a = temp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    ### 爬樓梯：空間最佳化後的動態規劃 ###
    def climbing_stairs_dp_comp(n)
      return n if n == 1 || n == 2

      a, b = 1, 2
      (3...(n + 1)).each { a, b = b, a + b }

      b
    end
    ```

??? pythontutor "視覺化執行"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A8%93%E6%A2%AF%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a%2C%20b%20%3D%201%2C%202%0A%20%20%20%20for%20_%20in%20range%283%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a%2C%20b%20%3D%20b%2C%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%9A%8E%E6%A8%93%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A8%AE%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

觀察以上程式碼，由於省去了陣列 `dp` 佔用的空間，因此空間複雜度從 $O(n)$ 降至 $O(1)$ 。

在動態規劃問題中，當前狀態往往僅與前面有限個狀態有關，這時我們可以只保留必要的狀態，透過“降維”來節省記憶體空間。**這種空間最佳化技巧被稱為“滾動變數”或“滾動陣列”**。
