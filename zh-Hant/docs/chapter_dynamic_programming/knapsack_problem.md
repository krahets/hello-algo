---
comments: true
---

# 14.4 &nbsp; 0-1 背包問題

背包問題是一個非常好的動態規劃入門題目，是動態規劃中最常見的問題形式。其具有很多變種，例如 0-1 背包問題、完全背包問題、多重背包問題等。

在本節中，我們先來求解最常見的 0-1 背包問題。

!!! question

    給定 $n$ 個物品，第 $i$ 個物品的重量為 $wgt[i-1]$、價值為 $val[i-1]$ ，和一個容量為 $cap$ 的背包。每個物品只能選擇一次，問在限定背包容量下能放入物品的最大價值。

觀察圖 14-17 ，由於物品編號 $i$ 從 $1$ 開始計數，陣列索引從 $0$ 開始計數，因此物品 $i$ 對應重量 $wgt[i-1]$ 和價值 $val[i-1]$ 。

![0-1 背包的示例資料](knapsack_problem.assets/knapsack_example.png){ class="animation-figure" }

<p align="center"> 圖 14-17 &nbsp; 0-1 背包的示例資料 </p>

我們可以將 0-1 背包問題看作一個由 $n$ 輪決策組成的過程，對於每個物體都有不放入和放入兩種決策，因此該問題滿足決策樹模型。

該問題的目標是求解“在限定背包容量下能放入物品的最大價值”，因此較大機率是一個動態規劃問題。

**第一步：思考每輪的決策，定義狀態，從而得到 $dp$ 表**

對於每個物品來說，不放入背包，背包容量不變；放入背包，背包容量減小。由此可得狀態定義：當前物品編號 $i$ 和剩餘背包容量 $c$ ，記為 $[i, c]$ 。

狀態 $[i, c]$ 對應的子問題為：**前 $i$ 個物品在剩餘容量為 $c$ 的背包中的最大價值**，記為 $dp[i, c]$ 。

待求解的是 $dp[n, cap]$ ，因此需要一個尺寸為 $(n+1) \times (cap+1)$ 的二維 $dp$ 表。

**第二步：找出最優子結構，進而推導出狀態轉移方程**

當我們做出物品 $i$ 的決策後，剩餘的是前 $i-1$ 個物品的決策，可分為以下兩種情況。

- **不放入物品 $i$** ：背包容量不變，狀態變化為 $[i-1, c]$ 。
- **放入物品 $i$** ：背包容量減少 $wgt[i-1]$ ，價值增加 $val[i-1]$ ，狀態變化為 $[i-1, c-wgt[i-1]]$ 。

上述分析向我們揭示了本題的最優子結構：**最大價值 $dp[i, c]$ 等於不放入物品 $i$ 和放入物品 $i$ 兩種方案中價值更大的那一個**。由此可推導出狀態轉移方程：

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

需要注意的是，若當前物品重量 $wgt[i - 1]$ 超出剩餘背包容量 $c$ ，則只能選擇不放入背包。

**第三步：確定邊界條件和狀態轉移順序**

當無物品或無剩餘背包容量時最大價值為 $0$ ，即首列 $dp[i, 0]$ 和首行 $dp[0, c]$ 都等於 $0$ 。

當前狀態 $[i, c]$ 從上方的狀態 $[i-1, c]$ 和左上方的狀態 $[i-1, c-wgt[i-1]]$ 轉移而來，因此透過兩層迴圈正序走訪整個 $dp$ 表即可。

根據以上分析，我們接下來按順序實現暴力搜尋、記憶化搜尋、動態規劃解法。

### 1. &nbsp; 方法一：暴力搜尋

搜尋程式碼包含以下要素。

