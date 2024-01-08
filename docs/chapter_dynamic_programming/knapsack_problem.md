---
comments: true
---

# 14.4 &nbsp; 0-1 背包问题

背包问题是一个非常好的动态规划入门题目，是动态规划中最常见的问题形式。其具有很多变种，例如 0-1 背包问题、完全背包问题、多重背包问题等。

在本节中，我们先来求解最常见的 0-1 背包问题。

!!! question

    给定 $n$ 个物品，第 $i$ 个物品的重量为 $wgt[i-1]$、价值为 $val[i-1]$ ，和一个容量为 $cap$ 的背包。每个物品只能选择一次，问在限定背包容量下能放入物品的最大价值。

观察图 14-17 ，由于物品编号 $i$ 从 $1$ 开始计数，数组索引从 $0$ 开始计数，因此物品 $i$ 对应重量 $wgt[i-1]$ 和价值 $val[i-1]$ 。

![0-1 背包的示例数据](knapsack_problem.assets/knapsack_example.png){ class="animation-figure" }

<p align="center"> 图 14-17 &nbsp; 0-1 背包的示例数据 </p>

我们可以将 0-1 背包问题看作一个由 $n$ 轮决策组成的过程，对于每个物体都有不放入和放入两种决策，因此该问题满足决策树模型。

该问题的目标是求解“在限定背包容量下能放入物品的最大价值”，因此较大概率是一个动态规划问题。

**第一步：思考每轮的决策，定义状态，从而得到 $dp$ 表**

对于每个物品来说，不放入背包，背包容量不变；放入背包，背包容量减小。由此可得状态定义：当前物品编号 $i$ 和剩余背包容量 $c$ ，记为 $[i, c]$ 。

状态 $[i, c]$ 对应的子问题为：**前 $i$ 个物品在剩余容量为 $c$ 的背包中的最大价值**，记为 $dp[i, c]$ 。

待求解的是 $dp[n, cap]$ ，因此需要一个尺寸为 $(n+1) \times (cap+1)$ 的二维 $dp$ 表。

**第二步：找出最优子结构，进而推导出状态转移方程**

当我们做出物品 $i$ 的决策后，剩余的是前 $i-1$ 个物品的决策，可分为以下两种情况。

- **不放入物品 $i$** ：背包容量不变，状态变化为 $[i-1, c]$ 。
- **放入物品 $i$** ：背包容量减少 $wgt[i-1]$ ，价值增加 $val[i-1]$ ，状态变化为 $[i-1, c-wgt[i-1]]$ 。

上述分析向我们揭示了本题的最优子结构：**最大价值 $dp[i, c]$ 等于不放入物品 $i$ 和放入物品 $i$ 两种方案中价值更大的那一个**。由此可推导出状态转移方程：

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

需要注意的是，若当前物品重量 $wgt[i - 1]$ 超出剩余背包容量 $c$ ，则只能选择不放入背包。

**第三步：确定边界条件和状态转移顺序**

当无物品或无剩余背包容量时最大价值为 $0$ ，即首列 $dp[i, 0]$ 和首行 $dp[0, c]$ 都等于 $0$ 。

当前状态 $[i, c]$ 从上方的状态 $[i-1, c]$ 和左上方的状态 $[i-1, c-wgt[i-1]]$ 转移而来，因此通过两层循环正序遍历整个 $dp$ 表即可。

根据以上分析，我们接下来按顺序实现暴力搜索、记忆化搜索、动态规划解法。

### 1. &nbsp; 方法一：暴力搜索

搜索代码包含以下要素。

