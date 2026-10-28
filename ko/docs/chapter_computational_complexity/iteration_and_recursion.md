---
comments: true
---

# 2.2 &nbsp; 반복과 재귀

알고리즘에서는 특정 작업을 반복해서 실행하는 일이 흔하며, 이는 복잡도 분석과 밀접하게 연결되어 있다. 따라서 시간 복잡도와 공간 복잡도를 소개하기 전에, 프로그램에서 작업을 반복 실행하는 두 가지 기본 제어 구조인 반복과 재귀부터 알아보자.

## 2.2.1 &nbsp; 반복

<u>반복(iteration)</u>은 특정 작업을 거듭 실행하는 제어 구조다. 반복에서는 일정한 조건을 만족하는 동안 코드 일부를 계속 실행하다가, 조건을 더 이상 만족하지 않으면 멈춘다.

### 1. &nbsp; for 반복문

`for` 반복문은 가장 흔한 반복 형식 중 하나로, **반복 횟수를 미리 알고 있을 때 적합하다**.

다음 함수는 `for` 반복문으로 $1 + 2 + \dots + n$을 계산하고, 그 합을 변수 `res`에 기록한다. Python의 `range(a, b)`는 왼쪽 끝을 포함하고 오른쪽 끝은 포함하지 않는 구간이므로, 순회 범위는 $a, a + 1, \dots, b-1$이다.

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """for 반복문"""
        res = 0
        # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* for 반복문 */
    int forLoop(int n) {
        int res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* for 반복문 */
    int forLoop(int n) {
        int res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* for 반복문 */
    int ForLoop(int n) {
        int res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* for 반복문 */
    func forLoop(n int) int {
        res := 0
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* for 반복문 */
    func forLoop(n: Int) -> Int {
        var res = 0
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for i in 1 ... n {
            res += i
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* for 반복문 */
    function forLoop(n) {
        let res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* for 반복문 */
    function forLoop(n: number): number {
        let res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* for 반복문 */
    int forLoop(int n) {
      int res = 0;
      // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* for 반복문 */
    fn for_loop(n: i32) -> i32 {
        let mut res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for i in 1..=n {
            res += i;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* for 반복문 */
    int forLoop(int n) {
        int res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* for 반복문 */
    fun forLoop(n: Int): Int {
        var res = 0
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (i in 1..n) {
            res += i
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### for 반복문 ###
    def for_loop(n)
      res = 0

      # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
      for i in 1..n
        res += i
      end

      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%202,%20...,%20n-1,%20n%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%202,%20...,%20n-1,%20n%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(2-1)은 이 합계 함수의 순서도다.

![합계 함수의 순서도](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> 그림 2-1 &nbsp; 합계 함수의 순서도 </p>

이 합계 함수의 연산 횟수는 입력 데이터 크기 $n$에 비례한다. 이를 ‘선형 관계’라고도 한다. 실제로 **시간 복잡도가 설명하는 것이 바로 이 ‘선형 관계’다**. 관련 내용은 다음 절에서 자세히 소개한다.

### 2. &nbsp; while 반복문

`for` 반복문과 마찬가지로 `while` 반복문도 반복을 구현하는 방법이다. `while` 반복문은 매번 먼저 조건을 검사하여 참이면 실행을 계속하고, 그렇지 않으면 반복을 끝낸다.

다음은 `while` 반복문으로 $1 + 2 + \dots + n$을 계산하는 코드다.

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """while 반복문"""
        res = 0
        i = 1  # 조건 변수를 초기화한다
        # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while i <= n:
            res += i
            i += 1  # 조건 변수를 갱신한다
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while 반복문 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while 반복문 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while 반복문 */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i += 1; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while 반복문 */
    func whileLoop(n int) int {
        res := 0
        // 조건 변수를 초기화한다
        i := 1
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for i <= n {
            res += i
            // 조건 변수를 갱신한다
            i++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while 반복문 */
    func whileLoop(n: Int) -> Int {
        var res = 0
        var i = 1 // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while i <= n {
            res += i
            i += 1 // 조건 변수를 갱신한다
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while 반복문 */
    function whileLoop(n) {
        let res = 0;
        let i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while 반복문 */
    function whileLoop(n: number): number {
        let res = 0;
        let i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while 반복문 */
    int whileLoop(int n) {
      int res = 0;
      int i = 1; // 조건 변수를 초기화한다
      // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
      while (i <= n) {
        res += i;
        i++; // 조건 변수를 갱신한다
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while 반복문 */
    fn while_loop(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 조건 변수를 초기화한다

        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while i <= n {
            res += i;
            i += 1; // 조건 변수를 갱신한다
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while 반복문 */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while 반복문 */
    fun whileLoop(n: Int): Int {
        var res = 0
        var i = 1 // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i
            i++ // 조건 변수를 갱신한다
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while 반복문 ###
    def while_loop(n)
      res = 0
      i = 1 # 조건 변수를 초기화한다

      # 반복문으로 1, 2, ..., n-1, n의 합을 구한다
      while i <= n
        res += i
        i += 1 # 조건 변수를 갱신한다
      end

      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%202,%20...,%20n-1,%20n%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%202,%20...,%20n-1,%20n%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

**`while` 반복문은 `for` 반복문보다 자유도가 높다**. `while` 반복문에서는 조건 변수의 초기화와 갱신 단계를 자유롭게 설계할 수 있다.

예를 들어 다음 코드에서는 조건 변수 $i$를 매번 두 차례 갱신한다. 이런 경우에는 `for` 반복문으로 구현하기가 다소 불편하다.

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """while 반복문(두 번 갱신)"""
        res = 0
        i = 1  # 조건 변수를 초기화한다
        # 반복문으로 1, 4, 10, ...의 합을 구한다
        while i <= n:
            res += i
            # 조건 변수를 갱신한다
            i += 1
            i *= 2
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while 반복문(두 번 갱신) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while 반복문(두 번 갱신) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while 반복문(두 번 갱신) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i += 1; 
            i *= 2;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while 반복문(두 번 갱신) */
    func whileLoopII(n int) int {
        res := 0
        // 조건 변수를 초기화한다
        i := 1
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        for i <= n {
            res += i
            // 조건 변수를 갱신한다
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while 반복문(두 번 갱신) */
    func whileLoopII(n: Int) -> Int {
        var res = 0
        var i = 1 // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while i <= n {
            res += i
            // 조건 변수를 갱신한다
            i += 1
            i *= 2
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while 반복문(두 번 갱신) */
    function whileLoopII(n) {
        let res = 0;
        let i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while 반복문(두 번 갱신) */
    function whileLoopII(n: number): number {
        let res = 0;
        let i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while 반복문(두 번 갱신) */
    int whileLoopII(int n) {
      int res = 0;
      int i = 1; // 조건 변수를 초기화한다
      // 반복문으로 1, 4, 10, ...의 합을 구한다
      while (i <= n) {
        res += i;
        // 조건 변수를 갱신한다
        i++;
        i *= 2;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while 반복문(두 번 갱신) */
    fn while_loop_ii(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 조건 변수를 초기화한다

        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while i <= n {
            res += i;
            // 조건 변수를 갱신한다
            i += 1;
            i *= 2;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while 반복문(두 번 갱신) */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while 반복문(두 번 갱신) */
    fun whileLoopII(n: Int): Int {
        var res = 0
        var i = 1 // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i
            // 조건 변수를 갱신한다
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while 반복문(두 번 갱신)###
    def while_loop_ii(n)
      res = 0
      i = 1 # 조건 변수를 초기화한다

      # 반복문으로 1, 4, 10, ...의 합을 구한다
      while i <= n
        res += i
        # 조건 변수를 갱신한다
        i += 1
        i *= 2
      end

      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%EB%B0%98%EB%B3%B5%EB%AC%B8%28%EB%91%90%20%EB%B2%88%20%EA%B0%B1%EC%8B%A0%29%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%204,%2010,%20...%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%EB%B0%98%EB%B3%B5%EB%AC%B8%28%EB%91%90%20%EB%B2%88%20%EA%B0%B1%EC%8B%A0%29%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%EB%B0%98%EB%B3%B5%EB%AC%B8%28%EB%91%90%20%EB%B2%88%20%EA%B0%B1%EC%8B%A0%29%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9C%BC%EB%A1%9C%201,%204,%2010,%20...%EC%9D%98%20%ED%95%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%EC%A1%B0%EA%B1%B4%20%EB%B3%80%EC%88%98%EB%A5%BC%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%EB%B0%98%EB%B3%B5%EB%AC%B8%28%EB%91%90%20%EB%B2%88%20%EA%B0%B1%EC%8B%A0%29%EC%9C%BC%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

전반적으로 **`for` 반복문은 코드가 더 간결하고, `while` 반복문은 더 유연하다**. 둘 다 반복 구조를 구현할 수 있으며, 어떤 것을 쓸지는 문제의 구체적인 요구에 따라 결정해야 한다.

### 3. &nbsp; 중첩 반복문

하나의 반복 구조 안에 다른 반복 구조를 중첩할 수 있다. 다음은 `for` 반복문을 사용한 예다.

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """이중 for 반복문"""
        res = ""
        # i = 1, 2, ..., n-1, n을 반복한다
        for i in range(1, n + 1):
            # j = 1, 2, ..., n-1, n을 반복한다
            for j in range(1, n + 1):
                res += f"({i}, {j}), "
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* 이중 for 반복문 */
    string nestedForLoop(int n) {
        ostringstream res;
        // i = 1, 2, ..., n-1, n을 반복한다
        for (int i = 1; i <= n; ++i) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (int j = 1; j <= n; ++j) {
                res << "(" << i << ", " << j << "), ";
            }
        }
        return res.str();
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* 이중 for 반복문 */
    String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n을 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* 이중 for 반복문 */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // i = 1, 2, ..., n-1, n을 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* 이중 for 반복문 */
    func nestedForLoop(n int) string {
        res := ""
        // i = 1, 2, ..., n-1, n을 반복한다
        for i := 1; i <= n; i++ {
            for j := 1; j <= n; j++ {
                // j = 1, 2, ..., n-1, n을 반복한다
                res += fmt.Sprintf("(%d, %d), ", i, j)
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* 이중 for 반복문 */
    func nestedForLoop(n: Int) -> String {
        var res = ""
        // i = 1, 2, ..., n-1, n을 반복한다
        for i in 1 ... n {
            // j = 1, 2, ..., n-1, n을 반복한다
            for j in 1 ... n {
                res.append("(\(i), \(j)), ")
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* 이중 for 반복문 */
    function nestedForLoop(n) {
        let res = '';
        // i = 1, 2, ..., n-1, n을 반복한다
        for (let i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* 이중 for 반복문 */
    function nestedForLoop(n: number): string {
        let res = '';
        // i = 1, 2, ..., n-1, n을 반복한다
        for (let i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* 이중 for 반복문 */
    String nestedForLoop(int n) {
      String res = "";
      // i = 1, 2, ..., n-1, n을 반복한다
      for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n을 반복한다
        for (int j = 1; j <= n; j++) {
          res += "($i, $j), ";
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* 이중 for 반복문 */
    fn nested_for_loop(n: i32) -> String {
        let mut res = vec![];
        // i = 1, 2, ..., n-1, n을 반복한다
        for i in 1..=n {
            // j = 1, 2, ..., n-1, n을 반복한다
            for j in 1..=n {
                res.push(format!("({}, {}), ", i, j));
            }
        }
        res.join("")
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* 이중 for 반복문 */
    char *nestedForLoop(int n) {
        // n * n은 해당 점의 개수이며, "(i, j), "의 최대 문자열 길이는 6+10*2이다. 마지막 널 문자 \0을 위한 공간도 추가한다
        int size = n * n * 26 + 1;
        char *res = malloc(size * sizeof(char));
        // i = 1, 2, ..., n-1, n을 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (int j = 1; j <= n; j++) {
                char tmp[26];
                snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
                strncat(res, tmp, size - strlen(res) - 1);
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* 이중 for 반복문 */
    fun nestedForLoop(n: Int): String {
        val res = StringBuilder()
        // i = 1, 2, ..., n-1, n을 반복한다
        for (i in 1..n) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (j in 1..n) {
                res.append(" ($i, $j), ")
            }
        }
        return res.toString()
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### 이중 for 반복문 ###
    def nested_for_loop(n)
      res = ""

      # i = 1, 2, ..., n-1, n을 반복한다
      for i in 1..n
        # j = 1, 2, ..., n-1, n을 반복한다
        for j in 1..n
          res += "(#{i}, #{j}), "
        end
      end

      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A4%91%20for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20i%20%3D%201,%202,%20...,%20n-1,%20n%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20j%20%3D%201,%202,%20...,%20n-1,%20n%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%EC%9D%B4%EC%A4%91%20for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%98%20%EC%88%9C%ED%9A%8C%20%EA%B2%B0%EA%B3%BC%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%EC%9D%B4%EC%A4%91%20for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20i%20%3D%201,%202,%20...,%20n-1,%20n%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20j%20%3D%201,%202,%20...,%20n-1,%20n%EC%9D%84%20%EB%B0%98%EB%B3%B5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%EC%9D%B4%EC%A4%91%20for%20%EB%B0%98%EB%B3%B5%EB%AC%B8%EC%9D%98%20%EC%88%9C%ED%9A%8C%20%EA%B2%B0%EA%B3%BC%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(2-2)은 이 중첩 반복문의 순서도다.

![중첩 반복문의 순서도](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> 그림 2-2 &nbsp; 중첩 반복문의 순서도 </p>

이 경우 함수의 연산 횟수는 $n^2$에 비례한다. 즉, 알고리즘 실행 시간과 입력 데이터 크기 $n$ 사이에는 ‘제곱 관계’가 있다.

반복문을 계속 중첩할 수도 있다. 한 번 중첩할 때마다 ‘차원이 하나씩 늘어나’ 시간 복잡도가 ‘세제곱 관계’, ‘네제곱 관계’ 등으로 높아진다.

## 2.2.2 &nbsp; 재귀

 <u>재귀(recursion)</u>는 함수가 자기 자신을 호출하여 문제를 해결하는 알고리즘 전략이다. 크게 두 단계로 이루어진다.

1. **내려가기**: 프로그램이 자기 자신을 계속 더 깊이 호출한다. 보통 더 작거나 단순한 인수를 전달하며, ‘종료 조건’에 도달할 때까지 이어진다.
2. **돌아오기**: ‘종료 조건’에 도달하면 가장 깊은 재귀 함수부터 한 단계씩 반환하며, 각 단계의 결과를 모은다.

구현 관점에서 보면 재귀 코드는 크게 세 요소로 이루어진다.

1. **종료 조건**: ‘내려가기’에서 ‘돌아오기’로 전환할 시점을 결정한다.
2. **재귀 호출**: ‘내려가기’에 해당한다. 함수가 자기 자신을 호출하며, 보통 더 작거나 단순한 인수를 입력한다.
3. **결과 반환**: ‘돌아오기’에 해당한다. 현재 재귀 단계의 결과를 이전 단계로 반환한다.

다음 코드를 보면, 함수 `recur(n)`을 호출하기만 하면 $1 + 2 + \dots + n$을 계산할 수 있다.

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """재귀"""
        # 종료 조건
        if n == 1:
            return 1
        # 내려가기: 재귀 호출
        res = recur(n - 1)
        # 돌아오기: 결과 반환
        return n + res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 재귀 */
    int recur(int n) {
        // 종료 조건
        if (n == 1)
            return 1;
        // 내려가기: 재귀 호출
        int res = recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 재귀 */
    int recur(int n) {
        // 종료 조건
        if (n == 1)
            return 1;
        // 내려가기: 재귀 호출
        int res = recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 재귀 */
    int Recur(int n) {
        // 종료 조건
        if (n == 1)
            return 1;
        // 내려가기: 재귀 호출
        int res = Recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 재귀 */
    func recur(n int) int {
        // 종료 조건
        if n == 1 {
            return 1
        }
        // 내려가기: 재귀 호출
        res := recur(n - 1)
        // 돌아오기: 결과 반환
        return n + res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 재귀 */
    func recur(n: Int) -> Int {
        // 종료 조건
        if n == 1 {
            return 1
        }
        // 내려가기: 재귀 호출
        let res = recur(n: n - 1)
        // 돌아오기: 결과 반환
        return n + res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 재귀 */
    function recur(n) {
        // 종료 조건
        if (n === 1) return 1;
        // 내려가기: 재귀 호출
        const res = recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 재귀 */
    function recur(n: number): number {
        // 종료 조건
        if (n === 1) return 1;
        // 내려가기: 재귀 호출
        const res = recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 재귀 */
    int recur(int n) {
      // 종료 조건
      if (n == 1) return 1;
      // 내려가기: 재귀 호출
      int res = recur(n - 1);
      // 돌아오기: 결과 반환
      return n + res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 재귀 */
    fn recur(n: i32) -> i32 {
        // 종료 조건
        if n == 1 {
            return 1;
        }
        // 내려가기: 재귀 호출
        let res = recur(n - 1);
        // 돌아오기: 결과 반환
        n + res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 재귀 */
    int recur(int n) {
        // 종료 조건
        if (n == 1)
            return 1;
        // 내려가기: 재귀 호출
        int res = recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 재귀 */
    fun recur(n: Int): Int {
        // 종료 조건
        if (n == 1)
            return 1
        // 내려가기: 재귀 호출
        val res = recur(n - 1)
        // 돌아오기: 결과 반환
        return n + res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 재귀 ###
    def recur(n)
      # 종료 조건
      return 1 if n == 1
      # 내려가기: 재귀 호출
      res = recur(n - 1)
      # 돌아오기: 결과 반환
      n + res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%EB%82%B4%EB%A0%A4%EA%B0%80%EA%B8%B0%3A%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%EB%8F%8C%EC%95%84%EC%98%A4%EA%B8%B0%3A%20%EA%B2%B0%EA%B3%BC%20%EB%B0%98%ED%99%98%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%EC%9E%AC%EA%B7%80%20%ED%95%A8%EC%88%98%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%EB%82%B4%EB%A0%A4%EA%B0%80%EA%B8%B0%3A%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%EB%8F%8C%EC%95%84%EC%98%A4%EA%B8%B0%3A%20%EA%B2%B0%EA%B3%BC%20%EB%B0%98%ED%99%98%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%EC%9E%AC%EA%B7%80%20%ED%95%A8%EC%88%98%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(2-3)은 이 함수의 재귀 과정을 보여 준다.

![합계 함수의 재귀 과정](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> 그림 2-3 &nbsp; 합계 함수의 재귀 과정 </p>

반복과 재귀는 계산 결과가 같을 수 있지만, **문제를 생각하고 해결하는 방식은 완전히 다르다**.

- **반복**: ‘상향식’으로 문제를 해결한다. 가장 기본적인 단계에서 시작해 그 단계를 계속 반복하거나 누적하여 작업을 완료한다.
- **재귀**: ‘하향식’으로 문제를 해결한다. 원래 문제를 같은 형태의 더 작은 부분 문제로 나눈다. 그런 다음 부분 문제를 더 작은 부분 문제로 계속 나누다가 기저 사례에 도달하면 멈춘다(기저 사례의 해는 이미 알고 있다).

앞의 합계 함수를 예로 들어, 문제를 $f(n) = 1 + 2 + \dots + n$이라고 하자.

- **반복**: 반복문에서 합을 구하는 과정을 재현한다. $1$부터 $n$까지 순회하면서 매번 더하면 $f(n)$을 구할 수 있다.
- **재귀**: 문제를 부분 문제 $f(n) = n + f(n-1)$로 나누고, 계속 재귀적으로 나누다가 기저 사례 $f(1) = 1$에 도달하면 멈춘다.

### 1. &nbsp; 호출 스택

재귀 함수가 자기 자신을 호출할 때마다 시스템은 새로 실행되는 함수를 위해 메모리를 할당하고 지역 변수, 호출 주소 등의 정보를 저장한다. 이로 인해 두 가지 결과가 나타난다.

- 함수의 문맥 데이터는 ‘스택 프레임 공간’이라는 메모리 영역에 저장되며, 함수가 반환된 뒤에야 해제된다. 따라서 **재귀는 보통 반복보다 더 많은 메모리 공간을 사용한다**.
- 재귀 함수 호출에는 추가 비용이 발생한다. **따라서 재귀는 보통 반복문보다 시간 효율이 낮다**.

아래 그림(2-4)과 같이 종료 조건에 도달하기 전에는 아직 반환되지 않은 재귀 함수가 $n$개 동시에 존재하므로, **재귀 깊이는 $n$이다**.

![재귀 호출 깊이](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> 그림 2-4 &nbsp; 재귀 호출 깊이 </p>

실제로 프로그래밍 언어가 허용하는 재귀 깊이는 보통 제한되어 있으며, 재귀가 너무 깊어지면 스택 오버플로 오류가 발생할 수 있다.

### 2. &nbsp; 꼬리 재귀

흥미롭게도 **함수가 반환하기 직전의 마지막 단계에서 재귀 호출을 수행하면**, 컴파일러나 인터프리터가 이를 최적화하여 반복과 비슷한 공간 효율을 얻을 수 있다. 이런 경우를 <u>꼬리 재귀(tail recursion)</u>라고 한다.

- **일반 재귀**: 함수가 이전 단계의 함수로 반환된 뒤에도 실행할 코드가 남아 있으므로, 시스템은 이전 호출의 문맥을 저장해야 한다.
- **꼬리 재귀**: 재귀 호출이 함수 반환 전의 마지막 연산이다. 따라서 이전 단계로 반환된 뒤에 다른 연산을 수행할 필요가 없으므로, 시스템은 이전 함수의 문맥을 저장하지 않아도 된다.

$1 + 2 + \dots + n$을 계산하는 예에서 결과 변수 `res`를 함수 매개변수로 두면 꼬리 재귀를 구현할 수 있다.

=== "Python"

    ```python title="recursion.py"
    def tail_recur(n, res):
        """꼬리 재귀"""
        # 종료 조건
        if n == 0:
            return res
        # 꼬리 재귀 호출
        return tail_recur(n - 1, res + n)
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 꼬리 재귀 */
    int tailRecur(int n, int res) {
        // 종료 조건
        if (n == 0)
            return res;
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 꼬리 재귀 */
    int tailRecur(int n, int res) {
        // 종료 조건
        if (n == 0)
            return res;
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n);
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 꼬리 재귀 */
    int TailRecur(int n, int res) {
        // 종료 조건
        if (n == 0)
            return res;
        // 꼬리 재귀 호출
        return TailRecur(n - 1, res + n);
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 꼬리 재귀 */
    func tailRecur(n int, res int) int {
        // 종료 조건
        if n == 0 {
            return res
        }
        // 꼬리 재귀 호출
        return tailRecur(n-1, res+n)
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 꼬리 재귀 */
    func tailRecur(n: Int, res: Int) -> Int {
        // 종료 조건
        if n == 0 {
            return res
        }
        // 꼬리 재귀 호출
        return tailRecur(n: n - 1, res: res + n)
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 꼬리 재귀 */
    function tailRecur(n, res) {
        // 종료 조건
        if (n === 0) return res;
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n);
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 꼬리 재귀 */
    function tailRecur(n: number, res: number): number {
        // 종료 조건
        if (n === 0) return res;
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 꼬리 재귀 */
    int tailRecur(int n, int res) {
      // 종료 조건
      if (n == 0) return res;
      // 꼬리 재귀 호출
      return tailRecur(n - 1, res + n);
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 꼬리 재귀 */
    fn tail_recur(n: i32, res: i32) -> i32 {
        // 종료 조건
        if n == 0 {
            return res;
        }
        // 꼬리 재귀 호출
        tail_recur(n - 1, res + n)
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 꼬리 재귀 */
    int tailRecur(int n, int res) {
        // 종료 조건
        if (n == 0)
            return res;
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 꼬리 재귀 */
    tailrec fun tailRecur(n: Int, res: Int): Int {
        // tailrec 키워드를 추가하여 꼬리 재귀 최적화를 활성화한다
        // 종료 조건
        if (n == 0)
            return res
        // 꼬리 재귀 호출
        return tailRecur(n - 1, res + n)
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 꼬리 재귀 ###
    def tail_recur(n, res)
      # 종료 조건
      return res if n == 0
      # 꼬리 재귀 호출
      tail_recur(n - 1, res + n)
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%ED%95%A8%EC%88%98%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%EA%BC%AC%EB%A6%AC%20%EC%9E%AC%EA%B7%80%20%ED%95%A8%EC%88%98%EB%A1%9C%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

꼬리 재귀의 실행 과정은 아래 그림(2-5)과 같다. 일반 재귀와 꼬리 재귀를 비교하면 합을 구하는 시점이 다르다.

- **일반 재귀**: ‘돌아오기’ 과정에서 합을 구한다. 각 단계가 반환된 뒤에 덧셈을 한 번씩 수행한다.
- **꼬리 재귀**: ‘내려가기’ 과정에서 합을 구한다. ‘돌아오기’ 과정에서는 단계별로 반환만 하면 된다.

![꼬리 재귀 과정](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> 그림 2-5 &nbsp; 꼬리 재귀 과정 </p>

!!! tip "참고"

    많은 컴파일러와 인터프리터가 꼬리 재귀 최적화를 지원하지 않는다는 점에 주의하자. 예를 들어 Python은 기본적으로 꼬리 재귀 최적화를 지원하지 않으므로, 함수가 꼬리 재귀 형태여도 스택 오버플로 문제가 발생할 수 있다.

### 3. &nbsp; 재귀 트리

‘분할 정복’과 관련된 알고리즘 문제에서는 재귀가 반복보다 생각하기 쉽고 코드도 읽기 쉬운 경우가 많다. ‘피보나치 수열’을 예로 살펴보자.

!!! question "문제"

    피보나치 수열 $0, 1, 1, 2, 3, 5, 8, 13, \dots$가 주어졌을 때, 이 수열의 $n$번째 수를 구하라.

피보나치 수열의 $n$번째 수를 $f(n)$이라고 하면 다음 두 가지 사실을 쉽게 알 수 있다.

- 수열의 첫 두 수는 $f(1) = 0$과 $f(2) = 1$이다.
- 수열의 각 수는 앞의 두 수의 합이다. 즉, $f(n) = f(n - 1) + f(n - 2)$이다.

점화 관계에 따라 재귀 호출을 하고 첫 두 수를 종료 조건으로 삼으면 재귀 코드를 작성할 수 있다. `fib(n)`을 호출하면 피보나치 수열의 $n$번째 수를 얻는다.

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """피보나치 수열: 재귀"""
        # 종료 조건 f(1) = 0, f(2) = 1
        if n == 1 or n == 2:
            return n - 1
        # 재귀 호출 f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        # 결과 f(n)을 반환한다
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 피보나치 수열: 재귀 */
    int fib(int n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 피보나치 수열: 재귀 */
    int fib(int n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 피보나치 수열: 재귀 */
    int Fib(int n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 피보나치 수열: 재귀 */
    func fib(n int) int {
        // 종료 조건 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        res := fib(n-1) + fib(n-2)
        // 결과 f(n)을 반환한다
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 피보나치 수열: 재귀 */
    func fib(n: Int) -> Int {
        // 종료 조건 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        let res = fib(n: n - 1) + fib(n: n - 2)
        // 결과 f(n)을 반환한다
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 피보나치 수열: 재귀 */
    function fib(n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 피보나치 수열: 재귀 */
    function fib(n: number): number {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 피보나치 수열: 재귀 */
    int fib(int n) {
      // 종료 조건 f(1) = 0, f(2) = 1
      if (n == 1 || n == 2) return n - 1;
      // 재귀 호출 f(n) = f(n-1) + f(n-2)
      int res = fib(n - 1) + fib(n - 2);
      // 결과 f(n)을 반환한다
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 피보나치 수열: 재귀 */
    fn fib(n: i32) -> i32 {
        // 종료 조건 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1;
        }
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        let res = fib(n - 1) + fib(n - 2);
        // 결과를 반환한다
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 피보나치 수열: 재귀 */
    int fib(int n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 피보나치 수열: 재귀 */
    fun fib(n: Int): Int {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        val res = fib(n - 1) + fib(n - 2)
        // 결과 f(n)을 반환한다
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 피보나치 수열: 재귀 ###
    def fib(n)
      # 종료 조건 f(1) = 0, f(2) = 1
      return n - 1 if n == 1 || n == 2
      # 재귀 호출 f(n) = f(n-1) + f(n-2)
      res = fib(n - 1) + fib(n - 2)
      # 결과 f(n)을 반환한다
      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%94%BC%EB%B3%B4%EB%82%98%EC%B9%98%20%EC%88%98%EC%97%B4%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%20f%28n%29%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%ED%94%BC%EB%B3%B4%EB%82%98%EC%B9%98%20%EC%88%98%EC%97%B4%EC%9D%98%20%7Bn%7D%EB%B2%88%EC%A7%B8%20%ED%95%AD%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%94%BC%EB%B3%B4%EB%82%98%EC%B9%98%20%EC%88%98%EC%97%B4%3A%20%EC%9E%AC%EA%B7%80%22%22%22%0A%20%20%20%20%23%20%EC%A2%85%EB%A3%8C%20%EC%A1%B0%EA%B1%B4%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%EA%B2%B0%EA%B3%BC%20f%28n%29%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%ED%94%BC%EB%B3%B4%EB%82%98%EC%B9%98%20%EC%88%98%EC%97%B4%EC%9D%98%20%7Bn%7D%EB%B2%88%EC%A7%B8%20%ED%95%AD%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

위 코드는 함수 안에서 두 번의 재귀 호출을 수행한다. **이는 하나의 호출에서 두 개의 호출 분기가 생긴다는 뜻이다**. 아래 그림(2-6)과 같이 재귀 호출을 계속하면 최종적으로 $n$개 층으로 이루어진 <u>재귀 트리(recursion tree)</u>가 만들어진다.

![피보나치 수열의 재귀 트리](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> 그림 2-6 &nbsp; 피보나치 수열의 재귀 트리 </p>

본질적으로 재귀는 ‘문제를 더 작은 부분 문제로 나누는’ 사고방식을 보여 준다. 이러한 분할 정복 전략은 매우 중요하다.

- 알고리즘 관점에서 탐색, 정렬, 백트래킹, 분할 정복, 동적 계획법 등 중요한 알고리즘 전략 다수가 이 사고방식을 직간접적으로 활용한다.
- 자료 구조 관점에서 재귀는 연결 리스트, 트리, 그래프와 관련된 문제를 다루는 데 자연스럽게 어울린다. 이들은 분할 정복 관점으로 분석하기에 매우 적합하기 때문이다.

## 2.2.3 &nbsp; 두 방식의 비교

앞의 내용을 정리하면, 아래 표(2-1)와 같이 반복과 재귀는 구현, 성능, 적용 범위에서 차이가 있다.

<p align="center"> 표 2-1 &nbsp; 반복과 재귀의 특징 비교 </p>

<div class="center-table" markdown>

|          | 반복                                   | 재귀                                                         |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| 구현 방식 | 반복 구조                               | 함수가 자기 자신을 호출                                                 |
| 시간 효율 | 보통 효율이 높고 함수 호출 비용이 없음           | 함수 호출마다 비용이 발생함                                     |
| 메모리 사용 | 보통 고정 크기의 메모리 공간을 사용함             | 함수 호출이 누적되면 스택 프레임 공간을 많이 사용할 수 있음                           |
| 적합한 문제 | 간단한 반복 작업에 적합하며 코드가 직관적이고 읽기 쉬움 | 트리, 그래프, 분할 정복, 백트래킹 등 부분 문제로 나누는 문제에 적합하며 코드 구조가 간결하고 명확함 |

</div>

!!! tip "참고"

    다음 내용이 이해하기 어렵다면 ‘스택’ 장을 읽은 뒤에 다시 복습해도 좋다.

그렇다면 반복과 재귀는 내부적으로 어떤 관계가 있을까? 앞의 재귀 함수를 예로 들면, 합을 구하는 연산은 재귀의 ‘돌아오기’ 단계에서 수행된다. 즉, 가장 먼저 호출된 함수가 실제로는 가장 나중에 자신의 덧셈을 마친다. **이 작동 방식은 스택의 ‘후입선출’ 원리와 통한다**.

실제로 ‘호출 스택’, ‘스택 프레임 공간’ 같은 재귀 관련 용어에도 재귀와 스택의 밀접한 관계가 드러난다.

1. **내려가기**: 함수가 호출되면 시스템은 ‘호출 스택’에 새로운 스택 프레임을 할당하여 함수의 지역 변수, 매개변수, 반환 주소 등의 데이터를 저장한다.
2. **돌아오기**: 함수가 실행을 마치고 반환되면 해당 스택 프레임이 ‘호출 스택’에서 제거되고, 이전 함수의 실행 환경이 복원된다.

따라서 **명시적인 스택으로 호출 스택의 동작을 재현하면**, 재귀를 반복 형태로 바꿀 수 있다.

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """반복으로 재귀 구현"""
        # 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        stack = []
        res = 0
        # 내려가기: 재귀 호출
        for i in range(n, 0, -1):
            # 스택에 삽입하여 내려가는 과정을 모방한다
            stack.append(i)
        # 돌아오기: 결과 반환
        while stack:
            # 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 반복으로 재귀 구현 */
    int forLoopRecur(int n) {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        stack<int> stack;
        int res = 0;
        // 내려가기: 재귀 호출
        for (int i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i);
        }
        // 돌아오기: 결과 반환
        while (!stack.empty()) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 반복으로 재귀 구현 */
    int forLoopRecur(int n) {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // 내려가기: 재귀 호출
        for (int i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i);
        }
        // 돌아오기: 결과 반환
        while (!stack.isEmpty()) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 반복으로 재귀 구현 */
    int ForLoopRecur(int n) {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        Stack<int> stack = new();
        int res = 0;
        // 내려가기: 재귀 호출
        for (int i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.Push(i);
        }
        // 돌아오기: 결과 반환
        while (stack.Count > 0) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 반복으로 재귀 구현 */
    func forLoopRecur(n int) int {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        stack := list.New()
        res := 0
        // 내려가기: 재귀 호출
        for i := n; i > 0; i-- {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.PushBack(i)
        }
        // 돌아오기: 결과 반환
        for stack.Len() != 0 {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.Back().Value.(int)
            stack.Remove(stack.Back())
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 반복으로 재귀 구현 */
    func forLoopRecur(n: Int) -> Int {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        var stack: [Int] = []
        var res = 0
        // 내려가기: 재귀 호출
        for i in (1 ... n).reversed() {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.append(i)
        }
        // 돌아오기: 결과 반환
        while !stack.isEmpty {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.removeLast()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 반복으로 재귀 구현 */
    function forLoopRecur(n) {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        const stack = [];
        let res = 0;
        // 내려가기: 재귀 호출
        for (let i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i);
        }
        // 돌아오기: 결과 반환
        while (stack.length) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 반복으로 재귀 구현 */
    function forLoopRecur(n: number): number {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다 
        const stack: number[] = [];
        let res: number = 0;
        // 내려가기: 재귀 호출
        for (let i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i);
        }
        // 돌아오기: 결과 반환
        while (stack.length) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 반복으로 재귀 구현 */
    int forLoopRecur(int n) {
      // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
      List<int> stack = [];
      int res = 0;
      // 내려가기: 재귀 호출
      for (int i = n; i > 0; i--) {
        // 스택에 삽입하여 내려가는 과정을 모방한다
        stack.add(i);
      }
      // 돌아오기: 결과 반환
      while (!stack.isEmpty) {
        // 스택에서 꺼내어 돌아오는 과정을 모방한다
        res += stack.removeLast();
      }
      // res = 1+2+3+...+n
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 반복으로 재귀 구현 */
    fn for_loop_recur(n: i32) -> i32 {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        let mut stack = Vec::new();
        let mut res = 0;
        // 내려가기: 재귀 호출
        for i in (1..=n).rev() {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i);
        }
        // 돌아오기: 결과 반환
        while !stack.is_empty() {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop().unwrap();
        }
        // res = 1+2+3+...+n
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 반복으로 재귀 구현 */
    int forLoopRecur(int n) {
        int stack[1000]; // 큰 배열을 사용하여 스택을 구현한다
        int top = -1;    // 스택의 맨 위 인덱스
        int res = 0;
        // 내려가기: 재귀 호출
        for (int i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack[1 + top++] = i;
        }
        // 돌아오기: 결과 반환
        while (top >= 0) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack[top--];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 반복으로 재귀 구현 */
    fun forLoopRecur(n: Int): Int {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        val stack = Stack<Int>()
        var res = 0
        // 내려가기: 재귀 호출
        for (i in n downTo 0) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.push(i)
        }
        // 돌아오기: 결과 반환
        while (stack.isNotEmpty()) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.pop()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 반복으로 재귀 구현 ###
    def for_loop_recur(n)
      # 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
      stack = []
      res = 0

      # 내려가기: 재귀 호출
      for i in n.downto(0)
        # 스택에 삽입하여 내려가는 과정을 모방한다
        stack << i
      end
      # 돌아오기: 결과 반환
      while !stack.empty?
        res += stack.pop
      end

      # res = 1+2+3+...+n
      res
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%B0%98%EB%B3%B5%EC%9C%BC%EB%A1%9C%20%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%22%22%22%0A%20%20%20%20%23%20%EB%AA%85%EC%8B%9C%EC%A0%81%EC%9D%B8%20%EC%8A%A4%ED%83%9D%EC%9D%84%20%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC%20%EC%8B%9C%EC%8A%A4%ED%85%9C%20%ED%98%B8%EC%B6%9C%20%EC%8A%A4%ED%83%9D%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%EB%82%B4%EB%A0%A4%EA%B0%80%EA%B8%B0%3A%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%98%EC%97%AC%20%EB%82%B4%EB%A0%A4%EA%B0%80%EB%8A%94%20%EA%B3%BC%EC%A0%95%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%EB%8F%8C%EC%95%84%EC%98%A4%EA%B8%B0%3A%20%EA%B2%B0%EA%B3%BC%20%EB%B0%98%ED%99%98%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EC%96%B4%20%EB%8F%8C%EC%95%84%EC%98%A4%EB%8A%94%20%EA%B3%BC%EC%A0%95%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%EB%B0%98%EB%B3%B5%EC%9C%BC%EB%A1%9C%20%EC%9E%AC%EA%B7%80%EB%A5%BC%20%EA%B5%AC%ED%98%84%ED%95%98%EC%97%AC%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%B0%98%EB%B3%B5%EC%9C%BC%EB%A1%9C%20%EC%9E%AC%EA%B7%80%20%EA%B5%AC%ED%98%84%22%22%22%0A%20%20%20%20%23%20%EB%AA%85%EC%8B%9C%EC%A0%81%EC%9D%B8%20%EC%8A%A4%ED%83%9D%EC%9D%84%20%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC%20%EC%8B%9C%EC%8A%A4%ED%85%9C%20%ED%98%B8%EC%B6%9C%20%EC%8A%A4%ED%83%9D%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%EB%82%B4%EB%A0%A4%EA%B0%80%EA%B8%B0%3A%20%EC%9E%AC%EA%B7%80%20%ED%98%B8%EC%B6%9C%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%82%BD%EC%9E%85%ED%95%98%EC%97%AC%20%EB%82%B4%EB%A0%A4%EA%B0%80%EB%8A%94%20%EA%B3%BC%EC%A0%95%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%EB%8F%8C%EC%95%84%EC%98%A4%EA%B8%B0%3A%20%EA%B2%B0%EA%B3%BC%20%EB%B0%98%ED%99%98%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B4%EC%96%B4%20%EB%8F%8C%EC%95%84%EC%98%A4%EB%8A%94%20%EA%B3%BC%EC%A0%95%EC%9D%84%20%EB%AA%A8%EB%B0%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%EB%B0%98%EB%B3%B5%EC%9C%BC%EB%A1%9C%20%EC%9E%AC%EA%B7%80%EB%A5%BC%20%EA%B5%AC%ED%98%84%ED%95%98%EC%97%AC%20%EA%B5%AC%ED%95%9C%20%ED%95%A9%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

위 코드를 보면 재귀를 반복으로 바꾸자 코드가 더 복잡해졌다. 반복과 재귀는 많은 경우 서로 변환할 수 있지만, 다음 두 가지 이유로 항상 그럴 가치가 있는 것은 아니다.

- 변환한 코드가 더 이해하기 어렵고 가독성이 떨어질 수 있다.
- 복잡한 문제에서는 시스템 호출 스택의 동작을 재현하기가 매우 어려울 수 있다.

결국 **반복과 재귀 중 어떤 것을 선택할지는 문제의 구체적인 성격에 달려 있다**. 실제 프로그래밍에서는 둘의 장단점을 비교하고 상황에 맞는 방법을 선택하는 것이 중요하다.
