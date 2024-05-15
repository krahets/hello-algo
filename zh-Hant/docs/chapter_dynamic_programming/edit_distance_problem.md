---
comments: true
---

# 14.6 &nbsp; 編輯距離問題

編輯距離，也稱 Levenshtein 距離，指兩個字串之間互相轉換的最少修改次數，通常用於在資訊檢索和自然語言處理中度量兩個序列的相似度。

!!! question

    輸入兩個字串 $s$ 和 $t$ ，返回將 $s$ 轉換為 $t$ 所需的最少編輯步數。
    
    你可以在一個字串中進行三種編輯操作：插入一個字元、刪除一個字元、將字元替換為任意一個字元。

如圖 14-27 所示，將 `kitten` 轉換為 `sitting` 需要編輯 3 步，包括 2 次替換操作與 1 次新增操作；將 `hello` 轉換為 `algo` 需要 3 步，包括 2 次替換操作和 1 次刪除操作。

![編輯距離的示例資料](edit_distance_problem.assets/edit_distance_example.png){ class="animation-figure" }

<p align="center"> 圖 14-27 &nbsp; 編輯距離的示例資料 </p>

**編輯距離問題可以很自然地用決策樹模型來解釋**。字串對應樹節點，一輪決策（一次編輯操作）對應樹的一條邊。

如圖 14-28 所示，在不限制操作的情況下，每個節點都可以派生出許多條邊，每條邊對應一種操作，這意味著從 `hello` 轉換到 `algo` 有許多種可能的路徑。

從決策樹的角度看，本題的目標是求解節點 `hello` 和節點 `algo` 之間的最短路徑。

![基於決策樹模型表示編輯距離問題](edit_distance_problem.assets/edit_distance_decision_tree.png){ class="animation-figure" }

<p align="center"> 圖 14-28 &nbsp; 基於決策樹模型表示編輯距離問題 </p>

### 1. &nbsp; 動態規劃思路

**第一步：思考每輪的決策，定義狀態，從而得到 $dp$ 表**

每一輪的決策是對字串 $s$ 進行一次編輯操作。

我們希望在編輯操作的過程中，問題的規模逐漸縮小，這樣才能構建子問題。設字串 $s$ 和 $t$ 的長度分別為 $n$ 和 $m$ ，我們先考慮兩字串尾部的字元 $s[n-1]$ 和 $t[m-1]$ 。

- 若 $s[n-1]$ 和 $t[m-1]$ 相同，我們可以跳過它們，直接考慮 $s[n-2]$ 和 $t[m-2]$ 。
- 若 $s[n-1]$ 和 $t[m-1]$ 不同，我們需要對 $s$ 進行一次編輯（插入、刪除、替換），使得兩字串尾部的字元相同，從而可以跳過它們，考慮規模更小的問題。

也就是說，我們在字串 $s$ 中進行的每一輪決策（編輯操作），都會使得 $s$ 和 $t$ 中剩餘的待匹配字元發生變化。因此，狀態為當前在 $s$ 和 $t$ 中考慮的第 $i$ 和第 $j$ 個字元，記為 $[i, j]$ 。

狀態 $[i, j]$ 對應的子問題：**將 $s$ 的前 $i$ 個字元更改為 $t$ 的前 $j$ 個字元所需的最少編輯步數**。

至此，得到一個尺寸為 $(i+1) \times (j+1)$ 的二維 $dp$ 表。

**第二步：找出最優子結構，進而推導出狀態轉移方程**

考慮子問題 $dp[i, j]$ ，其對應的兩個字串的尾部字元為 $s[i-1]$ 和 $t[j-1]$ ，可根據不同編輯操作分為圖 14-29 所示的三種情況。

1. 在 $s[i-1]$ 之後新增 $t[j-1]$ ，則剩餘子問題 $dp[i, j-1]$ 。
2. 刪除 $s[i-1]$ ，則剩餘子問題 $dp[i-1, j]$ 。
3. 將 $s[i-1]$ 替換為 $t[j-1]$ ，則剩餘子問題 $dp[i-1, j-1]$ 。

