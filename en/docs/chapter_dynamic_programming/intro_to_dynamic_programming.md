---
comments: true
---

# 14.1 &nbsp; Introduction to dynamic programming

<u>Dynamic programming</u> is an important algorithmic paradigm that decomposes a problem into a series of smaller subproblems, and stores the solutions of these subproblems to avoid redundant computations, thereby significantly improving time efficiency.

In this section, we start with a classic problem, first presenting its brute force backtracking solution, observing the overlapping subproblems contained within, and then gradually deriving a more efficient dynamic programming solution.

!!! question "Climbing stairs"

    Given a staircase with $n$ steps, where you can climb $1$ or $2$ steps at a time, how many different ways are there to reach the top?

As shown in the Figure 14-1 , there are $3$ ways to reach the top of a $3$-step staircase.

![Number of ways to reach the 3rd step](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> Figure 14-1 &nbsp; Number of ways to reach the 3rd step </p>

The goal of this problem is to determine the number of ways, **considering using backtracking to exhaust all possibilities**. Specifically, imagine climbing stairs as a multi-round choice process: starting from the ground, choosing to go up $1$ or $2$ steps each round, adding one to the count of ways upon reaching the top of the stairs, and pruning the process when exceeding the top. The code is as follows:

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """回溯"""
        # 当爬到第 n 阶时，方案数量加 1
        if state == n:
            res[0] += 1
        # 遍历所有选择
        for choice in choices:
            # 剪枝：不允许越过第 n 阶
            if state + choice > n:
                continue
            # 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res)
            # 回退

    def climbing_stairs_backtrack(n: int) -> int:
        """爬楼梯：回溯"""
        choices = [1, 2]  # 可选择向上爬 1 阶或 2 阶
        state = 0  # 从第 0 阶开始爬
        res = [0]  # 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* 回溯 */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res[0]++;
        // 遍历所有选择
        for (auto &choice : choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n)
                continue;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // 可选择向上爬 1 阶或 2 阶
        int state = 0;                // 从第 0 阶开始爬
        vector<int> res = {0};        // 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* 回溯 */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // 遍历所有选择
        for (Integer choice : choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n)
                continue;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 可选择向上爬 1 阶或 2 阶
        int state = 0; // 从第 0 阶开始爬
        List<Integer> res = new ArrayList<>();
        res.add(0); // 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    /* 回溯 */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res[0]++;
        // 遍历所有选择
        foreach (int choice in choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n)
                continue;
            // 尝试：做出选择，更新状态
            Backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 可选择向上爬 1 阶或 2 阶
        int state = 0; // 从第 0 阶开始爬
        List<int> res = [0]; // 使用 res[0] 记录方案数量
        Backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    /* 回溯 */
    func backtrack(choices []int, state, n int, res []int) {
        // 当爬到第 n 阶时，方案数量加 1
        if state == n {
            res[0] = res[0] + 1
        }
        // 遍历所有选择
        for _, choice := range choices {
            // 剪枝：不允许越过第 n 阶
            if state+choice > n {
                continue
            }
            // 尝试：做出选择，更新状态
            backtrack(choices, state+choice, n, res)
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    func climbingStairsBacktrack(n int) int {
        // 可选择向上爬 1 阶或 2 阶
        choices := []int{1, 2}
        // 从第 0 阶开始爬
        state := 0
        res := make([]int, 1)
        // 使用 res[0] 记录方案数量
        res[0] = 0
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    /* 回溯 */
    func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
        // 当爬到第 n 阶时，方案数量加 1
        if state == n {
            res[0] += 1
        }
        // 遍历所有选择
        for choice in choices {
            // 剪枝：不允许越过第 n 阶
            if state + choice > n {
                continue
            }
            // 尝试：做出选择，更新状态
            backtrack(choices: choices, state: state + choice, n: n, res: &res)
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    func climbingStairsBacktrack(n: Int) -> Int {
        let choices = [1, 2] // 可选择向上爬 1 阶或 2 阶
        let state = 0 // 从第 0 阶开始爬
        var res: [Int] = []
        res.append(0) // 使用 res[0] 记录方案数量
        backtrack(choices: choices, state: state, n: n, res: &res)
        return res[0]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    /* 回溯 */
    function backtrack(choices, state, n, res) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state === n) res.set(0, res.get(0) + 1);
        // 遍历所有选择
        for (const choice of choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n) continue;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    function climbingStairsBacktrack(n) {
        const choices = [1, 2]; // 可选择向上爬 1 阶或 2 阶
        const state = 0; // 从第 0 阶开始爬
        const res = new Map();
        res.set(0, 0); // 使用 res[0] 记录方案数量
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
        // 当爬到第 n 阶时，方案数量加 1
        if (state === n) res.set(0, res.get(0) + 1);
        // 遍历所有选择
        for (const choice of choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n) continue;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    function climbingStairsBacktrack(n: number): number {
        const choices = [1, 2]; // 可选择向上爬 1 阶或 2 阶
        const state = 0; // 从第 0 阶开始爬
        const res = new Map();
        res.set(0, 0); // 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    /* 回溯 */
    void backtrack(List<int> choices, int state, int n, List<int> res) {
      // 当爬到第 n 阶时，方案数量加 1
      if (state == n) {
        res[0]++;
      }
      // 遍历所有选择
      for (int choice in choices) {
        // 剪枝：不允许越过第 n 阶
        if (state + choice > n) continue;
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res);
        // 回退
      }
    }

    /* 爬楼梯：回溯 */
    int climbingStairsBacktrack(int n) {
      List<int> choices = [1, 2]; // 可选择向上爬 1 阶或 2 阶
      int state = 0; // 从第 0 阶开始爬
      List<int> res = [];
      res.add(0); // 使用 res[0] 记录方案数量
      backtrack(choices, state, n, res);
      return res[0];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    /* 回溯 */
    fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
        // 当爬到第 n 阶时，方案数量加 1
        if state == n {
            res[0] = res[0] + 1;
        }
        // 遍历所有选择
        for &choice in choices {
            // 剪枝：不允许越过第 n 阶
            if state + choice > n {
                continue;
            }
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    fn climbing_stairs_backtrack(n: usize) -> i32 {
        let choices = vec![1, 2]; // 可选择向上爬 1 阶或 2 阶
        let state = 0; // 从第 0 阶开始爬
        let mut res = Vec::new();
        res.push(0); // 使用 res[0] 记录方案数量
        backtrack(&choices, state, n as i32, &mut res);
        res[0]
    }
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    /* 回溯 */
    void backtrack(int *choices, int state, int n, int *res, int len) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res[0]++;
        // 遍历所有选择
        for (int i = 0; i < len; i++) {
            int choice = choices[i];
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n)
                continue;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res, len);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    int climbingStairsBacktrack(int n) {
        int choices[2] = {1, 2}; // 可选择向上爬 1 阶或 2 阶
        int state = 0;           // 从第 0 阶开始爬
        int *res = (int *)malloc(sizeof(int));
        *res = 0; // 使用 res[0] 记录方案数量
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
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res[0] = res[0] + 1
        // 遍历所有选择
        for (choice in choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n) continue
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res)
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    fun climbingStairsBacktrack(n: Int): Int {
        val choices = mutableListOf(1, 2) // 可选择向上爬 1 阶或 2 阶
        val state = 0 // 从第 0 阶开始爬
        val res = mutableListOf<Int>()
        res.add(0) // 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res)
        return res[0]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbing_stairs_backtrack}
    ```

=== "Zig"

    ```zig title="climbing_stairs_backtrack.zig"
    // 回溯
    fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n) {
            res.items[0] = res.items[0] + 1;
        }
        // 遍历所有选择
        for (choices) |choice| {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n) {
                continue;
            }
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    // 爬楼梯：回溯
    fn climbingStairsBacktrack(n: usize) !i32 {
        var choices = [_]i32{ 1, 2 }; // 可选择向上爬 1 阶或 2 阶
        var state: i32 = 0; // 从第 0 阶开始爬
        var res = std.ArrayList(i32).init(std.heap.page_allocator);
        defer res.deinit();
        try res.append(0); // 使用 res[0] 记录方案数量
        backtrack(&choices, state, @intCast(n), res);
        return res.items[0];
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D,%20state%3A%20int,%20n%3A%20int,%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%88%AC%E5%88%B0%E7%AC%AC%20n%20%E9%98%B6%E6%97%B6%EF%BC%8C%E6%96%B9%E6%A1%88%E6%95%B0%E9%87%8F%E5%8A%A0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E8%B6%8A%E8%BF%87%E7%AC%AC%20n%20%E9%98%B6%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20backtrack%28choices,%20state%20%2B%20choice,%20n,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1,%202%5D%20%20%23%20%E5%8F%AF%E9%80%89%E6%8B%A9%E5%90%91%E4%B8%8A%E7%88%AC%201%20%E9%98%B6%E6%88%96%202%20%E9%98%B6%0A%20%20%20%20state%20%3D%200%20%20%23%20%E4%BB%8E%E7%AC%AC%200%20%E9%98%B6%E5%BC%80%E5%A7%8B%E7%88%AC%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%E4%BD%BF%E7%94%A8%20res%5B0%5D%20%E8%AE%B0%E5%BD%95%E6%96%B9%E6%A1%88%E6%95%B0%E9%87%8F%0A%20%20%20%20backtrack%28choices,%20state,%20n,%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28choices%3A%20list%5Bint%5D,%20state%3A%20int,%20n%3A%20int,%20res%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E7%88%AC%E5%88%B0%E7%AC%AC%20n%20%E9%98%B6%E6%97%B6%EF%BC%8C%E6%96%B9%E6%A1%88%E6%95%B0%E9%87%8F%E5%8A%A0%201%0A%20%20%20%20if%20state%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%5B0%5D%20%2B%3D%201%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E9%80%89%E6%8B%A9%0A%20%20%20%20for%20choice%20in%20choices%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E8%B6%8A%E8%BF%87%E7%AC%AC%20n%20%E9%98%B6%0A%20%20%20%20%20%20%20%20if%20state%20%2B%20choice%20%3E%20n%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%81%9A%E5%87%BA%E9%80%89%E6%8B%A9%EF%BC%8C%E6%9B%B4%E6%96%B0%E7%8A%B6%E6%80%81%0A%20%20%20%20%20%20%20%20backtrack%28choices,%20state%20%2B%20choice,%20n,%20res%29%0A%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%0A%0A%0Adef%20climbing_stairs_backtrack%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%9B%9E%E6%BA%AF%22%22%22%0A%20%20%20%20choices%20%3D%20%5B1,%202%5D%20%20%23%20%E5%8F%AF%E9%80%89%E6%8B%A9%E5%90%91%E4%B8%8A%E7%88%AC%201%20%E9%98%B6%E6%88%96%202%20%E9%98%B6%0A%20%20%20%20state%20%3D%200%20%20%23%20%E4%BB%8E%E7%AC%AC%200%20%E9%98%B6%E5%BC%80%E5%A7%8B%E7%88%AC%0A%20%20%20%20res%20%3D%20%5B0%5D%20%20%23%20%E4%BD%BF%E7%94%A8%20res%5B0%5D%20%E8%AE%B0%E5%BD%95%E6%96%B9%E6%A1%88%E6%95%B0%E9%87%8F%0A%20%20%20%20backtrack%28choices,%20state,%20n,%20res%29%0A%20%20%20%20return%20res%5B0%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_backtrack%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 14.1.1 &nbsp; Method 1: Brute force search

Backtracking algorithms do not explicitly decompose the problem but treat solving the problem as a series of decision steps, searching for all possible solutions through exploration and pruning.

We can try to analyze this problem from the perspective of decomposition. Let $dp[i]$ be the number of ways to reach the $i^{th}$ step, then $dp[i]$ is the original problem, and its subproblems include:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Since each round can only advance $1$ or $2$ steps, when we stand on the $i^{th}$ step, the previous round must have been either on the $i-1^{th}$ or the $i-2^{th}$ step. In other words, we can only step from the $i-1^{th}$ or the $i-2^{th}$ step to the $i^{th}$ step.

This leads to an important conclusion: **the number of ways to reach the $i-1^{th}$ step plus the number of ways to reach the $i-2^{th}$ step equals the number of ways to reach the $i^{th}$ step**. The formula is as follows:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

This means that in the stair climbing problem, there is a recursive relationship between the subproblems, **the solution to the original problem can be constructed from the solutions to the subproblems**. The following image shows this recursive relationship.

![Recursive relationship of solution counts](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> Figure 14-2 &nbsp; Recursive relationship of solution counts </p>

We can obtain the brute force search solution according to the recursive formula. Starting with $dp[n]$, **recursively decompose a larger problem into the sum of two smaller problems**, until reaching the smallest subproblems $dp[1]$ and $dp[2]$ where the solutions are known, with $dp[1] = 1$ and $dp[2] = 2$, representing $1$ and $2$ ways to climb to the first and second steps, respectively.

Observe the following code, which, like standard backtracking code, belongs to depth-first search but is more concise:

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """搜索"""
        # 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """爬楼梯：搜索"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    /* 搜索 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* 搜索 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    /* 搜索 */
    int DFS(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    /* 搜索 */
    func dfs(i int) int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfs(i-1) + dfs(i-2)
        return count
    }

    /* 爬楼梯：搜索 */
    func climbingStairsDFS(n int) int {
        return dfs(n)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    /* 搜索 */
    func dfs(i: Int) -> Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1) + dfs(i: i - 2)
        return count
    }

    /* 爬楼梯：搜索 */
    func climbingStairsDFS(n: Int) -> Int {
        dfs(i: n)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    /* 搜索 */
    function dfs(i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    function climbingStairsDFS(n) {
        return dfs(n);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    /* 搜索 */
    function dfs(i: number): number {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    function climbingStairsDFS(n: number): number {
        return dfs(n);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    /* 搜索 */
    int dfs(int i) {
      // 已知 dp[1] 和 dp[2] ，返回之
      if (i == 1 || i == 2) return i;
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1) + dfs(i - 2);
      return count;
    }

    /* 爬楼梯：搜索 */
    int climbingStairsDFS(int n) {
      return dfs(n);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    /* 搜索 */
    fn dfs(i: usize) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i as i32;
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1) + dfs(i - 2);
        count
    }

    /* 爬楼梯：搜索 */
    fn climbing_stairs_dfs(n: usize) -> i32 {
        dfs(n)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    /* 搜索 */
    int dfs(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 爬楼梯：搜索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    /* 搜索 */
    fun dfs(i: Int): Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2) return i
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1) + dfs(i - 2)
        return count
    }

    /* 爬楼梯：搜索 */
    fun climbingStairsDFS(n: Int): Int {
        return dfs(n)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs.zig"
    // 搜索
    fn dfs(i: usize) i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 or i == 2) {
            return @intCast(i);
        }
        // dp[i] = dp[i-1] + dp[i-2]
        var count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    // 爬楼梯：搜索
    fn climbingStairsDFS(comptime n: usize) i32 {
        return dfs(n);
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201%29%20%2B%20dfs%28i%20-%202%29%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20return%20dfs%28n%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The following image shows the recursive tree formed by brute force search. For the problem $dp[n]$, the depth of its recursive tree is $n$, with a time complexity of $O(2^n)$. Exponential order represents explosive growth, and entering a long wait if a relatively large $n$ is input.

![Recursive tree for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-3 &nbsp; Recursive tree for climbing stairs </p>

Observing the above image, **the exponential time complexity is caused by 'overlapping subproblems'**. For example, $dp[9]$ is decomposed into $dp[8]$ and $dp[7]$, $dp[8]$ into $dp[7]$ and $dp[6]$, both containing the subproblem $dp[7]$.

Thus, subproblems include even smaller overlapping subproblems, endlessly. A vast majority of computational resources are wasted on these overlapping subproblems.

## 14.1.2 &nbsp; Method 2: Memoized search

To enhance algorithm efficiency, **we hope that all overlapping subproblems are calculated only once**. For this purpose, we declare an array `mem` to record the solution of each subproblem, and prune overlapping subproblems during the search process.

1. When $dp[i]$ is calculated for the first time, we record it in `mem[i]` for later use.
2. When $dp[i]$ needs to be calculated again, we can directly retrieve the result from `mem[i]`, thus avoiding redundant calculations of that subproblem.

The code is as follows:

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """记忆化搜索"""
        # 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 or i == 2:
            return i
        # 若存在记录 dp[i] ，则直接返回之
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # 记录 dp[i]
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """爬楼梯：记忆化搜索"""
        # mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* 记忆化搜索 */
    int dfs(int i, vector<int> &mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* 记忆化搜索 */
    int dfs(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    /* 记忆化搜索 */
    int DFS(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    /* 记忆化搜索 */
    func dfsMem(i int, mem []int) int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // 若存在记录 dp[i] ，则直接返回之
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
        // 记录 dp[i]
        mem[i] = count
        return count
    }

    /* 爬楼梯：记忆化搜索 */
    func climbingStairsDFSMem(n int) int {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        mem := make([]int, n+1)
        for i := range mem {
            mem[i] = -1
        }
        return dfsMem(n, mem)
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    /* 记忆化搜索 */
    func dfs(i: Int, mem: inout [Int]) -> Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i
        }
        // 若存在记录 dp[i] ，则直接返回之
        if mem[i] != -1 {
            return mem[i]
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i: i - 1, mem: &mem) + dfs(i: i - 2, mem: &mem)
        // 记录 dp[i]
        mem[i] = count
        return count
    }

    /* 爬楼梯：记忆化搜索 */
    func climbingStairsDFSMem(n: Int) -> Int {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        var mem = Array(repeating: -1, count: n + 1)
        return dfs(i: n, mem: &mem)
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    /* 记忆化搜索 */
    function dfs(i, mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    function climbingStairsDFSMem(n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    /* 记忆化搜索 */
    function dfs(i: number, mem: number[]): number {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i === 1 || i === 2) return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1) return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        const count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    function climbingStairsDFSMem(n: number): number {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        const mem = new Array(n + 1).fill(-1);
        return dfs(n, mem);
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    /* 记忆化搜索 */
    int dfs(int i, List<int> mem) {
      // 已知 dp[1] 和 dp[2] ，返回之
      if (i == 1 || i == 2) return i;
      // 若存在记录 dp[i] ，则直接返回之
      if (mem[i] != -1) return mem[i];
      // dp[i] = dp[i-1] + dp[i-2]
      int count = dfs(i - 1, mem) + dfs(i - 2, mem);
      // 记录 dp[i]
      mem[i] = count;
      return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int climbingStairsDFSMem(int n) {
      // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
      List<int> mem = List.filled(n + 1, -1);
      return dfs(n, mem);
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    /* 记忆化搜索 */
    fn dfs(i: usize, mem: &mut [i32]) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if i == 1 || i == 2 {
            return i as i32;
        }
        // 若存在记录 dp[i] ，则直接返回之
        if mem[i] != -1 {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        let count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        count
    }

    /* 爬楼梯：记忆化搜索 */
    fn climbing_stairs_dfs_mem(n: usize) -> i32 {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        let mut mem = vec![-1; n + 1];
        dfs(n, &mut mem)
    }
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    /* 记忆化搜索 */
    int dfs(int i, int *mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
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
    /* 记忆化搜索 */
    fun dfs(i: Int, mem: IntArray): Int {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2) return i
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1) return mem[i]
        // dp[i] = dp[i-1] + dp[i-2]
        val count = dfs(i - 1, mem) + dfs(i - 2, mem)
        // 记录 dp[i]
        mem[i] = count
        return count
    }

    /* 爬楼梯：记忆化搜索 */
    fun climbingStairsDFSMem(n: Int): Int {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        val mem = IntArray(n + 1)
        mem.fill(-1)
        return dfs(n, mem)
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs_mem}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs_mem.zig"
    // 记忆化搜索
    fn dfs(i: usize, mem: []i32) i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 or i == 2) {
            return @intCast(i);
        }
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1) {
            return mem[i];
        }
        // dp[i] = dp[i-1] + dp[i-2]
        var count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    // 爬楼梯：记忆化搜索
    fn climbingStairsDFSMem(comptime n: usize) i32 {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        var mem = [_]i32{ -1 } ** (n + 1);
        return dfs(n, &mem);
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int,%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%E8%8B%A5%E5%AD%98%E5%9C%A8%E8%AE%B0%E5%BD%95%20dp%5Bi%5D%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20mem%5Bi%5D%20!%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201,%20mem%29%20%2B%20dfs%28i%20-%202,%20mem%29%0A%20%20%20%20%23%20%E8%AE%B0%E5%BD%95%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E8%AE%B0%E5%BD%95%E7%88%AC%E5%88%B0%E7%AC%AC%20i%20%E9%98%B6%E7%9A%84%E6%96%B9%E6%A1%88%E6%80%BB%E6%95%B0%EF%BC%8C-1%20%E4%BB%A3%E8%A1%A8%E6%97%A0%E8%AE%B0%E5%BD%95%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n,%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20dfs%28i%3A%20int,%20mem%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%B2%E7%9F%A5%20dp%5B1%5D%20%E5%92%8C%20dp%5B2%5D%20%EF%BC%8C%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20i%20%3D%3D%201%20or%20i%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20i%0A%20%20%20%20%23%20%E8%8B%A5%E5%AD%98%E5%9C%A8%E8%AE%B0%E5%BD%95%20dp%5Bi%5D%20%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%E4%B9%8B%0A%20%20%20%20if%20mem%5Bi%5D%20!%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%0A%20%20%20%20%23%20dp%5Bi%5D%20%3D%20dp%5Bi-1%5D%20%2B%20dp%5Bi-2%5D%0A%20%20%20%20count%20%3D%20dfs%28i%20-%201,%20mem%29%20%2B%20dfs%28i%20-%202,%20mem%29%0A%20%20%20%20%23%20%E8%AE%B0%E5%BD%95%20dp%5Bi%5D%0A%20%20%20%20mem%5Bi%5D%20%3D%20count%0A%20%20%20%20return%20count%0A%0A%0Adef%20climbing_stairs_dfs_mem%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20mem%5Bi%5D%20%E8%AE%B0%E5%BD%95%E7%88%AC%E5%88%B0%E7%AC%AC%20i%20%E9%98%B6%E7%9A%84%E6%96%B9%E6%A1%88%E6%80%BB%E6%95%B0%EF%BC%8C-1%20%E4%BB%A3%E8%A1%A8%E6%97%A0%E8%AE%B0%E5%BD%95%0A%20%20%20%20mem%20%3D%20%5B-1%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20return%20dfs%28n,%20mem%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dfs_mem%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Observe the following image, **after memoization, all overlapping subproblems need to be calculated only once, optimizing the time complexity to $O(n)$**, which is a significant leap.

![Recursive tree with memoized search](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> Figure 14-4 &nbsp; Recursive tree with memoized search </p>

## 14.1.3 &nbsp; Method 3: Dynamic programming

**Memoized search is a 'top-down' method**: we start with the original problem (root node), recursively decompose larger subproblems into smaller ones until the solutions to the smallest known subproblems (leaf nodes) are reached. Subsequently, by backtracking, we collect the solutions of the subproblems, constructing the solution to the original problem.

On the contrary, **dynamic programming is a 'bottom-up' method**: starting with the solutions to the smallest subproblems, iteratively construct the solutions to larger subproblems until the original problem is solved.

Since dynamic programming does not include a backtracking process, it only requires looping iteration to implement, without needing recursion. In the following code, we initialize an array `dp` to store the solutions to the subproblems, serving the same recording function as the array `mem` in memoized search:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """爬楼梯：动态规划"""
        if n == 1 or n == 2:
            return n
        # 初始化 dp 表，用于存储子问题的解
        dp = [0] * (n + 1)
        # 初始状态：预设最小子问题的解
        dp[1], dp[2] = 1, 2
        # 状态转移：从较小子问题逐步求解较大子问题
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 爬楼梯：动态规划 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用于存储子问题的解
        vector<int> dp(n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 爬楼梯：动态规划 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用于存储子问题的解
        int[] dp = new int[n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    /* 爬楼梯：动态规划 */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用于存储子问题的解
        int[] dp = new int[n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    /* 爬楼梯：动态规划 */
    func climbingStairsDP(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        // 初始化 dp 表，用于存储子问题的解
        dp := make([]int, n+1)
        // 初始状态：预设最小子问题的解
        dp[1] = 1
        dp[2] = 2
        // 状态转移：从较小子问题逐步求解较大子问题
        for i := 3; i <= n; i++ {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 爬楼梯：动态规划 */
    func climbingStairsDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = Array(repeating: 0, count: n + 1)
        // 初始状态：预设最小子问题的解
        dp[1] = 1
        dp[2] = 2
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    /* 爬楼梯：动态规划 */
    function climbingStairsDP(n) {
        if (n === 1 || n === 2) return n;
        // 初始化 dp 表，用于存储子问题的解
        const dp = new Array(n + 1).fill(-1);
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    /* 爬楼梯：动态规划 */
    function climbingStairsDP(n: number): number {
        if (n === 1 || n === 2) return n;
        // 初始化 dp 表，用于存储子问题的解
        const dp = new Array(n + 1).fill(-1);
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (let i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    /* 爬楼梯：动态规划 */
    int climbingStairsDP(int n) {
      if (n == 1 || n == 2) return n;
      // 初始化 dp 表，用于存储子问题的解
      List<int> dp = List.filled(n + 1, 0);
      // 初始状态：预设最小子问题的解
      dp[1] = 1;
      dp[2] = 2;
      // 状态转移：从较小子问题逐步求解较大子问题
      for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    /* 爬楼梯：动态规划 */
    fn climbing_stairs_dp(n: usize) -> i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if n == 1 || n == 2 {
            return n as i32;
        }
        // 初始化 dp 表，用于存储子问题的解
        let mut dp = vec![-1; n + 1];
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for i in 3..=n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    /* 爬楼梯：动态规划 */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 初始化 dp 表，用于存储子问题的解
        int *dp = (int *)malloc((n + 1) * sizeof(int));
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
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
    /* 爬楼梯：动态规划 */
    fun climbingStairsDP(n: Int): Int {
        if (n == 1 || n == 2) return n
        // 初始化 dp 表，用于存储子问题的解
        val dp = IntArray(n + 1)
        // 初始状态：预设最小子问题的解
        dp[1] = 1
        dp[2] = 2
        // 状态转移：从较小子问题逐步求解较大子问题
        for (i in 3..n) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    [class]{}-[func]{climbing_stairs_dp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    // 爬楼梯：动态规划
    fn climbingStairsDP(comptime n: usize) i32 {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (n == 1 or n == 2) {
            return @intCast(n);
        }
        // 初始化 dp 表，用于存储子问题的解
        var dp = [_]i32{-1} ** (n + 1);
        // 初始状态：预设最小子问题的解
        dp[1] = 1;
        dp[2] = 2;
        // 状态转移：从较小子问题逐步求解较大子问题
        for (3..n + 1) |i| {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%201,%202%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E5%82%A8%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E7%8A%B6%E6%80%81%EF%BC%9A%E9%A2%84%E8%AE%BE%E6%9C%80%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E7%9A%84%E8%A7%A3%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%201,%202%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E4%BB%8E%E8%BE%83%E5%B0%8F%E5%AD%90%E9%97%AE%E9%A2%98%E9%80%90%E6%AD%A5%E6%B1%82%E8%A7%A3%E8%BE%83%E5%A4%A7%E5%AD%90%E9%97%AE%E9%A2%98%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20dp%5Bi%20-%201%5D%20%2B%20dp%5Bi%20-%202%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

The image below simulates the execution process of the above code.

![Dynamic programming process for climbing stairs](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> Figure 14-5 &nbsp; Dynamic programming process for climbing stairs </p>

Like the backtracking algorithm, dynamic programming also uses the concept of "states" to represent specific stages in problem solving, each state corresponding to a subproblem and its local optimal solution. For example, the state of the climbing stairs problem is defined as the current step number $i$.

Based on the above content, we can summarize the commonly used terminology in dynamic programming.

- The array `dp` is referred to as the <u>DP table</u>, with $dp[i]$ representing the solution to the subproblem corresponding to state $i$.
- The states corresponding to the smallest subproblems (steps $1$ and $2$) are called <u>initial states</u>.
- The recursive formula $dp[i] = dp[i-1] + dp[i-2]$ is called the <u>state transition equation</u>.

## 14.1.4 &nbsp; Space optimization

Observant readers may have noticed that **since $dp[i]$ is only related to $dp[i-1]$ and $dp[i-2]$, we do not need to use an array `dp` to store the solutions to all subproblems**, but can simply use two variables to progress iteratively. The code is as follows:

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """爬楼梯：空间优化后的动态规划"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
    func climbingStairsDPComp(n int) int {
        if n == 1 || n == 2 {
            return n
        }
        a, b := 1, 2
        // 状态转移：从较小子问题逐步求解较大子问题
        for i := 3; i <= n; i++ {
            a, b = b, a+b
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    /* 爬楼梯：空间优化后的动态规划 */
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
    [class]{}-[func]{climbing_stairs_dp_comp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    // 爬楼梯：空间优化后的动态规划
    fn climbingStairsDPComp(comptime n: usize) i32 {
        if (n == 1 or n == 2) {
            return @intCast(n);
        }
        var a: i32 = 1;
        var b: i32 = 2;
        for (3..n + 1) |_| {
            var tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a,%20b%20%3D%201,%202%0A%20%20%20%20for%20_%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_dp_comp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%88%AC%E6%A5%BC%E6%A2%AF%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%0A%20%20%20%20a,%20b%20%3D%201,%202%0A%20%20%20%20for%20_%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20a%20%2B%20b%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_dp_comp%28n%29%0A%20%20%20%20print%28f%22%E7%88%AC%20%7Bn%7D%20%E9%98%B6%E6%A5%BC%E6%A2%AF%E5%85%B1%E6%9C%89%20%7Bres%7D%20%E7%A7%8D%E6%96%B9%E6%A1%88%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Observing the above code, since the space occupied by the array `dp` is eliminated, the space complexity is reduced from $O(n)$ to $O(1)$.

In dynamic programming problems, the current state is often only related to a limited number of previous states, allowing us to retain only the necessary states and save memory space by "dimension reduction". **This space optimization technique is known as 'rolling variable' or 'rolling array'**.
