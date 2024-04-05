---
comments: true
---

# 14.5 &nbsp; 完全背包問題

在本節中，我們先求解另一個常見的背包問題：完全背包，再瞭解它的一種特例：零錢兌換。

## 14.5.1 &nbsp; 完全背包問題

!!! question

    給定 $n$ 個物品，第 $i$ 個物品的重量為 $wgt[i-1]$、價值為 $val[i-1]$ ，和一個容量為 $cap$ 的背包。**每個物品可以重複選取**，問在限定背包容量下能放入物品的最大價值。示例如圖 14-22 所示。

![完全背包問題的示例資料](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> 圖 14-22 &nbsp; 完全背包問題的示例資料 </p>

### 1. &nbsp; 動態規劃思路

完全背包問題和 0-1 背包問題非常相似，**區別僅在於不限制物品的選擇次數**。

- 在 0-1 背包問題中，每種物品只有一個，因此將物品 $i$ 放入背包後，只能從前 $i-1$ 個物品中選擇。
- 在完全背包問題中，每種物品的數量是無限的，因此將物品 $i$ 放入背包後，**仍可以從前 $i$ 個物品中選擇**。

在完全背包問題的規定下，狀態 $[i, c]$ 的變化分為兩種情況。

- **不放入物品 $i$** ：與 0-1 背包問題相同，轉移至 $[i-1, c]$ 。
- **放入物品 $i$** ：與 0-1 背包問題不同，轉移至 $[i, c-wgt[i-1]]$ 。

從而狀態轉移方程變為：

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; 程式碼實現

對比兩道題目的程式碼，狀態轉移中有一處從 $i-1$ 變為 $i$ ，其餘完全一致：

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """完全背包：動態規劃"""
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
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 完全背包：動態規劃 */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
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
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 完全背包：動態規劃 */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
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
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 完全背包：動態規劃 */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 完全背包：動態規劃 */
    func unboundedKnapsackDP(wgt, val []int, cap int) int {
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
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 完全背包：動態規劃 */
    func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
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
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 完全背包：動態規劃 */
    function unboundedKnapsackDP(wgt, val, cap) {
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
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* 完全背包：動態規劃 */
    function unboundedKnapsackDP(
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
                        dp[i][c - wgt[i - 1]] + val[i - 1]
                    );
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* 完全背包：動態規劃 */
    int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
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
            dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 完全背包：動態規劃 */
    fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 完全背包：動態規劃 */
    int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
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
                    dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
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

    ```kotlin title="unbounded_knapsack.kt"
    /* 完全背包：動態規劃 */
    fun unboundedKnapsackDP(
        wgt: IntArray,
        value: IntArray,
        cap: Int
    ): Int {
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
                    dp[i][c] = max(dp[i - 1][c].toDouble(), (dp[i][c - wgt[i - 1]] + value[i - 1]).toDouble())
                        .toInt()
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp}
    ```

=== "Zig"

    ```zig title="unbounded_knapsack.zig"
    // 完全背包：動態規劃
    fn unboundedKnapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
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
                    dp[i][c] = @max(dp[i - 1][c], dp[i][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%8C%E5%85%A8%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%8C%E5%85%A8%E8%83%8C%E5%8C%85%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 空間最佳化

由於當前狀態是從左邊和上邊的狀態轉移而來的，**因此空間最佳化後應該對 $dp$ 表中的每一行進行正序走訪**。

這個走訪順序與 0-1 背包正好相反。請藉助圖 14-23 來理解兩者的區別。

=== "<1>"
    ![完全背包問題在空間最佳化後的動態規劃過程](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 圖 14-23 &nbsp; 完全背包問題在空間最佳化後的動態規劃過程 </p>

程式碼實現比較簡單，僅需將陣列 `dp` 的第一維刪除：

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """完全背包：空間最佳化後的動態規劃"""
        n = len(wgt)
        # 初始化 dp 表
        dp = [0] * (cap + 1)
        # 狀態轉移
        for i in range(1, n + 1):
            # 正序走訪
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # 若超過背包容量，則不選物品 i
                    dp[c] = dp[c]
                else:
                    # 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 完全背包：空間最佳化後的動態規劃 */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // 初始化 dp 表
        vector<int> dp(cap + 1, 0);
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 完全背包：空間最佳化後的動態規劃 */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 完全背包：空間最佳化後的動態規劃 */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 完全背包：空間最佳化後的動態規劃 */
    func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // 初始化 dp 表
        dp := make([]int, cap+1)
        // 狀態轉移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 完全背包：空間最佳化後的動態規劃 */
    func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // 初始化 dp 表
        var dp = Array(repeating: 0, count: cap + 1)
        // 狀態轉移
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 完全背包：狀態壓縮後的動態規劃 */
    function unboundedKnapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* 完全背包：狀態壓縮後的動態規劃 */
    function unboundedKnapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // 初始化 dp 表
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* 完全背包：空間最佳化後的動態規劃 */
    int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // 初始化 dp 表
      List<int> dp = List.filled(cap + 1, 0);
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // 若超過背包容量，則不選物品 i
            dp[c] = dp[c];
          } else {
            // 不選和選物品 i 這兩種方案的較大值
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 完全背包：空間最佳化後的動態規劃 */
    fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // 初始化 dp 表
        let mut dp = vec![0; cap + 1];
        // 狀態轉移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 完全背包：空間最佳化後的動態規劃 */
    int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // 初始化 dp 表
        int *dp = calloc(cap + 1, sizeof(int));
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
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

    ```kotlin title="unbounded_knapsack.kt"
    /* 完全背包：空間最佳化後的動態規劃 */
    fun unboundedKnapsackDPComp(
        wgt: IntArray,
        value: IntArray,
        cap: Int
    ): Int {
        val n = wgt.size
        // 初始化 dp 表
        val dp = IntArray(cap + 1)
        // 狀態轉移
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c]
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] =
                        max(dp[c].toDouble(), (dp[c - wgt[i - 1]] + value[i - 1]).toDouble()).toInt()
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp_comp}
    ```

=== "Zig"

    ```zig title="unbounded_knapsack.zig"
    // 完全背包：空間最佳化後的動態規劃
    fn unboundedKnapsackDPComp(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
        comptime var n = wgt.len;
        // 初始化 dp 表
        var dp = [_]i32{0} ** (cap + 1);
        // 狀態轉移
        for (1..n + 1) |i| {
            for (1..cap + 1) |c| {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%8C%E5%85%A8%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%AE%8C%E5%85%A8%E8%83%8C%E5%8C%85%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%89%A9%E5%93%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%89%A9%E5%93%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%A4%A7%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E4%B8%8D%E8%B6%85%E8%BF%87%E8%83%8C%E5%8C%85%E5%AE%B9%E9%87%8F%E7%9A%84%E6%9C%80%E5%A4%A7%E7%89%A9%E5%93%81%E4%BB%B7%E5%80%BC%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 14.5.2 &nbsp; 零錢兌換問題

背包問題是一大類動態規劃問題的代表，其擁有很多變種，例如零錢兌換問題。

!!! question

    給定 $n$ 種硬幣，第 $i$ 種硬幣的面值為 $coins[i - 1]$ ，目標金額為 $amt$ ，**每種硬幣可以重複選取**，問能夠湊出目標金額的最少硬幣數量。如果無法湊出目標金額，則返回 $-1$ 。示例如圖 14-24 所示。

![零錢兌換問題的示例資料](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> 圖 14-24 &nbsp; 零錢兌換問題的示例資料 </p>

### 1. &nbsp; 動態規劃思路

**零錢兌換可以看作完全背包問題的一種特殊情況**，兩者具有以下關聯與不同點。

- 兩道題可以相互轉換，“物品”對應“硬幣”、“物品重量”對應“硬幣面值”、“背包容量”對應“目標金額”。
- 最佳化目標相反，完全背包問題是要最大化物品價值，零錢兌換問題是要最小化硬幣數量。
- 完全背包問題是求“不超過”背包容量下的解，零錢兌換是求“恰好”湊到目標金額的解。

**第一步：思考每輪的決策，定義狀態，從而得到 $dp$ 表**

狀態 $[i, a]$ 對應的子問題為：**前 $i$ 種硬幣能夠湊出金額 $a$ 的最少硬幣數量**，記為 $dp[i, a]$ 。

二維 $dp$ 表的尺寸為 $(n+1) \times (amt+1)$ 。

**第二步：找出最優子結構，進而推導出狀態轉移方程**

本題與完全背包問題的狀態轉移方程存在以下兩點差異。

- 本題要求最小值，因此需將運算子 $\max()$ 更改為 $\min()$ 。
- 最佳化主體是硬幣數量而非商品價值，因此在選中硬幣時執行 $+1$ 即可。

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**第三步：確定邊界條件和狀態轉移順序**

當目標金額為 $0$ 時，湊出它的最少硬幣數量為 $0$ ，即首列所有 $dp[i, 0]$ 都等於 $0$ 。

當無硬幣時，**無法湊出任意 $> 0$ 的目標金額**，即是無效解。為使狀態轉移方程中的 $\min()$ 函式能夠識別並過濾無效解，我們考慮使用 $+ \infty$ 來表示它們，即令首行所有 $dp[0, a]$ 都等於 $+ \infty$ 。

### 2. &nbsp; 程式碼實現

大多數程式語言並未提供 $+ \infty$ 變數，只能使用整型 `int` 的最大值來代替。而這又會導致大數越界：狀態轉移方程中的 $+ 1$ 操作可能發生溢位。

為此，我們採用數字 $amt + 1$ 來表示無效解，因為湊出 $amt$ 的硬幣數量最多為 $amt$ 。最後返回前，判斷 $dp[n, amt]$ 是否等於 $amt + 1$ ，若是則返回 $-1$ ，代表無法湊出目標金額。程式碼如下所示：

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """零錢兌換：動態規劃"""
        n = len(coins)
        MAX = amt + 1
        # 初始化 dp 表
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 狀態轉移：首行首列
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # 狀態轉移：其餘行和列
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 零錢兌換：動態規劃 */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // 初始化 dp 表
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 狀態轉移：首行首列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 零錢兌換：動態規劃 */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][amt + 1];
        // 狀態轉移：首行首列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 零錢兌換：動態規劃 */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, amt + 1];
        // 狀態轉移：首行首列
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 零錢兌換：動態規劃 */
    func coinChangeDP(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // 初始化 dp 表
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 狀態轉移：首行首列
        for a := 1; a <= amt; a++ {
            dp[0][a] = max
        }
        // 狀態轉移：其餘行和列
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* 零錢兌換：動態規劃 */
    func coinChangeDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // 初始化 dp 表
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 狀態轉移：首行首列
        for a in 1 ... amt {
            dp[0][a] = MAX
        }
        // 狀態轉移：其餘行和列
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 零錢兌換：動態規劃 */
    function coinChangeDP(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // 初始化 dp 表
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 狀態轉移：首行首列
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 零錢兌換：動態規劃 */
    function coinChangeDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // 初始化 dp 表
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 狀態轉移：首行首列
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 零錢兌換：動態規劃 */
    int coinChangeDP(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // 初始化 dp 表
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 狀態轉移：首行首列
      for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
      }
      // 狀態轉移：其餘行和列
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 若超過目標金額，則不選硬幣 i
            dp[i][a] = dp[i - 1][a];
          } else {
            // 不選和選硬幣 i 這兩種方案的較小值
            dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 零錢兌換：動態規劃 */
    fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // 初始化 dp 表
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 狀態轉移：首行首列
        for a in 1..=amt {
            dp[0][a] = max;
        }
        // 狀態轉移：其餘行和列
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[n][amt] != max {
            return dp[n][amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* 零錢兌換：動態規劃 */
    int coinChangeDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // 初始化 dp 表
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 狀態轉移：首行首列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
        // 釋放記憶體
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 零錢兌換：動態規劃 */
    fun coinChangeDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // 初始化 dp 表
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 狀態轉移：首行首列
        for (a in 1..amt) {
            dp[0][a] = MAX
        }
        // 狀態轉移：其餘行和列
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = min(dp[i - 1][a].toDouble(), (dp[i][a - coins[i - 1]] + 1).toDouble())
                        .toInt()
                }
            }
        }
        return if (dp[n][amt] != MAX) dp[n][amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp}
    ```

=== "Zig"

    ```zig title="coin_change.zig"
    // 零錢兌換：動態規劃
    fn coinChangeDP(comptime coins: []i32, comptime amt: usize) i32 {
        comptime var n = coins.len;
        comptime var max = amt + 1;
        // 初始化 dp 表
        var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
        // 狀態轉移：首行首列
        for (1..amt + 1) |a| {
            dp[0][a] = max;
        }
        // 狀態轉移：其餘行和列
        for (1..n + 1) |i| {
            for (1..amt + 1) |a| {
                if (coins[i - 1] > @as(i32, @intCast(a))) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = @min(dp[i - 1][a], dp[i][a - @as(usize, @intCast(coins[i - 1]))] + 1);
                }
            }
        }
        if (dp[n][amt] != max) {
            return @intCast(dp[n][amt]);
        } else {
            return -1;
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%E9%A6%96%E5%88%97%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E5%85%B6%E4%BD%99%E8%A1%8C%E5%92%8C%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%B0%8F%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20!%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%88%B0%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E6%89%80%E9%9C%80%E7%9A%84%E6%9C%80%E5%B0%91%E7%A1%AC%E5%B8%81%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%E9%A6%96%E5%88%97%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%EF%BC%9A%E5%85%B6%E4%BD%99%E8%A1%8C%E5%92%8C%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%B0%8F%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20!%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%88%B0%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E6%89%80%E9%9C%80%E7%9A%84%E6%9C%80%E5%B0%91%E7%A1%AC%E5%B8%81%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 14-25 展示了零錢兌換的動態規劃過程，和完全背包問題非常相似。

=== "<1>"
    ![零錢兌換問題的動態規劃過程](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> 圖 14-25 &nbsp; 零錢兌換問題的動態規劃過程 </p>

### 3. &nbsp; 空間最佳化

零錢兌換的空間最佳化的處理方式和完全背包問題一致：

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """零錢兌換：空間最佳化後的動態規劃"""
        n = len(coins)
        MAX = amt + 1
        # 初始化 dp 表
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # 狀態轉移
        for i in range(1, n + 1):
            # 正序走訪
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                else:
                    # 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // 初始化 dp 表
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 零錢兌換：動態規劃 */
    func coinChangeDPComp(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // 初始化 dp 表
        dp := make([]int, amt+1)
        for i := 1; i <= amt; i++ {
            dp[i] = max
        }
        // 狀態轉移
        for i := 1; i <= n; i++ {
            // 倒序走訪
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
                }
            }
        }
        if dp[amt] != max {
            return dp[amt]
        }
        return -1
    }
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // 初始化 dp 表
        var dp = Array(repeating: MAX, count: amt + 1)
        dp[0] = 0
        // 狀態轉移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 零錢兌換：狀態壓縮後的動態規劃 */
    function coinChangeDPComp(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // 初始化 dp 表
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 零錢兌換：狀態壓縮後的動態規劃 */
    function coinChangeDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // 初始化 dp 表
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    int coinChangeDPComp(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // 初始化 dp 表
      List<int> dp = List.filled(amt + 1, MAX);
      dp[0] = 0;
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 若超過目標金額，則不選硬幣 i
            dp[a] = dp[a];
          } else {
            // 不選和選硬幣 i 這兩種方案的較小值
            dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // 初始化 dp 表
        let mut dp = vec![0; amt + 1];
        dp.fill(max);
        dp[0] = 0;
        // 狀態轉移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
                }
            }
        }
        if dp[amt] != max {
            return dp[amt] as i32;
        } else {
            -1
        }
    }
    ```

=== "C"

    ```c title="coin_change.c"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    int coinChangeDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // 初始化 dp 表
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 0;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[amt] != MAX ? dp[amt] : -1;
        // 釋放記憶體
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 零錢兌換：空間最佳化後的動態規劃 */
    fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // 初始化 dp 表
        val dp = IntArray(amt + 1)
        Arrays.fill(dp, MAX)
        dp[0] = 0
        // 狀態轉移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = min(dp[a].toDouble(), (dp[a - coins[i - 1]] + 1).toDouble()).toInt()
                }
            }
        }
        return if (dp[amt] != MAX) dp[amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp_comp}
    ```

=== "Zig"

    ```zig title="coin_change.zig"
    // 零錢兌換：空間最佳化後的動態規劃
    fn coinChangeDPComp(comptime coins: []i32, comptime amt: usize) i32 {
        comptime var n = coins.len;
        comptime var max = amt + 1;
        // 初始化 dp 表
        var dp = [_]i32{0} ** (amt + 1);
        @memset(&dp, max);
        dp[0] = 0;
        // 狀態轉移
        for (1..n + 1) |i| {
            for (1..amt + 1) |a| {
                if (coins[i - 1] > @as(i32, @intCast(a))) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = @min(dp[a], dp[a - @as(usize, @intCast(coins[i - 1]))] + 1);
                }
            }
        }
        if (dp[amt] != max) {
            return @intCast(dp[amt]);
        } else {
            return -1;
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20*%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%B0%8F%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20!%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%88%B0%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E6%89%80%E9%9C%80%E7%9A%84%E6%9C%80%E5%B0%91%E7%A1%AC%E5%B8%81%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20*%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E7%9A%84%E8%BE%83%E5%B0%8F%E5%80%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20!%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%88%B0%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E6%89%80%E9%9C%80%E7%9A%84%E6%9C%80%E5%B0%91%E7%A1%AC%E5%B8%81%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 14.5.3 &nbsp; 零錢兌換問題 II

!!! question

    給定 $n$ 種硬幣，第 $i$ 種硬幣的面值為 $coins[i - 1]$ ，目標金額為 $amt$ ，每種硬幣可以重複選取，**問湊出目標金額的硬幣組合數量**。示例如圖 14-26 所示。

![零錢兌換問題 II 的示例資料](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> 圖 14-26 &nbsp; 零錢兌換問題 II 的示例資料 </p>

### 1. &nbsp; 動態規劃思路

相比於上一題，本題目標是求組合數量，因此子問題變為：**前 $i$ 種硬幣能夠湊出金額 $a$ 的組合數量**。而 $dp$ 表仍然是尺寸為 $(n+1) \times (amt + 1)$ 的二維矩陣。

當前狀態的組合數量等於不選當前硬幣與選當前硬幣這兩種決策的組合數量之和。狀態轉移方程為：

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

當目標金額為 $0$ 時，無須選擇任何硬幣即可湊出目標金額，因此應將首列所有 $dp[i, 0]$ 都初始化為 $1$ 。當無硬幣時，無法湊出任何 $>0$ 的目標金額，因此首行所有 $dp[0, a]$ 都等於 $0$ 。

### 2. &nbsp; 程式碼實現

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """零錢兌換 II：動態規劃"""
        n = len(coins)
        # 初始化 dp 表
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 初始化首列
        for i in range(n + 1):
            dp[i][0] = 1
        # 狀態轉移
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 零錢兌換 II：動態規劃 */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // 初始化 dp 表
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 零錢兌換 II：動態規劃 */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][amt + 1];
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 零錢兌換 II：動態規劃 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, amt + 1];
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 零錢兌換 II：動態規劃 */
    func coinChangeIIDP(coins []int, amt int) int {
        n := len(coins)
        // 初始化 dp 表
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 初始化首列
        for i := 0; i <= n; i++ {
            dp[i][0] = 1
        }
        // 狀態轉移：其餘行和列
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 零錢兌換 II：動態規劃 */
    func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // 初始化 dp 表
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 初始化首列
        for i in 0 ... n {
            dp[i][0] = 1
        }
        // 狀態轉移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 零錢兌換 II：動態規劃 */
    function coinChangeIIDP(coins, amt) {
        const n = coins.length;
        // 初始化 dp 表
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 初始化首列
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 零錢兌換 II：動態規劃 */
    function coinChangeIIDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // 初始化 dp 表
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 初始化首列
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 零錢兌換 II：動態規劃 */
    int coinChangeIIDP(List<int> coins, int amt) {
      int n = coins.length;
      // 初始化 dp 表
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 初始化首列
      for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
      }
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 若超過目標金額，則不選硬幣 i
            dp[i][a] = dp[i - 1][a];
          } else {
            // 不選和選硬幣 i 這兩種方案之和
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
          }
        }
      }
      return dp[n][amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 零錢兌換 II：動態規劃 */
    fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // 初始化 dp 表
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 初始化首列
        for i in 0..=n {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
                }
            }
        }
        dp[n][amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 零錢兌換 II：動態規劃 */
    int coinChangeIIDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // 初始化 dp 表
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 初始化首列
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        int res = dp[n][amt];
        // 釋放記憶體
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 零錢兌換 II：動態規劃 */
    fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // 初始化 dp 表
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 初始化首列
        for (i in 0..n) {
            dp[i][0] = 1
        }
        // 狀態轉移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp}
    ```

=== "Zig"

    ```zig title="coin_change_ii.zig"
    // 零錢兌換 II：動態規劃
    fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
        comptime var n = coins.len;
        // 初始化 dp 表
        var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
        // 初始化首列
        for (0..n + 1) |i| {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (1..n + 1) |i| {
            for (1..amt + 1) |a| {
                if (coins[i - 1] > @as(i32, @intCast(a))) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
                }
            }
        }
        return dp[n][amt];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%20II%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%A6%96%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B9%8B%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%87%BA%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E7%9A%84%E7%A1%AC%E5%B8%81%E7%BB%84%E5%90%88%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%20II%EF%BC%9A%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20*%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%A6%96%E5%88%97%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B9%8B%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%87%BA%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E7%9A%84%E7%A1%AC%E5%B8%81%E7%BB%84%E5%90%88%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 3. &nbsp; 空間最佳化

空間最佳化處理方式相同，刪除硬幣維度即可：

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """零錢兌換 II：空間最佳化後的動態規劃"""
        n = len(coins)
        # 初始化 dp 表
        dp = [0] * (amt + 1)
        dp[0] = 1
        # 狀態轉移
        for i in range(1, n + 1):
            # 正序走訪
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                else:
                    # 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // 初始化 dp 表
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    func coinChangeIIDPComp(coins []int, amt int) int {
        n := len(coins)
        // 初始化 dp 表
        dp := make([]int, amt+1)
        dp[0] = 1
        // 狀態轉移
        for i := 1; i <= n; i++ {
            // 倒序走訪
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a-coins[i-1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // 初始化 dp 表
        var dp = Array(repeating: 0, count: amt + 1)
        dp[0] = 1
        // 狀態轉移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 零錢兌換 II：狀態壓縮後的動態規劃 */
    function coinChangeIIDPComp(coins, amt) {
        const n = coins.length;
        // 初始化 dp 表
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 零錢兌換 II：狀態壓縮後的動態規劃 */
    function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // 初始化 dp 表
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 狀態轉移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int coinChangeIIDPComp(List<int> coins, int amt) {
      int n = coins.length;
      // 初始化 dp 表
      List<int> dp = List.filled(amt + 1, 0);
      dp[0] = 1;
      // 狀態轉移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 若超過目標金額，則不選硬幣 i
            dp[a] = dp[a];
          } else {
            // 不選和選硬幣 i 這兩種方案之和
            dp[a] = dp[a] + dp[a - coins[i - 1]];
          }
        }
      }
      return dp[amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // 初始化 dp 表
        let mut dp = vec![0; amt + 1];
        dp[0] = 1;
        // 狀態轉移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
                }
            }
        }
        dp[amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // 初始化 dp 表
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        int res = dp[amt];
        // 釋放記憶體
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // 初始化 dp 表
        val dp = IntArray(amt + 1)
        dp[0] = 1
        // 狀態轉移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a]
                } else {
                    // 不選和選硬幣 i 這兩種方案之和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp_comp}
    ```

=== "Zig"

    ```zig title="coin_change_ii.zig"
    // 零錢兌換 II：空間最佳化後的動態規劃
    fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
        comptime var n = coins.len;
        // 初始化 dp 表
        var dp = [_]i32{0} ** (amt + 1);
        dp[0] = 1;
        // 狀態轉移
        for (1..n + 1) |i| {
            for (1..amt + 1) |a| {
                if (coins[i - 1] > @as(i32, @intCast(a))) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = dp[a] + dp[a - @as(usize, @intCast(coins[i - 1]))];
                }
            }
        }
        return dp[amt];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%20II%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B9%8B%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%87%BA%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E7%9A%84%E7%A1%AC%E5%B8%81%E7%BB%84%E5%90%88%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9B%B6%E9%92%B1%E5%85%91%E6%8D%A2%20II%EF%BC%9A%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20dp%20%E8%A1%A8%0A%20%20%20%20dp%20%3D%20%5B0%5D%20*%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%80%81%E8%BD%AC%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E6%AD%A3%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E8%B6%85%E8%BF%87%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%EF%BC%8C%E5%88%99%E4%B8%8D%E9%80%89%E7%A1%AC%E5%B8%81%20i%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%8D%E9%80%89%E5%92%8C%E9%80%89%E7%A1%AC%E5%B8%81%20i%20%E8%BF%99%E4%B8%A4%E7%A7%8D%E6%96%B9%E6%A1%88%E4%B9%8B%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%97%B4%E4%BC%98%E5%8C%96%E5%90%8E%E7%9A%84%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E5%87%91%E5%87%BA%E7%9B%AE%E6%A0%87%E9%87%91%E9%A2%9D%E7%9A%84%E7%A1%AC%E5%B8%81%E7%BB%84%E5%90%88%E6%95%B0%E9%87%8F%E4%B8%BA%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
