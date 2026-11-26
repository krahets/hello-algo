---
comments: true
---

# 2.6 &nbsp; 연습 문제

## 2.6.1 &nbsp; 개념 다지기

### 1. &nbsp; 반복과 재귀의 시간 및 공간 복잡도

다음 두 코드는 모두 $1 + 2 + \dots + n$을 계산한다(단, $n \ge 1$). `n`을 4로 설정하고,
프로그램이 실제로 실행되는 순서에 따라 물음에 답한 뒤 두 방식의 효율을 비교하라.

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """반복으로 합 구하기"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """재귀로 합 구하기"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 반복으로 합 구하기 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 반복으로 합 구하기 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 반복으로 합 구하기 */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 반복으로 합 구하기 */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* 재귀로 합 구하기 */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 반복으로 합 구하기 */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* 재귀로 합 구하기 */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 반복으로 합 구하기 */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 반복으로 합 구하기 */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 반복으로 합 구하기 */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* 재귀로 합 구하기 */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 반복으로 합 구하기 */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* 재귀로 합 구하기 */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 반복으로 합 구하기 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 재귀로 합 구하기 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 반복으로 합 구하기 */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* 재귀로 합 구하기 */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 반복으로 합 구하기 ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### 재귀로 합 구하기 ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. `n = 4`를 입력하여 반복 함수를 실행할 때, 반복이 한 번 끝날 때마다 누적 합을 저장하는 변수 `res`의 값은 얼마인가?
2. `n = 4`를 입력하여 재귀 함수를 실행할 때 매개변수 `n`은 차례로 어떤 값을 갖는가? 가장 깊은 호출부터 반환하면서 결과를 어떻게 구하는가?
3. 두 방식의 시간 복잡도와 공간 복잡도는 각각 얼마인가? 1번과 2번에서 살펴본 실행 과정을 바탕으로 그 이유를 설명하라.

??? success "예시 답안"

    1. 반복 변수 `i`는 차례로 `1, 2, 3, 4`가 된다. 반복이 한 번 끝날 때마다 `res`의 값은 차례로
        `1, 3, 6, 10`이 된다. 따라서 반복 함수는 10을 반환한다.

    2. 매개변수 `n`의 값은 `4 → 3 → 2 → 1` 순으로 바뀐다.
        가장 깊은 호출이 1을 반환하면 그 위의 각 호출에서 차례로 `2 + 1 = 3`, `3 + 3 = 6`, `4 + 6 = 10`을 얻는다.
        가장 깊은 호출에 도달했을 때는 네 번의 함수 호출이 모두 끝나지 않은 상태다.

    3. 두 코드 모두 입력 크기 $n$에 비례하는 횟수만큼 반복하거나 함수를 호출하므로 시간 복잡도는 $O(n)$이다.
        공간 복잡도는 다르다. 반복 방식은 일정한 개수의 변수만 사용하므로 공간 복잡도가 $O(1)$이다.
        재귀 방식에서는 종료 조건에 도달할 때까지 앞선 호출이 모두 반환값을 기다린다. 따라서 호출 스택에 최대 $n$개의 호출이 동시에 쌓이므로
        공간 복잡도는 $O(n)$이다.

        공간 복잡도를 분석할 때는 코드에 나타난 변수뿐 아니라 재귀 호출이 차지하는 공간도 고려해야 한다.

### 2. &nbsp; 세 코드 조각의 시간 복잡도

다음 세 코드 조각은 모두 양의 정수 $n$을 입력받는다. 시간 복잡도가 낮은 것부터 순서대로 나열하고 각각의 시간 복잡도를 쓰라.

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """선형 반복문"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """이차 반복문"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """로그 반복문"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 선형 반복문 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 선형 반복문 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 선형 반복문 */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 선형 반복문 */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* 이차 반복문 */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* 로그 반복문 */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 선형 반복문 */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* 이차 반복문 */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* 로그 반복문 */
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
    /* 선형 반복문 */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 선형 반복문 */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 선형 반복문 */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* 이차 반복문 */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* 로그 반복문 */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 선형 반복문 */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* 이차 반복문 */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* 로그 반복문 */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 선형 반복문 */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 이차 반복문 */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 로그 반복문 */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 선형 반복문 */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* 이차 반복문 */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* 로그 반복문 */
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
    ### 선형 반복문 ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### 이차 반복문 ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### 로그 반복문 ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "예시 답안"

    낮은 것부터 나열하면 코드 3은 $O(\log n)$, 코드 1은 $O(n)$, 코드 2는 $O(n^2)$이다.
    코드 3은 반복할 때마다 $n$을 절반으로 줄이므로 약 $\log_2 n$번 반복한다.
    코드 1의 반복문은 정확히 $n$번 실행된다. 코드 2에서 안쪽 반복문의 실행 횟수는 차례로
    $n,n-1,\dots,1$이다. 이를 모두 더하면 $n(n+1)/2$이므로 시간 복잡도는 이차이다.

### 3. &nbsp; 배열을 뒤집을 때 어느 방법이 공간을 덜 쓸까?

배열 `nums`의 모든 원소를 역순으로 배치하는 방법은 두 가지다.

<!-- numbered-subquestions -->

1. 길이가 같은 배열 `res`를 새로 만들어 원소를 역순으로 복사한 뒤 반환한다.
2. 두 인덱스 `i`와 `j`를 각각 배열의 처음과 끝에서 가운데로 옮기면서 `nums[i]`와 `nums[j]`를 한 쌍씩 맞바꾼다.

    두 방법의 공간 복잡도는 각각 얼마인가? 어느 쪽이 제자리 연산인가?

??? success "예시 답안"

    1. 입력과 길이가 같은 보조 배열이 필요하므로 공간 복잡도는 $O(n)$이다.

    2. 인덱스 변수 두 개만 사용하므로
        공간 복잡도는 $O(1)$이며 제자리 연산에 해당한다.

        제자리에서 뒤집으면 입력 배열이 바뀐다는 점에 유의한다.
        입력을 바꿔도 되는 경우에만 이 방법을 우선한다. 원래 배열을 보존해야 한다면 첫 번째 방법의 복사 비용은 피할 수 없다.

## 2.6.2 &nbsp; 프로그래밍 연습

### 1. &nbsp; 피보나치 수

피보나치 수열에서 $F(0)=0$이고 $F(1)=1$이며, $n\ge2$일 때는
$F(n)=F(n-1)+F(n-2)$이다.

음이 아닌 정수 `n`이 주어지면 재귀를 사용하지 말고 반복문으로 $F(n)$을 계산하여 반환하라.

??? tip "풀이 힌트"

    1. 먼저 n이 0인 경우와 1인 경우를 따로 처리한다.
    2. 다음 항을 계산할 때는 앞의 두 항만 필요하므로 수열 전체를 저장할 필요가 없다.
    3. 두 변수를 갱신할 때 아직 필요한 값을 너무 일찍 덮어쓰지 않도록 주의한다.

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