- **遞迴參數**：狀態 $[i, c]$ 。
- **返回值**：子問題的解 $dp[i, c]$ 。
- **終止條件**：當物品編號越界 $i = 0$ 或背包剩餘容量為 $0$ 時，終止遞迴並返回價值 $0$ 。
- **剪枝**：若當前物品重量超出背包剩餘容量，則只能選擇不放入背包。

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
        """0-1 背包：暴力搜尋"""
        # 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 or c == 0:
            return 0
        # 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c:
            return knapsack_dfs(wgt, val, i - 1, c)
        # 計算不放入和放入物品 i 的最大價值
        no = knapsack_dfs(wgt, val, i - 1, c)
        yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 返回兩種方案中價值更大的那一個
        return max(no, yes)
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：暴力搜尋 */
    int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return max(no, yes);
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：暴力搜尋 */
    int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return Math.max(no, yes);
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：暴力搜尋 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return Math.Max(no, yes);
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：暴力搜尋 */
    func knapsackDFS(wgt, val []int, i, c int) int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i-1] > c {
            return knapsackDFS(wgt, val, i-1, c)
        }
        // 計算不放入和放入物品 i 的最大價值
        no := knapsackDFS(wgt, val, i-1, c)
        yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
        // 返回兩種方案中價值更大的那一個
        return int(math.Max(float64(no), float64(yes)))
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：暴力搜尋 */
    func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c {
            return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        }
        // 計算不放入和放入物品 i 的最大價值
        let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
        let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 返回兩種方案中價值更大的那一個
        return max(no, yes)
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：暴力搜尋 */
    function knapsackDFS(wgt, val, i, c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return Math.max(no, yes);
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：暴力搜尋 */
    function knapsackDFS(
        wgt: Array<number>,
        val: Array<number>,
        i: number,
        c: number
    ): number {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        const no = knapsackDFS(wgt, val, i - 1, c);
        const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return Math.max(no, yes);
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：暴力搜尋 */
    int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
      // 若已選完所有物品或背包無剩餘容量，則返回價值 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // 若超過背包容量，則只能選擇不放入背包
      if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
      }
      // 計算不放入和放入物品 i 的最大價值
      int no = knapsackDFS(wgt, val, i - 1, c);
      int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 返回兩種方案中價值更大的那一個
      return max(no, yes);
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：暴力搜尋 */
    fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        let no = knapsack_dfs(wgt, val, i - 1, c);
        let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        std::cmp::max(no, yes)
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：暴力搜尋 */
    int knapsackDFS(int wgt[], int val[], int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return myMax(no, yes);
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 背包：暴力搜尋 */
    fun knapsackDFS(
        wgt: IntArray,
        _val: IntArray,
        i: Int,
        c: Int
    ): Int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, _val, i - 1, c)
        }
        // 計算不放入和放入物品 i 的最大價值
        val no = knapsackDFS(wgt, _val, i - 1, c)
        val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // 返回兩種方案中價值更大的那一個
        return max(no, yes)
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    [class]{}-[func]{knapsack_dfs}
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：暴力搜尋
    fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 or c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        var no = knapsackDFS(wgt, val, i - 1, c);
        var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return @max(no, yes);
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E6%9A%B4%E5%8A%9B%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%81%B8%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%E5%83%B9%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E5%8F%AA%E8%83%BD%E9%81%B8%E6%93%87%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%83%B9%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E4%B8%AD%E5%83%B9%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E5%80%8B%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E6%9A%B4%E5%8A%9B%E6%90%9C%E5%B0%8B%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20i%3A%20int%2C%20c%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E6%9A%B4%E5%8A%9B%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%81%B8%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%E5%83%B9%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E5%8F%AA%E8%83%BD%E9%81%B8%E6%93%87%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%83%B9%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E4%B8%AD%E5%83%B9%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E5%80%8B%0A%20%20%20%20return%20max%28no%2C%20yes%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E6%9A%B4%E5%8A%9B%E6%90%9C%E5%B0%8B%0A%20%20%20%20res%20%3D%20knapsack_dfs%28wgt%2C%20val%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

如圖 14-18 所示，由於每個物品都會產生不選和選兩條搜尋分支，因此時間複雜度為 $O(2^n)$ 。

觀察遞迴樹，容易發現其中存在重疊子問題，例如 $dp[1, 10]$ 等。而當物品較多、背包容量較大，尤其是相同重量的物品較多時，重疊子問題的數量將會大幅增多。

![0-1 背包問題的暴力搜尋遞迴樹](knapsack_problem.assets/knapsack_dfs.png){ class="animation-figure" }

<p align="center"> 圖 14-18 &nbsp; 0-1 背包問題的暴力搜尋遞迴樹 </p>

### 2. &nbsp; 方法二：記憶化搜尋

為了保證重疊子問題只被計算一次，我們藉助記憶串列 `mem` 來記錄子問題的解，其中 `mem[i][c]` 對應 $dp[i, c]$ 。

