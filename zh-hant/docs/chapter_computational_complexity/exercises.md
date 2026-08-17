---
comments: true
---

# 2.6 &nbsp; 練習

## 2.6.1 &nbsp; 知識鞏固

### 1. &nbsp; 迭代與遞迴的時間和空間

下面兩段程式碼都計算 $1 + 2 + \dots + n$（設 $n \ge 1$）。請把 `n` 設為 4，
按照程式實際執行的順序回答問題，然後比較兩種寫法的效率。

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """迭代求和"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """遞迴求和"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 迭代求和 */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 迭代求和 */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* 遞迴求和 */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 迭代求和 */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* 遞迴求和 */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 迭代求和 */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 迭代求和 */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 迭代求和 */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* 遞迴求和 */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 迭代求和 */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* 遞迴求和 */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 迭代求和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 遞迴求和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 迭代求和 */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* 遞迴求和 */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 迭代求和 ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### 遞迴求和 ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. 輸入 `n = 4` 執行迭代函式時，每輪迴圈結束後，累加變數 `res` 的值分別是多少？
2. 輸入 `n = 4` 執行遞迴函式時，參數 `n` 會依次取哪些值？從最深的一層開始返回時，結果怎樣得到？
3. 兩種寫法的時間複雜度和空間複雜度分別是多少？結合第 1、2 問的執行過程說明理由。

??? success "參考答案"

    1. 迴圈變數 `i` 依次為 `1、2、3、4`，每輪結束後，`res` 依次變為
        `1、3、6、10`，所以迭代函式返回 10。

    2. 參數 `n` 依次為 `4 → 3 → 2 → 1`。
        最深一層返回 1，隨後各層依次得到 `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10`。
        在最深處，4 次函式呼叫都尚未結束。

    3. 兩段程式碼都進行與 $n$ 成正比的迴圈或呼叫，因此時間複雜度均為 $O(n)$ 。
        空間複雜度不同：迭代版只使用常數個變數，為 $O(1)$ ；
        遞迴版在到達終止條件前，前面的函式呼叫都要等待返回結果，因此呼叫堆疊中最多同時儲存 $n$ 次呼叫，
        空間複雜度為 $O(n)$。

        分析空間複雜度時，除程式碼中的變數外，還要考慮遞迴呼叫佔用的空間。

### 2. &nbsp; 三段程式碼的時間複雜度

以下三個程式碼片段的輸入均為正整數 $n$ 。請按時間複雜度從低到高排序，並寫出各自的複雜度。

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """線性階迴圈"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """平方階迴圈"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """對數階迴圈"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 線性階迴圈 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 線性階迴圈 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 線性階迴圈 */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 線性階迴圈 */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* 平方階迴圈 */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* 對數階迴圈 */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 線性階迴圈 */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* 平方階迴圈 */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* 對數階迴圈 */
    func logarithmicLoop(n: Int) -> Int {
        var n = n
        while n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 線性階迴圈 */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 線性階迴圈 */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 線性階迴圈 */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* 平方階迴圈 */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* 對數階迴圈 */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 線性階迴圈 */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* 平方階迴圈 */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* 對數階迴圈 */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 線性階迴圈 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 平方階迴圈 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 對數階迴圈 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 線性階迴圈 */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* 平方階迴圈 */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* 對數階迴圈 */
    fun logarithmicLoop(n: Int): Int {
        var value = n
        while (value > 1) {
            value /= 2
        }
        return value
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 線性階迴圈 ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### 平方階迴圈 ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### 對數階迴圈 ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "參考答案"

    從低到高為：片段三 $O(\log n)$、片段一 $O(n)$、片段二 $O(n^2)$。
    片段三每輪把 $n$ 縮小為原來的一半，約迴圈 $\log_2 n$ 次。
    片段一的迴圈恰好執行 $n$ 次。片段二的內層迴圈次數依次為
    $n,n-1,\dots,1$，總次數為 $n(n+1)/2$，因此屬於平方階。

### 3. &nbsp; 哪種反轉更節省空間

要將陣列 `nums` 中的元素全部反轉，有兩種做法：

<!-- numbered-subquestions -->

1. 新建一個等長陣列 `res`，倒序複製後返回；
2. 用兩個索引 `i` 和 `j` 分別從首、尾向中間移動，逐對交換 `nums[i]` 與 `nums[j]` 。

    兩種做法的空間複雜度各是多少？哪種屬於“原地”操作？

??? success "參考答案"

    1. 需要與輸入等長的輔助陣列，空間複雜度 $O(n)$。

    2. 只使用兩個索引變數，
        空間複雜度 $O(1)$ ，屬於原地操作。

        需要注意：原地反轉會修改輸入陣列，
        僅在允許修改輸入時才應優先選用；若需保留原陣列，第 1 種做法的複製開銷不可避免。

## 2.6.2 &nbsp; 程式設計練習

### 1. &nbsp; 費波那契數

費波那契數列滿足：$F(0)=0$、$F(1)=1$，並且當 $n\ge2$ 時，
$F(n)=F(n-1)+F(n-2)$。

給定非負整數 `n`，請使用迴圈計算並返回 $F(n)$，不使用遞迴。

??? tip "解題提示"

    1. 先單獨處理 n 為 0 和 1 的情況
    2. 計算下一項時只需要前兩項，無須儲存整個數列
    3. 更新兩個變數時，注意不要過早覆蓋仍會用到的舊值

[LeetCode](https://leetcode.cn/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [題目解析](https://leetcode.cn/problems/fibonacci-number/solutions/2361746/509-fei-bo-na-qi-shu-dong-tai-gui-hua-qi-so8h/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