![編輯距離的狀態轉移](edit_distance_problem.assets/edit_distance_state_transfer.png){ class="animation-figure" }

<p align="center"> 圖 14-29 &nbsp; 編輯距離的狀態轉移 </p>

根據以上分析，可得最優子結構：$dp[i, j]$ 的最少編輯步數等於 $dp[i, j-1]$、$dp[i-1, j]$、$dp[i-1, j-1]$ 三者中的最少編輯步數，再加上本次的編輯步數 $1$ 。對應的狀態轉移方程為：

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

請注意，**當 $s[i-1]$ 和 $t[j-1]$ 相同時，無須編輯當前字元**，這種情況下的狀態轉移方程為：

$$
dp[i, j] = dp[i-1, j-1]
$$

**第三步：確定邊界條件和狀態轉移順序**

當兩字串都為空時，編輯步數為 $0$ ，即 $dp[0, 0] = 0$ 。當 $s$ 為空但 $t$ 不為空時，最少編輯步數等於 $t$ 的長度，即首行 $dp[0, j] = j$ 。當 $s$ 不為空但 $t$ 為空時，最少編輯步數等於 $s$ 的長度，即首列 $dp[i, 0] = i$ 。

觀察狀態轉移方程，解 $dp[i, j]$ 依賴左方、上方、左上方的解，因此透過兩層迴圈正序走訪整個 $dp$ 表即可。

