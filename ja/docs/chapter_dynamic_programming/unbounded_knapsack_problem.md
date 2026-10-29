---
comments: true
---

# 14.5 &nbsp; 個数制限なしナップサック問題

この節では、もう一つの代表的なナップサック問題である、個数制限なしナップサック問題を解きます。その後、その特殊な場合である硬貨の両替問題を学びます。

## 14.5.1 &nbsp; 個数制限なしナップサック問題

!!! question "問題"

    $n$ 個の品物があり、$i$ 番目の重さは $wgt[i-1]$、価値は $val[i-1]$ です。容量 $cap$ のナップサックがあり、**各品物は繰り返し選べます**。容量の制限内で入れられる品物の最大価値を求めてください。例を図 14-22 に示します。

![個数制限なしナップサック問題のデータ例](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> 図 14-22 &nbsp; 個数制限なしナップサック問題のデータ例 </p>

### 1. &nbsp; 動的計画法の考え方

個数制限なしナップサック問題は 0-1 ナップサック問題によく似ており、**違いは品物を選ぶ回数に制限がないことだけです**。

- 0-1 ナップサック問題では各品物が 1 個しかないため、品物 $i$ を入れた後は、最初の $i-1$ 個からしか選べません。
- 個数制限なしナップサック問題では各種類の品物が無限にあるため、品物 $i$ を入れた後も、**最初の $i$ 個から選べます**。

個数制限なしの場合、状態 $[i, c]$ の変化は次の二つに分かれます。

- **品物 $i$ を入れない**：0-1 ナップサック問題と同様に、$[i-1, c]$ に移ります。
- **品物 $i$ を入れる**：0-1 ナップサック問題とは異なり、$[i, c-wgt[i-1]]$ に移ります。

したがって、状態遷移式は次のようになります。

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; コードの実装

二つの問題のコードを比べると、状態遷移の 1 か所が $i-1$ から $i$ に変わるだけで、ほかはまったく同じです。

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """個数制限なしナップサック問題：動的計画法"""
        n = len(wgt)
        # dp テーブルを初期化する
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 状態遷移
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c]
                else:
                    # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 個数制限なしナップサック問題：動的計画法 */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp テーブルを初期化する
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 個数制限なしナップサック問題：動的計画法 */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化する
        int[][] dp = new int[n + 1][cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 個数制限なしナップサック問題：動的計画法 */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp テーブルを初期化する
        int[,] dp = new int[n + 1, cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 個数制限なしナップサック問題：動的計画法 */
    func unboundedKnapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp テーブルを初期化する
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // 状態遷移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i-1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 個数制限なしナップサック問題：動的計画法 */
    func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp テーブルを初期化する
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // 状態遷移
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 個数制限なしナップサック問題：動的計画法 */
    function unboundedKnapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
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
    /* 個数制限なしナップサック問題：動的計画法 */
    function unboundedKnapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
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
    /* 個数制限なしナップサック問題：動的計画法 */
    int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp テーブルを初期化する
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // ナップサックの容量を超える場合、品物 i を選ばない
            dp[i][c] = dp[i - 1][c];
          } else {
            // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
            dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 個数制限なしナップサック問題：動的計画法 */
    fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp テーブルを初期化する
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // 状態遷移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 個数制限なしナップサック問題：動的計画法 */
    int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp テーブルを初期化する
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // メモリを解放する
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* 個数制限なしナップサック問題：動的計画法 */
    fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // dp テーブルを初期化する
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // 状態遷移
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### 個数制限なしナップサック問題：動的計画法 ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # dp テーブルを初期化する
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # 状態遷移
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # ナップサックの容量を超える場合、品物 i を選ばない
            dp[i][c] = dp[i - 1][c]
          else
            # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%80%8B%E6%95%B0%E5%88%B6%E9%99%90%E3%81%AA%E3%81%97%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%95%8F%E9%A1%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E5%93%81%E7%89%A9%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%80%8B%E6%95%B0%E5%88%B6%E9%99%90%E3%81%AA%E3%81%97%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%95%8F%E9%A1%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E5%93%81%E7%89%A9%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 3. &nbsp; 空間の最適化

現在の状態は左と上の状態から遷移するため、**空間最適化後は $dp$ テーブルの各行を順方向に走査する必要があります**。

この順序は 0-1 ナップサック問題と逆です。図 14-23 で違いを確認してください。

=== "<1>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法：手順 2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法：手順 3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法：手順 4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法：手順 5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![空間最適化後の個数制限なしナップサック問題の動的計画法：手順 6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 図 14-23 &nbsp; 空間最適化後の個数制限なしナップサック問題の動的計画法 </p>

実装は簡単で、配列 `dp` の第 1 次元を取り除くだけです。

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """個数制限なしナップサック問題：空間を最適化した動的計画法"""
        n = len(wgt)
        # dp テーブルを初期化する
        dp = [0] * (cap + 1)
        # 状態遷移
        for i in range(1, n + 1):
            # 順方向に走査する
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c]
                else:
                    # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp テーブルを初期化する
        vector<int> dp(cap + 1, 0);
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp テーブルを初期化する
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp テーブルを初期化する
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp テーブルを初期化する
        dp := make([]int, cap+1)
        // 状態遷移
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp テーブルを初期化する
        var dp = Array(repeating: 0, count: cap + 1)
        // 状態遷移
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    function unboundedKnapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    function unboundedKnapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp テーブルを初期化する
      List<int> dp = List.filled(cap + 1, 0);
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // ナップサックの容量を超える場合、品物 i を選ばない
            dp[c] = dp[c];
          } else {
            // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp テーブルを初期化する
        let mut dp = vec![0; cap + 1];
        // 状態遷移
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp テーブルを初期化する
        int *dp = calloc(cap + 1, sizeof(int));
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c];
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
    fun unboundedKnapsackDPComp(
        wgt: IntArray,
        _val: IntArray,
        cap: Int
    ): Int {
        val n = wgt.size
        // dp テーブルを初期化する
        val dp = IntArray(cap + 1)
        // 状態遷移
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、品物 i を選ばない
                    dp[c] = dp[c]
                } else {
                    // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### 個数制限なしナップサック問題：動的計画法 ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # dp テーブルを初期化する
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # 状態遷移
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # ナップサックの容量を超える場合、品物 i を選ばない
            dp[i][c] = dp[i - 1][c]
          else
            # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end

    ### 個数制限なしナップサック問題：空間を最適化した動的計画法 ##3
    def unbounded_knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # dp テーブルを初期化する
      dp = Array.new(cap + 1, 0)
      # 状態遷移
      for i in 1...(n + 1)
        # 順方向に走査する
        for c in 1...(cap + 1)
          if wgt[i -1] > c
            # ナップサックの容量を超える場合、品物 i を選ばない
            dp[c] = dp[c]
          else
            # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%80%8B%E6%95%B0%E5%88%B6%E9%99%90%E3%81%AA%E3%81%97%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%95%8F%E9%A1%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E5%93%81%E7%89%A9%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%80%8B%E6%95%B0%E5%88%B6%E9%99%90%E3%81%AA%E3%81%97%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E5%95%8F%E9%A1%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%93%81%E7%89%A9%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%A4%A7%E3%81%8D%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%E3%83%8A%E3%83%83%E3%83%97%E3%82%B5%E3%83%83%E3%82%AF%E3%81%AE%E5%AE%B9%E9%87%8F%E3%82%92%E8%B6%85%E3%81%88%E3%81%AA%E3%81%84%E5%93%81%E7%89%A9%E3%81%AE%E6%9C%80%E5%A4%A7%E4%BE%A1%E5%80%A4%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 14.5.2 &nbsp; 硬貨の両替問題

ナップサック問題は、動的計画法の大きな一群を代表する問題であり、硬貨の両替問題など、多くの変種があります。

!!! question "問題"

    $n$ 種類の硬貨があり、$i$ 番目の額面は $coins[i - 1]$、目標金額は $amt$ です。**各種類の硬貨は繰り返し選べます**。目標金額を作るための硬貨の最小枚数を求めてください。作れない場合は $-1$ を返します。例を図 14-24 に示します。

![硬貨の両替問題のデータ例](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> 図 14-24 &nbsp; 硬貨の両替問題のデータ例 </p>

### 1. &nbsp; 動的計画法の考え方

**硬貨の両替は、個数制限なしナップサック問題の特殊な場合と捉えられます**。両者には次の対応と違いがあります。

- 二つの問題は互いに変換でき、「品物」が「硬貨」、「品物の重さ」が「硬貨の額面」、「ナップサックの容量」が「目標金額」に対応します。
- 最適化の目標は逆で、ナップサック問題では価値を最大にし、両替問題では硬貨の枚数を最小にします。
- ナップサック問題では容量を「超えない」解を求めますが、両替問題では目標金額に「ちょうど一致する」解を求めます。

**第 1 段階：各回の選択を考えて状態を定義し、$dp$ テーブルを作る**

状態 $[i, a]$ に対応する部分問題は、**最初の $i$ 種類の硬貨で金額 $a$ を作るための最小枚数**で、その解を $dp[i, a]$ とします。

二次元の $dp$ テーブルの大きさは $(n+1) \times (amt+1)$ です。

**第 2 段階：最適部分構造を見つけ、状態遷移式を導く**

この問題の状態遷移式は、個数制限なしナップサック問題と次の 2 点が異なります。

- 最小値を求めるので、演算子 $\max()$ を $\min()$ に変えます。
- 最適化するのは品物の価値ではなく硬貨の枚数なので、硬貨を選んだときは $+1$ します。

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**第 3 段階：境界条件と状態遷移の順序を決める**

目標金額が $0$ なら、必要な硬貨の最小枚数は $0$ です。したがって、先頭列の $dp[i, 0]$ はすべて $0$ です。

硬貨がなければ、**$> 0$ のどの目標金額も作れず**、無効な解になります。状態遷移式の $\min()$ が無効な解を識別して除外できるよう、$+ \infty$ で表します。つまり、先頭行の $dp[0, a]$ をすべて $+ \infty$ とします。

### 2. &nbsp; コードの実装

多くのプログラミング言語では $+ \infty$ を表す変数がなく、整数型 `int` の最大値で代用する必要があります。しかし、それでは状態遷移式の $+ 1$ でオーバーフローする可能性があります。

そこで、無効な解を $amt + 1$ で表します。金額 $amt$ を作るための硬貨の枚数は、最大でも $amt$ だからです。最後に $dp[n, amt]$ が $amt + 1$ かを調べ、そうなら目標金額を作れないことを示す $-1$ を返します。コードは次のとおりです。

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """硬貨の両替：動的計画法"""
        n = len(coins)
        MAX = amt + 1
        # dp テーブルを初期化する
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 状態遷移：先頭行と先頭列
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # 状態遷移：残りの行と列
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 硬貨の両替：動的計画法 */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // dp テーブルを初期化する
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 硬貨の両替：動的計画法 */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[][] dp = new int[n + 1][amt + 1];
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 硬貨の両替：動的計画法 */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[,] dp = new int[n + 1, amt + 1];
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 硬貨の両替：動的計画法 */
    func coinChangeDP(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // dp テーブルを初期化する
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 状態遷移：先頭行と先頭列
        for a := 1; a <= amt; a++ {
            dp[0][a] = max
        }
        // 状態遷移：残りの行と列
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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
    /* 硬貨の両替：動的計画法 */
    func coinChangeDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // dp テーブルを初期化する
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 状態遷移：先頭行と先頭列
        for a in 1 ... amt {
            dp[0][a] = MAX
        }
        // 状態遷移：残りの行と列
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 硬貨の両替：動的計画法 */
    function coinChangeDP(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 状態遷移：先頭行と先頭列
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 硬貨の両替：動的計画法 */
    function coinChangeDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 状態遷移：先頭行と先頭列
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 硬貨の両替：動的計画法 */
    int coinChangeDP(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // dp テーブルを初期化する
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 状態遷移：先頭行と先頭列
      for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
      }
      // 状態遷移：残りの行と列
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 目標金額を超える場合、硬貨 i を選ばない
            dp[i][a] = dp[i - 1][a];
          } else {
            // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
            dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 硬貨の両替：動的計画法 */
    fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // dp テーブルを初期化する
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 状態遷移：先頭行と先頭列
        for a in 1..=amt {
            dp[0][a] = max;
        }
        // 状態遷移：残りの行と列
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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
    /* 硬貨の両替：動的計画法 */
    int coinChangeDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 状態遷移：先頭行と先頭列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
        // メモリを解放する
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 硬貨の両替：動的計画法 */
    fun coinChangeDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // dp テーブルを初期化する
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 状態遷移：先頭行と先頭列
        for (a in 1..amt) {
            dp[0][a] = MAX
        }
        // 状態遷移：残りの行と列
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[n][amt] != MAX) dp[n][amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### 硬貨の両替：動的計画法 ###
    def coin_change_dp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # dp テーブルを初期化する
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # 状態遷移：先頭行と先頭列
      (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
      # 状態遷移：残りの行と列
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 目標金額を超える場合、硬貨 i を選ばない
            dp[i][a] = dp[i - 1][a]
          else
            # 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
            dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[n][amt] != _MAX ? dp[n][amt] : -1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%E3%81%A8%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%E3%81%A8%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-25 に、硬貨の両替を動的計画法で解く流れを示します。個数制限なしナップサック問題によく似ています。

=== "<1>"
    ![硬貨の両替問題を動的計画法で解く流れ](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![硬貨の両替問題を動的計画法で解く流れ：手順 15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> 図 14-25 &nbsp; 硬貨の両替問題を動的計画法で解く流れ </p>

### 3. &nbsp; 空間の最適化

硬貨の両替の空間最適化は、個数制限なしナップサック問題と同じ方法で行えます。

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """硬貨の両替：空間を最適化した動的計画法"""
        n = len(coins)
        MAX = amt + 1
        # dp テーブルを初期化する
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # 状態遷移
        for i in range(1, n + 1):
            # 順方向に走査する
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                else:
                    # 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // dp テーブルを初期化する
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 硬貨の両替：動的計画法 */
    func coinChangeDPComp(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // dp テーブルを初期化する
        dp := make([]int, amt+1)
        for i := 1; i <= amt; i++ {
            dp[i] = max
        }
        // 状態遷移
        for i := 1; i <= n; i++ {
            // 順方向に走査する
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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
    /* 硬貨の両替：空間を最適化した動的計画法 */
    func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // dp テーブルを初期化する
        var dp = Array(repeating: MAX, count: amt + 1)
        dp[0] = 0
        // 状態遷移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    function coinChangeDPComp(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // dp テーブルを初期化する
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    function coinChangeDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // dp テーブルを初期化する
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    int coinChangeDPComp(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // dp テーブルを初期化する
      List<int> dp = List.filled(amt + 1, MAX);
      dp[0] = 0;
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 目標金額を超える場合、硬貨 i を選ばない
            dp[a] = dp[a];
          } else {
            // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
            dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // dp テーブルを初期化する
        let mut dp = vec![0; amt + 1];
        dp.fill(max);
        dp[0] = 0;
        // 状態遷移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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
    /* 硬貨の両替：空間を最適化した動的計画法 */
    int coinChangeDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // dp テーブルを初期化する
        int *dp = malloc((amt + 1) * sizeof(int));
        for (int j = 1; j <= amt; j++) {
            dp[j] = MAX;
        } 
        dp[0] = 0;

        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[amt] != MAX ? dp[amt] : -1;
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 硬貨の両替：空間を最適化した動的計画法 */
    fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // dp テーブルを初期化する
        val dp = IntArray(amt + 1)
        dp.fill(MAX)
        dp[0] = 0
        // 状態遷移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[amt] != MAX) dp[amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### 硬貨の両替：空間を最適化した動的計画法 ###
    def coin_change_dp_comp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # dp テーブルを初期化する
      dp = Array.new(amt + 1, _MAX)
      dp[0] = 0
      # 状態遷移
      for i in 1...(n + 1)
        # 順方向に走査する
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 目標金額を超える場合、硬貨 i を選ばない
            dp[a] = dp[a]
          else
            # 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
            dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[amt] != _MAX ? dp[amt] : -1
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AB%E5%BF%85%E8%A6%81%E3%81%AA%E7%A1%AC%E8%B2%A8%E3%81%AE%E6%9C%80%E5%B0%8F%E6%9E%9A%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 14.5.3 &nbsp; 硬貨の両替問題 II

!!! question "問題"

    $n$ 種類の硬貨があり、$i$ 番目の額面は $coins[i - 1]$、目標金額は $amt$ です。各種類の硬貨は繰り返し選べます。**目標金額を作る硬貨の組み合わせは何通りありますか**。例を図 14-26 に示します。

![硬貨の両替問題 II のデータ例](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> 図 14-26 &nbsp; 硬貨の両替問題 II のデータ例 </p>

### 1. &nbsp; 動的計画法の考え方

前の問題と異なり、目標は組み合わせの数を求めることです。部分問題は、**最初の $i$ 種類の硬貨で金額 $a$ を作る組み合わせの数**になります。$dp$ テーブルは引き続き、$(n+1) \times (amt + 1)$ の二次元行列です。

現在の状態の組み合わせの数は、現在の硬貨を選ばない場合と選ぶ場合の数の和です。状態遷移式は次のとおりです。

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

目標金額が $0$ なら、何も選ばずに作れるので、先頭列の $dp[i, 0]$ はすべて $1$ で初期化します。硬貨がなければ $>0$ の金額は作れないので、先頭行の $dp[0, a]$ はすべて $0$ です。

### 2. &nbsp; コードの実装

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """硬貨の両替 II：動的計画法"""
        n = len(coins)
        # dp テーブルを初期化する
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 先頭列を初期化する
        for i in range(n + 1):
            dp[i][0] = 1
        # 状態遷移
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 硬貨の両替 II：動的計画法 */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // dp テーブルを初期化する
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 硬貨の両替 II：動的計画法 */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // dp テーブルを初期化する
        int[][] dp = new int[n + 1][amt + 1];
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 硬貨の両替 II：動的計画法 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // dp テーブルを初期化する
        int[,] dp = new int[n + 1, amt + 1];
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 硬貨の両替 II：動的計画法 */
    func coinChangeIIDP(coins []int, amt int) int {
        n := len(coins)
        // dp テーブルを初期化する
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 先頭列を初期化する
        for i := 0; i <= n; i++ {
            dp[i][0] = 1
        }
        // 状態遷移：残りの行と列
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 硬貨の両替 II：動的計画法 */
    func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // dp テーブルを初期化する
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 先頭列を初期化する
        for i in 0 ... n {
            dp[i][0] = 1
        }
        // 状態遷移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 硬貨の両替 II：動的計画法 */
    function coinChangeIIDP(coins, amt) {
        const n = coins.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 先頭列を初期化する
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 硬貨の両替 II：動的計画法 */
    function coinChangeIIDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 先頭列を初期化する
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 硬貨の両替 II：動的計画法 */
    int coinChangeIIDP(List<int> coins, int amt) {
      int n = coins.length;
      // dp テーブルを初期化する
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 先頭列を初期化する
      for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
      }
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 目標金額を超える場合、硬貨 i を選ばない
            dp[i][a] = dp[i - 1][a];
          } else {
            // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
          }
        }
      }
      return dp[n][amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 硬貨の両替 II：動的計画法 */
    fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // dp テーブルを初期化する
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 先頭列を初期化する
        for i in 0..=n {
            dp[i][0] = 1;
        }
        // 状態遷移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
                }
            }
        }
        dp[n][amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 硬貨の両替 II：動的計画法 */
    int coinChangeIIDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // dp テーブルを初期化する
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 先頭列を初期化する
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        int res = dp[n][amt];
        // メモリを解放する
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 硬貨の両替 II：動的計画法 */
    fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // dp テーブルを初期化する
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 先頭列を初期化する
        for (i in 0..n) {
            dp[i][0] = 1
        }
        // 状態遷移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### 硬貨の両替 II：動的計画法 ###
    def coin_change_ii_dp(coins, amt)
      n = coins.length
      # dp テーブルを初期化する
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # 先頭列を初期化する
      (0...(n + 1)).each { |i| dp[i][0] = 1 }
      # 状態遷移
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 目標金額を超える場合、硬貨 i を選ばない
            dp[i][a] = dp[i - 1][a]
          else
            # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
          end
        end
      end
      dp[n][amt]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%20II%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%85%88%E9%A0%AD%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E6%96%B9%E6%B3%95%E3%81%AE%E6%95%B0%E3%81%AE%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%AA%E3%82%8B%E7%A1%AC%E8%B2%A8%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E3%81%AE%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%20II%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%85%88%E9%A0%AD%E5%88%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E6%96%B9%E6%B3%95%E3%81%AE%E6%95%B0%E3%81%AE%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%AA%E3%82%8B%E7%A1%AC%E8%B2%A8%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E3%81%AE%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 3. &nbsp; 空間の最適化

空間最適化も同じで、硬貨の次元を取り除けば実現できます。

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """硬貨の両替 II：空間を最適化した動的計画法"""
        n = len(coins)
        # dp テーブルを初期化する
        dp = [0] * (amt + 1)
        dp[0] = 1
        # 状態遷移
        for i in range(1, n + 1):
            # 順方向に走査する
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                else:
                    # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // dp テーブルを初期化する
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // dp テーブルを初期化する
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    func coinChangeIIDPComp(coins []int, amt int) int {
        n := len(coins)
        // dp テーブルを初期化する
        dp := make([]int, amt+1)
        dp[0] = 1
        // 状態遷移
        for i := 1; i <= n; i++ {
            // 順方向に走査する
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a-coins[i-1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // dp テーブルを初期化する
        var dp = Array(repeating: 0, count: amt + 1)
        dp[0] = 1
        // 状態遷移
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    function coinChangeIIDPComp(coins, amt) {
        const n = coins.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 状態遷移
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    int coinChangeIIDPComp(List<int> coins, int amt) {
      int n = coins.length;
      // dp テーブルを初期化する
      List<int> dp = List.filled(amt + 1, 0);
      dp[0] = 1;
      // 状態遷移
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 目標金額を超える場合、硬貨 i を選ばない
            dp[a] = dp[a];
          } else {
            // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
            dp[a] = dp[a] + dp[a - coins[i - 1]];
          }
        }
      }
      return dp[amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // dp テーブルを初期化する
        let mut dp = vec![0; amt + 1];
        dp[0] = 1;
        // 状態遷移
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
                }
            }
        }
        dp[amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // dp テーブルを初期化する
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a];
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        int res = dp[amt];
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 硬貨の両替 II：空間を最適化した動的計画法 */
    fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // dp テーブルを初期化する
        val dp = IntArray(amt + 1)
        dp[0] = 1
        // 状態遷移
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選ばない
                    dp[a] = dp[a]
                } else {
                    // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### 硬貨の両替 II：空間を最適化した動的計画法 ###
    def coin_change_ii_dp_comp(coins, amt)
      n = coins.length
      # dp テーブルを初期化する
      dp = Array.new(amt + 1, 0)
      dp[0] = 1
      # 状態遷移
      for i in 1...(n + 1)
        # 順方向に走査する
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 目標金額を超える場合、硬貨 i を選ばない
            dp[a] = dp[a]
          else
            # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
            dp[a] = dp[a] + dp[a - coins[i - 1]]
          end
        end
      end
      dp[amt]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%20II%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E6%96%B9%E6%B3%95%E3%81%AE%E6%95%B0%E3%81%AE%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%AA%E3%82%8B%E7%A1%AC%E8%B2%A8%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E3%81%AE%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%A1%AC%E8%B2%A8%E3%81%AE%E4%B8%A1%E6%9B%BF%20II%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%A0%86%E6%96%B9%E5%90%91%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E5%A0%B4%E5%90%88%E3%80%81%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%A1%AC%E8%B2%A8%20i%20%E3%82%92%E9%81%B8%E3%81%B0%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%A8%E9%81%B8%E3%81%B6%E5%A0%B4%E5%90%88%E3%81%AE%E6%96%B9%E6%B3%95%E3%81%AE%E6%95%B0%E3%81%AE%E5%92%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%E7%9B%AE%E6%A8%99%E9%87%91%E9%A1%8D%E3%81%AB%E3%81%AA%E3%82%8B%E7%A1%AC%E8%B2%A8%E3%81%AE%E7%B5%84%E3%81%BF%E5%90%88%E3%82%8F%E3%81%9B%E3%81%AE%E6%95%B0%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