引入記憶化之後，**時間複雜度取決於子問題數量**，也就是 $O(n \times cap)$ 。實現程式碼如下：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dfs_mem(
        wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
    ) -> int:
        """0-1 背包：記憶化搜尋"""
        # 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 or c == 0:
            return 0
        # 若已有記錄，則直接返回
        if mem[i][c] != -1:
            return mem[i][c]
        # 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c:
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        # 計算不放入和放入物品 i 的最大價值
        no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
        yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
        # 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = max(no, yes)
        return mem[i][c]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：記憶化搜尋 */
    int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = max(no, yes);
        return mem[i][c];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：記憶化搜尋 */
    int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：記憶化搜尋 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：記憶化搜尋 */
    func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若已有記錄，則直接返回
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i-1] > c {
            return knapsackDFSMem(wgt, val, mem, i-1, c)
        }
        // 計算不放入和放入物品 i 的最大價值
        no := knapsackDFSMem(wgt, val, mem, i-1, c)
        yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
        // 返回兩種方案中價值更大的那一個
        mem[i][c] = int(math.Max(float64(no), float64(yes)))
        return mem[i][c]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：記憶化搜尋 */
    func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0
        }
        // 若已有記錄，則直接返回
        if mem[i][c] != -1 {
            return mem[i][c]
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c {
            return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        }
        // 計算不放入和放入物品 i 的最大價值
        let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
        let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：記憶化搜尋 */
    function knapsackDFSMem(wgt, val, mem, i, c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：記憶化搜尋 */
    function knapsackDFSMem(
        wgt: Array<number>,
        val: Array<number>,
        mem: Array<Array<number>>,
        i: number,
        c: number
    ): number {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i === 0 || c === 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] !== -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        const yes =
            knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：記憶化搜尋 */
    int knapsackDFSMem(
      List<int> wgt,
      List<int> val,
      List<List<int>> mem,
      int i,
      int c,
    ) {
      // 若已選完所有物品或背包無剩餘容量，則返回價值 0
      if (i == 0 || c == 0) {
        return 0;
      }
      // 若已有記錄，則直接返回
      if (mem[i][c] != -1) {
        return mem[i][c];
      }
      // 若超過背包容量，則只能選擇不放入背包
      if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
      }
      // 計算不放入和放入物品 i 的最大價值
      int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
      int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
      // 記錄並返回兩種方案中價值更大的那一個
      mem[i][c] = max(no, yes);
      return mem[i][c];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：記憶化搜尋 */
    fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if i == 0 || c == 0 {
            return 0;
        }
        // 若已有記錄，則直接返回
        if mem[i][c] != -1 {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if wgt[i - 1] > c as i32 {
            return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
        let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = std::cmp::max(no, yes);
        mem[i][c]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：記憶化搜尋 */
    int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = myMax(no, yes);
        return mem[i][c];
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 背包：記憶化搜尋 */
    fun knapsackDFSMem(
        wgt: IntArray,
        _val: IntArray,
        mem: Array<IntArray>,
        i: Int,
        c: Int
    ): Int {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c]
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, _val, mem, i - 1, c)
        }
        // 計算不放入和放入物品 i 的最大價值
        val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
        val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = max(no, yes)
        return mem[i][c]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    [class]{}-[func]{knapsack_dfs_mem}
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：記憶化搜尋
    fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 or c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = @max(no, yes);
        return mem[i][c];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%81%B8%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%E5%83%B9%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E6%9C%89%E8%A8%98%E9%8C%84%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E5%8F%AA%E8%83%BD%E9%81%B8%E6%93%87%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%83%B9%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%84%E4%B8%A6%E8%BF%94%E5%9B%9E%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E4%B8%AD%E5%83%B9%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E5%80%8B%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dfs_mem%28%0A%20%20%20%20wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20c%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%22%22%22%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E9%81%B8%E5%AE%8C%E6%89%80%E6%9C%89%E7%89%A9%E5%93%81%E6%88%96%E8%83%8C%E5%8C%85%E7%84%A1%E5%89%A9%E9%A4%98%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%E5%83%B9%E5%80%BC%200%0A%20%20%20%20if%20i%20%3D%3D%200%20or%20c%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%200%0A%20%20%20%20%23%20%E8%8B%A5%E5%B7%B2%E6%9C%89%E8%A8%98%E9%8C%84%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20if%20mem%5Bi%5D%5Bc%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E5%8F%AA%E8%83%BD%E9%81%B8%E6%93%87%E4%B8%8D%E6%94%BE%E5%85%A5%E8%83%8C%E5%8C%85%0A%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20return%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%8D%E6%94%BE%E5%85%A5%E5%92%8C%E6%94%BE%E5%85%A5%E7%89%A9%E5%93%81%20i%20%E7%9A%84%E6%9C%80%E5%A4%A7%E5%83%B9%E5%80%BC%0A%20%20%20%20no%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%29%0A%20%20%20%20yes%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20i%20-%201%2C%20c%20-%20wgt%5Bi%20-%201%5D%29%20%2B%20val%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%84%E4%B8%A6%E8%BF%94%E5%9B%9E%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E4%B8%AD%E5%83%B9%E5%80%BC%E6%9B%B4%E5%A4%A7%E7%9A%84%E9%82%A3%E4%B8%80%E5%80%8B%0A%20%20%20%20mem%5Bi%5D%5Bc%5D%20%3D%20max%28no%2C%20yes%29%0A%20%20%20%20return%20mem%5Bi%5D%5Bc%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E8%A8%98%E6%86%B6%E5%8C%96%E6%90%9C%E5%B0%8B%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20res%20%3D%20knapsack_dfs_mem%28wgt%2C%20val%2C%20mem%2C%20n%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=20&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 14-19 展示了在記憶化搜尋中被剪掉的搜尋分支。

![0-1 背包問題的記憶化搜尋遞迴樹](knapsack_problem.assets/knapsack_dfs_mem.png){ class="animation-figure" }

<p align="center"> 圖 14-19 &nbsp; 0-1 背包問題的記憶化搜尋遞迴樹 </p>

### 3. &nbsp; 方法三：動態規劃

動態規劃實質上就是在狀態轉移中填充 $dp$ 表的過程，程式碼如下所示：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 背包：動態規劃"""
        n = len(wgt)
        # 初始化 dp 表
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 狀態轉移
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c]
                else:
                    # 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：動態規劃 */
    int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // 初始化 dp 表
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：動態規劃 */
    int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：動態規劃 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：動態規劃 */
    func knapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // 初始化 dp 表
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // 狀態轉移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i-1][c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：動態規劃 */
    func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // 初始化 dp 表
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // 狀態轉移
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：動態規劃 */
    function knapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(n + 1)
            .fill(0)
            .map(() => Array(cap + 1).fill(0));
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
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
    /* 0-1 背包：動態規劃 */
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
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
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
    /* 0-1 背包：動態規劃 */
    int knapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // 初始化 dp 表
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // 若超過背包容量，則不選物品 i
            dp[i][c] = dp[i - 1][c];
          } else {
            // 不選和選物品 i 這兩種方案的較大值
            dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：動態規劃 */
    fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // 初始化 dp 表
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // 狀態轉移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = std::cmp::max(
                        dp[i - 1][c],
                        dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                    );
                }
            }
        }
        dp[n][cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：動態規劃 */
    int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // 初始化 dp 表
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // 釋放記憶體
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 背包：動態規劃 */
    fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // 初始化 dp 表
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // 狀態轉移
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    [class]{}-[func]{knapsack_dp}
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：動態規劃
    fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
        comptime var n = wgt.len;
        // 初始化 dp 表
        var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
        // 狀態轉移
        for (1..n + 1) |i| {
            for (1..cap + 1) |c| {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E4%B8%8D%E9%81%B8%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%81%B8%E5%92%8C%E9%81%B8%E7%89%A9%E5%93%81%20i%20%E9%80%99%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E7%9A%84%E8%BC%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281%2C%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E4%B8%8D%E9%81%B8%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%81%B8%E5%92%8C%E9%81%B8%E7%89%A9%E5%93%81%20i%20%E9%80%99%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E7%9A%84%E8%BC%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D%2C%20dp%5Bi%20-%201%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20knapsack_dp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

如圖 14-20 所示，時間複雜度和空間複雜度都由陣列 `dp` 大小決定，即 $O(n \times cap)$ 。

=== "<1>"
    ![0-1 背包問題的動態規劃過程](knapsack_problem.assets/knapsack_dp_step1.png){ class="animation-figure" }

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

<p align="center"> 圖 14-20 &nbsp; 0-1 背包問題的動態規劃過程 </p>

### 4. &nbsp; 空間最佳化

由於每個狀態都只與其上一行的狀態有關，因此我們可以使用兩個陣列滾動前進，將空間複雜度從 $O(n^2)$ 降至 $O(n)$ 。

進一步思考，我們能否僅用一個陣列實現空間最佳化呢？觀察可知，每個狀態都是由正上方或左上方的格子轉移過來的。假設只有一個陣列，當開始走訪第 $i$ 行時，該陣列儲存的仍然是第 $i-1$ 行的狀態。

- 如果採取正序走訪，那麼走訪到 $dp[i, j]$ 時，左上方 $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ 值可能已經被覆蓋，此時就無法得到正確的狀態轉移結果。
- 如果採取倒序走訪，則不會發生覆蓋問題，狀態轉移可以正確進行。

圖 14-21 展示了在單個陣列下從第 $i = 1$ 行轉換至第 $i = 2$ 行的過程。請思考正序走訪和倒序走訪的區別。

=== "<1>"
    ![0-1 背包的空間最佳化後的動態規劃過程](knapsack_problem.assets/knapsack_dp_comp_step1.png){ class="animation-figure" }

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

<p align="center"> 圖 14-21 &nbsp; 0-1 背包的空間最佳化後的動態規劃過程 </p>

在程式碼實現中，我們僅需將陣列 `dp` 的第一維 $i$ 直接刪除，並且把內迴圈更改為倒序走訪即可：

=== "Python"

    ```python title="knapsack.py"
    def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """0-1 背包：空間最佳化後的動態規劃"""
        n = len(wgt)
        # 初始化 dp 表
        dp = [0] * (cap + 1)
        # 狀態轉移
        for i in range(1, n + 1):
            # 倒序走訪
            for c in range(cap, 0, -1):
                if wgt[i - 1] > c:
                    # 若超過背包容量，則不選物品 i
                    dp[c] = dp[c]
                else:
                    # 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="knapsack.cpp"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // 初始化 dp 表
        vector<int> dp(cap + 1, 0);
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 倒序走訪
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="knapsack.java"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 倒序走訪
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="knapsack.cs"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 倒序走訪
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="knapsack.go"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    func knapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // 初始化 dp 表
        dp := make([]int, cap+1)
        // 狀態轉移
        for i := 1; i <= n; i++ {
            // 倒序走訪
            for c := cap; c >= 1; c-- {
                if wgt[i-1] <= c {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="knapsack.swift"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // 初始化 dp 表
        var dp = Array(repeating: 0, count: cap + 1)
        // 狀態轉移
        for i in 1 ... n {
            // 倒序走訪
            for c in (1 ... cap).reversed() {
                if wgt[i - 1] <= c {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="knapsack.js"
    /* 0-1 背包：狀態壓縮後的動態規劃 */
    function knapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(cap + 1).fill(0);
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            // 倒序走訪
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="knapsack.ts"
    /* 0-1 背包：狀態壓縮後的動態規劃 */
    function knapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array(cap + 1).fill(0);
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            // 倒序走訪
            for (let c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="knapsack.dart"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // 初始化 dp 表
      List<int> dp = List.filled(cap + 1, 0);
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        // 倒序走訪
        for (int c = cap; c >= 1; c--) {
          if (wgt[i - 1] <= c) {
            // 不選和選物品 i 這兩種方案的較大值
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="knapsack.rs"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // 初始化 dp 表
        let mut dp = vec![0; cap + 1];
        // 狀態轉移
        for i in 1..=n {
            // 倒序走訪
            for c in (1..=cap).rev() {
                if wgt[i - 1] <= c as i32 {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="knapsack.c"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // 初始化 dp 表
        int *dp = calloc(cap + 1, sizeof(int));
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 倒序走訪
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // 釋放記憶體
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="knapsack.kt"
    /* 0-1 背包：空間最佳化後的動態規劃 */
    fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // 初始化 dp 表
        val dp = IntArray(cap + 1)
        // 狀態轉移
        for (i in 1..n) {
            // 倒序走訪
            for (c in cap downTo 1) {
                if (wgt[i - 1] <= c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="knapsack.rb"
    [class]{}-[func]{knapsack_dp_comp}
    ```

=== "Zig"

    ```zig title="knapsack.zig"
    // 0-1 背包：空間最佳化後的動態規劃
    fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
        var n = wgt.len;
        // 初始化 dp 表
        var dp = [_]i32{0} ** (cap + 1);
        // 狀態轉移
        for (1..n + 1) |i| {
            // 倒序走訪
            var c = cap;
            while (c > 0) : (c -= 1) {
                if (wgt[i - 1] < c) {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E4%B8%8D%E9%81%B8%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%81%B8%E5%92%8C%E9%81%B8%E7%89%A9%E5%93%81%20i%20%E9%80%99%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E7%9A%84%E8%BC%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20knapsack_dp_comp%28wgt%3A%20list%5Bint%5D%2C%20val%3A%20list%5Bint%5D%2C%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%220-1%20%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%28cap%2C%200%2C%20-1%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%89%87%E4%B8%8D%E9%81%B8%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%81%B8%E5%92%8C%E9%81%B8%E7%89%A9%E5%93%81%20i%20%E9%80%99%E5%85%A9%E7%A8%AE%E6%96%B9%E6%A1%88%E7%9A%84%E8%BC%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D%2C%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B10%2C%2020%2C%2030%2C%2040%2C%2050%5D%0A%20%20%20%20val%20%3D%20%5B50%2C%20120%2C%20150%2C%20210%2C%20240%5D%0A%20%20%20%20cap%20%3D%2050%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20knapsack_dp_comp%28wgt%2C%20val%2C%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E9%81%8E%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E5%83%B9%E5%80%BC%E7%82%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=7&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