### 2. &nbsp; 程式碼實現

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp(s: str, t: str) -> int:
        """編輯距離：動態規劃"""
        n, m = len(s), len(t)
        dp = [[0] * (m + 1) for _ in range(n + 1)]
        # 狀態轉移：首行首列
        for i in range(1, n + 1):
            dp[i][0] = i
        for j in range(1, m + 1):
            dp[0][j] = j
        # 狀態轉移：其餘行和列
        for i in range(1, n + 1):
            for j in range(1, m + 1):
                if s[i - 1] == t[j - 1]:
                    # 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
        return dp[n][m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* 編輯距離：動態規劃 */
    int editDistanceDP(string s, string t) {
        int n = s.length(), m = t.length();
        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        // 狀態轉移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* 編輯距離：動態規劃 */
    int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // 狀態轉移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* 編輯距離：動態規劃 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 狀態轉移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* 編輯距離：動態規劃 */
    func editDistanceDP(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, m+1)
        }
        // 狀態轉移：首行首列
        for i := 1; i <= n; i++ {
            dp[i][0] = i
        }
        for j := 1; j <= m; j++ {
            dp[0][j] = j
        }
        // 狀態轉移：其餘行和列
        for i := 1; i <= n; i++ {
            for j := 1; j <= m; j++ {
                if s[i-1] == t[j-1] {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* 編輯距離：動態規劃 */
    func editDistanceDP(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        // 狀態轉移：首行首列
        for i in 1 ... n {
            dp[i][0] = i
        }
        for j in 1 ... m {
            dp[0][j] = j
        }
        // 狀態轉移：其餘行和列
        for i in 1 ... n {
            for j in 1 ... m {
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* 編輯距離：動態規劃 */
    function editDistanceDP(s, t) {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
        // 狀態轉移：首行首列
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] =
                        Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    /* 編輯距離：動態規劃 */
    function editDistanceDP(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: m + 1 }, () => 0)
        );
        // 狀態轉移：首行首列
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] =
                        Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    /* 編輯距離：動態規劃 */
    int editDistanceDP(String s, String t) {
      int n = s.length, m = t.length;
      List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
      // 狀態轉移：首行首列
      for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
      }
      for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
      }
      // 狀態轉移：其餘行和列
      for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
          if (s[i - 1] == t[j - 1]) {
            // 若兩字元相等，則直接跳過此兩字元
            dp[i][j] = dp[i - 1][j - 1];
          } else {
            // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
            dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
          }
        }
      }
      return dp[n][m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* 編輯距離：動態規劃 */
    fn edit_distance_dp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![vec![0; m + 1]; n + 1];
        // 狀態轉移：首行首列
        for i in 1..=n {
            dp[i][0] = i as i32;
        }
        for j in 1..m {
            dp[0][j] = j as i32;
        }
        // 狀態轉移：其餘行和列
        for i in 1..=n {
            for j in 1..=m {
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] =
                        std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        dp[n][m]
    }
    ```

=== "C"

    ```c title="edit_distance.c"
    /* 編輯距離：動態規劃 */
    int editDistanceDP(char *s, char *t, int n, int m) {
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(m + 1, sizeof(int));
        }
        // 狀態轉移：首行首列
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        int res = dp[n][m];
        // 釋放記憶體
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* 編輯距離：動態規劃 */
    fun editDistanceDP(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = Array(n + 1) { IntArray(m + 1) }
        // 狀態轉移：首行首列
        for (i in 1..n) {
            dp[i][0] = i
        }
        for (j in 1..m) {
            dp[0][j] = j
        }
        // 狀態轉移：其餘行和列
        for (i in 1..n) {
            for (j in 1..m) {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    [class]{}-[func]{edit_distance_dp}
    ```

=== "Zig"

    ```zig title="edit_distance.zig"
    // 編輯距離：動態規劃
    fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
        comptime var n = s.len;
        comptime var m = t.len;
        var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
        // 狀態轉移：首行首列
        for (1..n + 1) |i| {
            dp[i][0] = @intCast(i);
        }
        for (1..m + 1) |j| {
            dp[0][j] = @intCast(j);
        }
        // 狀態轉移：其餘行和列
        for (1..n + 1) |i| {
            for (1..m + 1) |j| {
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp%28s%3A%20str%2C%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%A8%E8%BC%AF%E8%B7%9D%E9%9B%A2%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28m%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%E9%A6%96%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20i%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E8%A1%8C%E5%92%8C%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%85%A9%E5%AD%97%E5%85%83%E7%9B%B8%E7%AD%89%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%E6%AD%A4%E5%85%A9%E5%AD%97%E5%85%83%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%3D%20%E6%8F%92%E5%85%A5%E3%80%81%E5%88%AA%E9%99%A4%E3%80%81%E6%9B%BF%E6%8F%9B%E9%80%99%E4%B8%89%E7%A8%AE%E6%93%8D%E4%BD%9C%E7%9A%84%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D%2C%20dp%5Bi%20-%201%5D%5Bj%5D%2C%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%29%20%2B%201%0A%20%20%20%20return%20dp%5Bn%5D%5Bm%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20edit_distance_dp%28s%2C%20t%29%0A%20%20%20%20print%28f%22%E5%B0%87%20%7Bs%7D%20%E6%9B%B4%E6%94%B9%E7%82%BA%20%7Bt%7D%20%E6%9C%80%E5%B0%91%E9%9C%80%E8%A6%81%E7%B7%A8%E8%BC%AF%20%7Bres%7D%20%E6%AD%A5%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp%28s%3A%20str%2C%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%A8%E8%BC%AF%E8%B7%9D%E9%9B%A2%EF%BC%9A%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28m%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%E9%A6%96%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20i%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E8%A1%8C%E5%92%8C%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%85%A9%E5%AD%97%E5%85%83%E7%9B%B8%E7%AD%89%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%E6%AD%A4%E5%85%A9%E5%AD%97%E5%85%83%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%3D%20%E6%8F%92%E5%85%A5%E3%80%81%E5%88%AA%E9%99%A4%E3%80%81%E6%9B%BF%E6%8F%9B%E9%80%99%E4%B8%89%E7%A8%AE%E6%93%8D%E4%BD%9C%E7%9A%84%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D%2C%20dp%5Bi%20-%201%5D%5Bj%5D%2C%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%29%20%2B%201%0A%20%20%20%20return%20dp%5Bn%5D%5Bm%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20edit_distance_dp%28s%2C%20t%29%0A%20%20%20%20print%28f%22%E5%B0%87%20%7Bs%7D%20%E6%9B%B4%E6%94%B9%E7%82%BA%20%7Bt%7D%20%E6%9C%80%E5%B0%91%E9%9C%80%E8%A6%81%E7%B7%A8%E8%BC%AF%20%7Bres%7D%20%E6%AD%A5%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

如圖 14-30 所示，編輯距離問題的狀態轉移過程與背包問題非常類似，都可以看作填寫一個二維網格的過程。

=== "<1>"
    ![編輯距離的動態規劃過程](edit_distance_problem.assets/edit_distance_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![edit_distance_dp_step2](edit_distance_problem.assets/edit_distance_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![edit_distance_dp_step3](edit_distance_problem.assets/edit_distance_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![edit_distance_dp_step4](edit_distance_problem.assets/edit_distance_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![edit_distance_dp_step5](edit_distance_problem.assets/edit_distance_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![edit_distance_dp_step6](edit_distance_problem.assets/edit_distance_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![edit_distance_dp_step7](edit_distance_problem.assets/edit_distance_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![edit_distance_dp_step8](edit_distance_problem.assets/edit_distance_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![edit_distance_dp_step9](edit_distance_problem.assets/edit_distance_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![edit_distance_dp_step10](edit_distance_problem.assets/edit_distance_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![edit_distance_dp_step11](edit_distance_problem.assets/edit_distance_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![edit_distance_dp_step12](edit_distance_problem.assets/edit_distance_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![edit_distance_dp_step13](edit_distance_problem.assets/edit_distance_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![edit_distance_dp_step14](edit_distance_problem.assets/edit_distance_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![edit_distance_dp_step15](edit_distance_problem.assets/edit_distance_dp_step15.png){ class="animation-figure" }

<p align="center"> 圖 14-30 &nbsp; 編輯距離的動態規劃過程 </p>

### 3. &nbsp; 空間最佳化

由於 $dp[i,j]$ 是由上方 $dp[i-1, j]$、左方 $dp[i, j-1]$、左上方 $dp[i-1, j-1]$ 轉移而來的，而正序走訪會丟失左上方 $dp[i-1, j-1]$ ，倒序走訪無法提前構建 $dp[i, j-1]$ ，因此兩種走訪順序都不可取。

為此，我們可以使用一個變數 `leftup` 來暫存左上方的解 $dp[i-1, j-1]$ ，從而只需考慮左方和上方的解。此時的情況與完全背包問題相同，可使用正序走訪。程式碼如下所示：

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp_comp(s: str, t: str) -> int:
        """編輯距離：空間最佳化後的動態規劃"""
        n, m = len(s), len(t)
        dp = [0] * (m + 1)
        # 狀態轉移：首行
        for j in range(1, m + 1):
            dp[j] = j
        # 狀態轉移：其餘行
        for i in range(1, n + 1):
            # 狀態轉移：首列
            leftup = dp[0]  # 暫存 dp[i-1, j-1]
            dp[0] += 1
            # 狀態轉移：其餘列
            for j in range(1, m + 1):
                temp = dp[j]
                if s[i - 1] == t[j - 1]:
                    # 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup
                else:
                    # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = min(dp[j - 1], dp[j], leftup) + 1
                leftup = temp  # 更新為下一輪的 dp[i-1, j-1]
        return dp[m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* 編輯距離：空間最佳化後的動態規劃 */
    int editDistanceDPComp(string s, string t) {
        int n = s.length(), m = t.length();
        vector<int> dp(m + 1, 0);
        // 狀態轉移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：首列
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* 編輯距離：空間最佳化後的動態規劃 */
    int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // 狀態轉移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：首列
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* 編輯距離：空間最佳化後的動態規劃 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 狀態轉移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：首列
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* 編輯距離：空間最佳化後的動態規劃 */
    func editDistanceDPComp(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([]int, m+1)
        // 狀態轉移：首行
        for j := 1; j <= m; j++ {
            dp[j] = j
        }
        // 狀態轉移：其餘行
        for i := 1; i <= n; i++ {
            // 狀態轉移：首列
            leftUp := dp[0] // 暫存 dp[i-1, j-1]
            dp[0] = i
            // 狀態轉移：其餘列
            for j := 1; j <= m; j++ {
                temp := dp[j]
                if s[i-1] == t[j-1] {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftUp
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
                }
                leftUp = temp // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* 編輯距離：空間最佳化後的動態規劃 */
    func editDistanceDPComp(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: 0, count: m + 1)
        // 狀態轉移：首行
        for j in 1 ... m {
            dp[j] = j
        }
        // 狀態轉移：其餘行
        for i in 1 ... n {
            // 狀態轉移：首列
            var leftup = dp[0] // 暫存 dp[i-1, j-1]
            dp[0] = i
            // 狀態轉移：其餘列
            for j in 1 ... m {
                let temp = dp[j]
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* 編輯距離：空間最佳化後的動態規劃 */
    function editDistanceDPComp(s, t) {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // 狀態轉移：首行
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (let i = 1; i <= n; i++) {
            // 狀態轉移：首列
            let leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    /* 編輯距離：空間最佳化後的動態規劃 */
    function editDistanceDPComp(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // 狀態轉移：首行
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (let i = 1; i <= n; i++) {
            // 狀態轉移：首列
            let leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    /* 編輯距離：空間最佳化後的動態規劃 */
    int editDistanceDPComp(String s, String t) {
      int n = s.length, m = t.length;
      List<int> dp = List.filled(m + 1, 0);
      // 狀態轉移：首行
      for (int j = 1; j <= m; j++) {
        dp[j] = j;
      }
      // 狀態轉移：其餘行
      for (int i = 1; i <= n; i++) {
        // 狀態轉移：首列
        int leftup = dp[0]; // 暫存 dp[i-1, j-1]
        dp[0] = i;
        // 狀態轉移：其餘列
        for (int j = 1; j <= m; j++) {
          int temp = dp[j];
          if (s[i - 1] == t[j - 1]) {
            // 若兩字元相等，則直接跳過此兩字元
            dp[j] = leftup;
          } else {
            // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
            dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
          }
          leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
        }
      }
      return dp[m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* 編輯距離：空間最佳化後的動態規劃 */
    fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![0; m + 1];
        // 狀態轉移：首行
        for j in 1..m {
            dp[j] = j as i32;
        }
        // 狀態轉移：其餘行
        for i in 1..=n {
            // 狀態轉移：首列
            let mut leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i as i32;
            // 狀態轉移：其餘列
            for j in 1..=m {
                let temp = dp[j];
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        dp[m]
    }
    ```

=== "C"

    ```c title="edit_distance.c"
    /* 編輯距離：空間最佳化後的動態規劃 */
    int editDistanceDPComp(char *s, char *t, int n, int m) {
        int *dp = calloc(m + 1, sizeof(int));
        // 狀態轉移：首行
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 狀態轉移：其餘行
        for (int i = 1; i <= n; i++) {
            // 狀態轉移：首列
            int leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = i;
            // 狀態轉移：其餘列
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        int res = dp[m];
        // 釋放記憶體
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* 編輯距離：空間最佳化後的動態規劃 */
    fun editDistanceDPComp(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = IntArray(m + 1)
        // 狀態轉移：首行
        for (j in 1..m) {
            dp[j] = j
        }
        // 狀態轉移：其餘行
        for (i in 1..n) {
            // 狀態轉移：首列
            var leftup = dp[0] // 暫存 dp[i-1, j-1]
            dp[0] = i
            // 狀態轉移：其餘列
            for (j in 1..m) {
                val temp = dp[j]
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    [class]{}-[func]{edit_distance_dp_comp}
    ```

=== "Zig"

    ```zig title="edit_distance.zig"
    // 編輯距離：空間最佳化後的動態規劃
    fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
        comptime var n = s.len;
        comptime var m = t.len;
        var dp = [_]i32{0} ** (m + 1);
        // 狀態轉移：首行
        for (1..m + 1) |j| {
            dp[j] = @intCast(j);
        }
        // 狀態轉移：其餘行
        for (1..n + 1) |i| {
            // 狀態轉移：首列
            var leftup = dp[0]; // 暫存 dp[i-1, j-1]
            dp[0] = @intCast(i);
            // 狀態轉移：其餘列
            for (1..m + 1) |j| {
                var temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 若兩字元相等，則直接跳過此兩字元
                    dp[j] = leftup;
                } else {
                    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                    dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
            }
        }
        return dp[m];
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp_comp%28s%3A%20str%2C%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%A8%E8%BC%AF%E8%B7%9D%E9%9B%A2%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E5%88%97%0A%20%20%20%20%20%20%20%20leftup%20%3D%20dp%5B0%5D%20%20%23%20%E6%9A%AB%E5%AD%98%20dp%5Bi-1%2C%20j-1%5D%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20dp%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%85%A9%E5%AD%97%E5%85%83%E7%9B%B8%E7%AD%89%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%E6%AD%A4%E5%85%A9%E5%AD%97%E5%85%83%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20leftup%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%3D%20%E6%8F%92%E5%85%A5%E3%80%81%E5%88%AA%E9%99%A4%E3%80%81%E6%9B%BF%E6%8F%9B%E9%80%99%E4%B8%89%E7%A8%AE%E6%93%8D%E4%BD%9C%E7%9A%84%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D%2C%20dp%5Bj%5D%2C%20leftup%29%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20leftup%20%3D%20temp%20%20%23%20%E6%9B%B4%E6%96%B0%E7%82%BA%E4%B8%8B%E4%B8%80%E8%BC%AA%E7%9A%84%20dp%5Bi-1%2C%20j-1%5D%0A%20%20%20%20return%20dp%5Bm%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20edit_distance_dp_comp%28s%2C%20t%29%0A%20%20%20%20print%28f%22%E5%B0%87%20%7Bs%7D%20%E6%9B%B4%E6%94%B9%E7%82%BA%20%7Bt%7D%20%E6%9C%80%E5%B0%91%E9%9C%80%E8%A6%81%E7%B7%A8%E8%BC%AF%20%7Bres%7D%20%E6%AD%A5%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp_comp%28s%3A%20str%2C%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E7%B7%A8%E8%BC%AF%E8%B7%9D%E9%9B%A2%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E9%A6%96%E5%88%97%0A%20%20%20%20%20%20%20%20leftup%20%3D%20dp%5B0%5D%20%20%23%20%E6%9A%AB%E5%AD%98%20dp%5Bi-1%2C%20j-1%5D%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%23%20%E7%8B%80%E6%85%8B%E8%BD%89%E7%A7%BB%EF%BC%9A%E5%85%B6%E9%A4%98%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20dp%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E5%85%A9%E5%AD%97%E5%85%83%E7%9B%B8%E7%AD%89%EF%BC%8C%E5%89%87%E7%9B%B4%E6%8E%A5%E8%B7%B3%E9%81%8E%E6%AD%A4%E5%85%A9%E5%AD%97%E5%85%83%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20leftup%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%3D%20%E6%8F%92%E5%85%A5%E3%80%81%E5%88%AA%E9%99%A4%E3%80%81%E6%9B%BF%E6%8F%9B%E9%80%99%E4%B8%89%E7%A8%AE%E6%93%8D%E4%BD%9C%E7%9A%84%E6%9C%80%E5%B0%91%E7%B7%A8%E8%BC%AF%E6%AD%A5%E6%95%B8%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D%2C%20dp%5Bj%5D%2C%20leftup%29%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20leftup%20%3D%20temp%20%20%23%20%E6%9B%B4%E6%96%B0%E7%82%BA%E4%B8%8B%E4%B8%80%E8%BC%AA%E7%9A%84%20dp%5Bi-1%2C%20j-1%5D%0A%20%20%20%20return%20dp%5Bm%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28s%29%2C%20len%28t%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E4%BD%B3%E5%8C%96%E5%BE%8C%E7%9A%84%E5%8B%95%E6%85%8B%E8%A6%8F%E5%8A%83%0A%20%20%20%20res%20%3D%20edit_distance_dp_comp%28s%2C%20t%29%0A%20%20%20%20print%28f%22%E5%B0%87%20%7Bs%7D%20%E6%9B%B4%E6%94%B9%E7%82%BA%20%7Bt%7D%20%E6%9C%80%E5%B0%91%E9%9C%80%E8%A6%81%E7%B7%A8%E8%BC%AF%20%7Bres%7D%20%E6%AD%A5%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>