- **递归参数**：状态 $[i, c]$ 。
- **返回值**：子问题的解 $dp[i, c]$ 。
- **终止条件**：当物品编号越界 $i = 0$ 或背包剩余容量为 $0$ 时，终止递归并返回价值 $0$ 。
- **剪枝**：若当前物品重量超出背包剩余容量，则只能选择不放入背包。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
        """0-1 背包：暴力搜索"""
        # 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 or c == 0:
            return 0
        # 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c:
            return knapsack_dfs(wgt, val, i - 1, c)
        # 计算不放入和放入物品 i 的最大价值
        no = knapsack_dfs(wgt, val, i - 1, c)
        yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 返回两种方案中价值更大的那一个
        return max(no, yes)
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：暴力搜索 */
    int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return max(no, yes);
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：暴力搜索 */
    int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return Math.max(no, yes);
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：暴力搜索 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return Math.Max(no, yes);
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：暴力搜索 */
    func knapsackDFS(wgt, val []int, i, c int) int {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i-1] > c {
            return knapsackDFS(wgt, val, i-1, c)
        }
        // 计算不放入和放入物品 i 的最大价值
        no := knapsackDFS(wgt, val, i-1, c)
        yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
        // 返回两种方案中价值更大的那一个
        return int(math.Max(float64(no), float64(yes)))
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：暴力搜索 */
    func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c {
            return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        }
        // 计算不放入和放入物品 i 的最大价值
        let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 返回两种方案中价值更大的那一个
        return max(no, yes)
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：暴力搜索 */
    function knapsackDFS(wgt, val, i, c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return Math.max(no, yes);
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：暴力搜索 */
    function knapsackDFS(
        wgt: Array<number>,
        val: Array<number>,
        i: number,
        c: number
    ): number {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return Math.max(no, yes);
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：暴力搜索 */
    int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
      // 若已选完所有物品或背包无剩余容量，则返回价值 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // 若超过背包容量，则只能选择不放入背包
      if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
      }
      // 计算不放入和放入物品 i 的最大价值
      int no = knapsackDFS(wgt, val, i - 1, c);
      int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 返回两种方案中价值更大的那一个
      return max(no, yes);
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：暴力搜索 */
    fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        let no = knapsack_dfs(wgt, val, i - 1, c);
        let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        std::cmp::max(no, yes)
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：暴力搜索 */
    int knapsackDFS(int wgt[], int val[], int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return myMax(no, yes);
    }
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：暴力搜索
    fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 or c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        var no = knapsackDFS(wgt, val, i - 1, c);
        var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return @max(no, yes);
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20i%3A%20int,%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E6%9A%B4%E5%8A%9B%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%80%89%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%E4%BB%B7%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E5%8F%AA%E8%83%BD%E9%80%89%E6%8B%A9%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E4%BB%B7%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B8%AD%E4%BB%B7%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E4%B8%AA%0A%20%20%20%20return%20max%28no,%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E6%9A%B4%E5%8A%9B%E6%90%9C%E7%B4%A2%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt,%20val,%20n,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20i%3A%20int,%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E6%9A%B4%E5%8A%9B%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%80%89%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%E4%BB%B7%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E5%8F%AA%E8%83%BD%E9%80%89%E6%8B%A9%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E4%BB%B7%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt,%20val,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B8%AD%E4%BB%B7%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E4%B8%AA%0A%20%20%20%20return%20max%28no,%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E6%9A%B4%E5%8A%9B%E6%90%9C%E7%B4%A2%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt,%20val,%20n,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>

如图 14-18 所示，由于每个物品都会产生不选和选两条搜索分支，因此时间复杂度为 $O(2^n)$ 。

观察递归树，容易发现其中存在重叠子问题，例如 $dp[1, 10]$ 等。而当物品较多、背包容量较大，尤其是相同重量的物品较多时，重叠子问题的数量将会大幅增多。

![0-1 背包问题的暴力搜索递归树](knapsack_problem.assets/knapsack_dfs.png){ class="animation-figure" }

<p align="center"> 图 14-18 &nbsp; 0-1 背包问题的暴力搜索递归树 </p>

### 2. &nbsp; 方法二：记忆化搜索

为了保证重叠子问题只被计算一次，我们借助记忆列表 `mem` 来记录子问题的解，其中 `mem[i][c]` 对应 $dp[i, c]$ 。

引入记忆化之后，**时间复杂度取决于子问题数量**，也就是 $O(n \times cap)$ 。实现代码如下：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs_mem(
        wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
    ) -> int:
        """0-1 背包：记忆化搜索"""
        # 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 or c == 0:
            return 0
        # 若已有记录，则直接返回
        if mem[i][c] != -1:
            return mem[i][c]
        # 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c:
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        # 计算不放入和放入物品 i 的最大价值
        no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 记录并返回两种方案中价值更大的那一个
        mem[i][c] = max(no, yes)
        return mem[i][c]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：记忆化搜索 */
    int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = max(no, yes);
        return mem[i][c];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：记忆化搜索 */
    int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：记忆化搜索 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：记忆化搜索 */
    func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若已有记录，则直接返回
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i-1] > c {
            return knapsackDFSMem(wgt, val, mem, i-1, c)
        }
        // 计算不放入和放入物品 i 的最大价值
        no := knapsackDFSMem(wgt, val, mem, i-1, c)
        yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
        // 返回两种方案中价值更大的那一个
        mem[i][c] = int(math.Max(float64(no), float64(yes)))
        return mem[i][c]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：记忆化搜索 */
    func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若已有记录，则直接返回
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c {
            return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        }
        // 计算不放入和放入物品 i 的最大价值
        let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：记忆化搜索 */
    function knapsackDFSMem(wgt, val, mem, i, c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：记忆化搜索 */
    function knapsackDFSMem(
        wgt: Array<number>,
        val: Array<number>,
        mem: Array<Array<number>>,
        i: number,
        c: number
    ): number {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：记忆化搜索 */
    int knapsackDFSMem(
      List<int> wgt,
      List<int> val,
      List<List<int>> mem,
      int i,
      int c,
    ) {
      // 若已选完所有物品或背包无剩余容量，则返回价值 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // 若已有记录，则直接返回
      if (mem[i][c] != -1) {
        return mem[i][c];
      }
      // 若超过背包容量，则只能选择不放入背包
      if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
      }
      // 计算不放入和放入物品 i 的最大价值
      int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
      int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 记录并返回两种方案中价值更大的那一个
      mem[i][c] = max(no, yes);
      return mem[i][c];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：记忆化搜索 */
    fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if i == 0 || c == 0 {
            return 0;
        }
        // 若已有记录，则直接返回
        if mem[i][c] != -1 {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = std::cmp::max(no, yes);
        mem[i][c]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：记忆化搜索 */
    int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = myMax(no, yes);
        return mem[i][c];
    }
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：记忆化搜索
    fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
        // 若已选完所有物品或背包无剩余容量，则返回价值 0
        if (i == 0 or c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能选择不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = @max(no, yes);
        return mem[i][c];
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%80%89%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%E4%BB%B7%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E6%9C%89%E8%AE%B0%E5%BD%95%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20!%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E5%8F%AA%E8%83%BD%E9%80%89%E6%8B%A9%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E4%BB%B7%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%AE%B0%E5%BD%95%E5%B9%B6%E8%BF%94%E5%9B%9E%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B8%AD%E4%BB%B7%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E4%B8%AA%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no,%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20n,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%80%89%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E6%97%A0%E5%89%A9%E4%BD%99%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E8%BF%94%E5%9B%9E%E4%BB%B7%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E6%9C%89%E8%AE%B0%E5%BD%95%EF%BC%8C%E5%88%99%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20!%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E5%8F%AA%E8%83%BD%E9%80%89%E6%8B%A9%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E4%BB%B7%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20i%20-%201,%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%AE%B0%E5%BD%95%E5%B9%B6%E8%BF%94%E5%9B%9E%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B8%AD%E4%BB%B7%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E4%B8%AA%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no,%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%AE%B0%E5%BF%86%E5%8C%96%E6%90%9C%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt,%20val,%20mem,%20n,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>

图 14-19 展示了在记忆化搜索中被剪掉的搜索分支。

![0-1 背包问题的记忆化搜索递归树](knapsack_problem.assets/knapsack_dfs_mem.png){ class="animation-figure" }

<p align="center"> 图 14-19 &nbsp; 0-1 背包问题的记忆化搜索递归树 </p>

### 3. &nbsp; 方法三：动态规划

动态规划实质上就是在状态转移中填充 $dp$ 表的过程，代码如下所示：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 背包：动态规划"""
        n = len(wgt)
        # 初始化 dp 表
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 状态转移
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c]
                else:
                    # 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：动态规划 */
    int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // 初始化 dp 表
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：动态规划 */
    int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：动态规划 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：动态规划 */
    func knapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // 初始化 dp 表
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // 状态转移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i-1][c]
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：动态规划 */
    func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // 初始化 dp 表
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // 状态转移
        for i in stride(from: 1, through: n, by: 1) {
            for c in stride(from: 1, through: cap, by: 1) {
                if wgt[i - 1] > c {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：动态规划 */
    function knapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(n + 1)
            .fill(0)
            .map(() => Array(cap + 1).fill(0));
        // 状态转移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：动态规划 */
    function knapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 状态转移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = Math.max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：动态规划 */
    int knapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // 初始化 dp 表
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // 状态转移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // 若超过背包容量，则不选物品 i
            dp[i][c] = dp[i - 1][c];
          } else {
            // 不选和选物品 i 这两种方案的较大值
            dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：动态规划 */
    fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // 初始化 dp 表
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // 状态转移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[n][cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：动态规划 */
    int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // 初始化 dp 表
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // 释放内存
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：动态规划
    fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
        comptime var n = wgt.len;
        // 初始化 dp 表
        var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
        // 状态转移
        for (1..n + 1) |i| {
            for (1..cap + 1) |c| {
                if (wgt[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>

如图 14-20 所示，时间复杂度和空间复杂度都由数组 `dp` 大小决定，即 $O(n \times cap)$ 。

=== "<1>"
    ![0-1 背包问题的动态规划过程](knapsack_problem.assets/knapsack_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png){ class="animation-figure" }

<p align="center"> 图 14-20 &nbsp; 0-1 背包问题的动态规划过程 </p>

### 4. &nbsp; 空间优化

由于每个状态都只与其上一行的状态有关，因此我们可以使用两个数组滚动前进，将空间复杂度从 $O(n^2)$ 降至 $O(n)$ 。

进一步思考，我们能否仅用一个数组实现空间优化呢？观察可知，每个状态都是由正上方或左上方的格子转移过来的。假设只有一个数组，当开始遍历第 $i$ 行时，该数组存储的仍然是第 $i-1$ 行的状态。

- 如果采取正序遍历，那么遍历到 $dp[i, j]$ 时，左上方 $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ 值可能已经被覆盖，此时就无法得到正确的状态转移结果。
- 如果采取倒序遍历，则不会发生覆盖问题，状态转移可以正确进行。

图 14-21 展示了在单个数组下从第 $i = 1$ 行转换至第 $i = 2$ 行的过程。请思考正序遍历和倒序遍历的区别。

=== "<1>"
    ![0-1 背包的空间优化后的动态规划过程](knapsack_problem.assets/knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 图 14-21 &nbsp; 0-1 背包的空间优化后的动态规划过程 </p>

在代码实现中，我们仅需将数组 `dp` 的第一维 $i$ 直接删除，并且把内循环更改为倒序遍历即可：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 背包：空间优化后的动态规划"""
        n = len(wgt)
        # 初始化 dp 表
        dp = [0] * (cap + 1)
        # 状态转移
        for i in range(1, n + 1):
            # 倒序遍历
            for c in range(cap, 0, -1):
                if wgt[i - 1] > c:
                    # 若超过背包容量，则不选物品 i
                    dp[c] = dp[c]
                else:
                    # 不选和选物品 i 这两种方案的较大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：空间优化后的动态规划 */
    int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // 初始化 dp 表
        vector<int> dp(cap + 1, 0);
        // 状态转移
        for (int i = 1; i <= n; i++) {
            // 倒序遍历
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：空间优化后的动态规划 */
    int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            // 倒序遍历
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：空间优化后的动态规划 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            // 倒序遍历
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[c] = dp[c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：空间优化后的动态规划 */
    func knapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // 初始化 dp 表
        dp := make([]int, cap+1)
        // 状态转移
        for i := 1; i <= n; i++ {
            // 倒序遍历
            for c := cap; c >= 1; c-- {
                if wgt[i-1] <= c {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：空间优化后的动态规划 */
    func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // 初始化 dp 表
        var dp = Array(repeating: 0, count: cap + 1)
        // 状态转移
        for i in stride(from: 1, through: n, by: 1) {
            // 倒序遍历
            for c in stride(from: cap, through: 1, by: -1) {
                if wgt[i - 1] <= c {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：状态压缩后的动态规划 */
    function knapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(cap + 1).fill(0);
        // 状态转移
        for (let i = 1; i <= n; i++) {
            // 倒序遍历
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：状态压缩后的动态规划 */
    function knapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(cap + 1).fill(0);
        // 状态转移
        for (let i = 1; i <= n; i++) {
            // 倒序遍历
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：空间优化后的动态规划 */
    int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // 初始化 dp 表
      List<int> dp = List.filled(cap + 1, 0);
      // 状态转移
      for (int i = 1; i <= n; i++) {
        // 倒序遍历
        for (int c = cap; c >= 1; c--) {
          if (wgt[i - 1] <= c) {
            // 不选和选物品 i 这两种方案的较大值
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：空间优化后的动态规划 */
    fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // 初始化 dp 表
        let mut dp = vec![0; cap + 1];
        // 状态转移
        for i in 1..=n {
            // 倒序遍历
            for c in (1..=cap).rev() {
                if wgt[i - 1] <= c as i32 {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：空间优化后的动态规划 */
    int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // 初始化 dp 表
        int *dp = calloc(cap + 1, sizeof(int));
        // 状态转移
        for (int i = 1; i <= n; i++) {
            // 倒序遍历
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // 释放内存
        free(dp);
        return res;
    }
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：空间优化后的动态规划
    fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
        var n = wgt.len;
        // 初始化 dp 表
        var dp = [_]i32{0} ** (cap + 1);
        // 状态转移
        for (1..n + 1) |i| {
            // 倒序遍历
            var c = cap;
            while (c > 0) : (c -= 1) {
                if (wgt[i - 1] < c) {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

??? pythontutor "可视化运行"

    <div style="height: 560px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10,%2020,%2030,%2040,%2050%5D%0A%20%20%20%20val%20%3D%20%5B50,%20120,%20150,%20210,%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=470&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a>
