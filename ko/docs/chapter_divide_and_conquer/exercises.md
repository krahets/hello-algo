---
comments: true
---

# 12.6 &nbsp; 연습 문제

## 12.6.1 &nbsp; 개념 확인

### 1. &nbsp; 어떤 작업에 분할 정복이 적합한가

한 학생이 ‘먼저 둘로 나누고, 각각 해결한 뒤, 결과를 합치는’ 방식으로 다음 작업을 수행하려 한다.
각 작업이 ‘분할 정복에 적합함’, ‘분할 정복이 가능하지만 전체 작업량은 줄어들지 않음’, ‘두 부분을 독립적으로 해결할 수 없음’ 중 어디에 해당하는지 판단하고 이유를 설명하라.

<!-- numbered-subquestions -->

1. 정렬되지 않은 배열을 정렬한다.
2. 배열의 최댓값을 구한다.
3. 일련의 스택 연산 `push(x)`, `pop()`을 순서대로 실행하고 각 `pop()`에서 얻은 원소를 출력한다.

??? success "참고 답안"

    1. 적합함: 반으로 나눈 뒤 두 부분을 독립적으로 정렬하고, $O(n)$ 시간에 병합한다. 이것이 바로 병합 정렬이다.
    2. 분할 정복이 가능하지만 전체 작업량은 줄어들지 않음: 왼쪽과 오른쪽을 합치면 여전히 $n$개 원소를 모두 확인해야 하므로,
        직접 순회하는 것과 마찬가지로 $O(n)$ 시간이 든다.
    3. 두 부분을 독립적으로 해결할 수 없음: 후반부를 시작할 때의 스택 내용은 전반부의 실행 결과에 따라 달라진다.
        따라서 서로의 결과를 모르는 상태에서 두 부분을 독립적으로 완료할 수 없다.

### 2. &nbsp; 빠른 거듭제곱은 계산을 어떻게 줄이는가

다음 재귀 함수는 분할 정복으로 $x^n$을 계산한다.

=== "Python"

    ```python title="fast_power.py"
    def fast_pow(x: int, n: int) -> int:
        """빠른 거듭제곱"""
        if n == 0:
            return 1
        half = fast_pow(x, n // 2)
        if n % 2 == 0:
            return half * half
        return half * half * x
    ```

=== "C++"

    ```cpp title="fast_power.cpp"
    /* 빠른 거듭제곱 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Java"

    ```java title="fast_power.java"
    /* 빠른 거듭제곱 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "C#"

    ```csharp title="fast_power.cs"
    /* 빠른 거듭제곱 */
    int FastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = FastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Go"

    ```go title="fast_power.go"
    /* 빠른 거듭제곱 */
    func fastPow(x, n int) int {
        if n == 0 {
            return 1
        }
        half := fastPow(x, n/2)
        if n%2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Swift"

    ```swift title="fast_power.swift"
    /* 빠른 거듭제곱 */
    func fastPow(x: Int, n: Int) -> Int {
        if n == 0 {
            return 1
        }
        let half = fastPow(x: x, n: n / 2)
        if n % 2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "JS"

    ```javascript title="fast_power.js"
    /* 빠른 거듭제곱 */
    function fastPow(x, n) {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "TS"

    ```typescript title="fast_power.ts"
    /* 빠른 거듭제곱 */
    function fastPow(x: number, n: number): number {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Dart"

    ```dart title="fast_power.dart"
    /* 빠른 거듭제곱 */
    int fastPow(int x, int n) {
      if (n == 0) {
        return 1;
      }
      int half = fastPow(x, n ~/ 2);
      if (n % 2 == 0) {
        return half * half;
      }
      return half * half * x;
    }
    ```

=== "Rust"

    ```rust title="fast_power.rs"
    /* 빠른 거듭제곱 */
    fn fast_pow(x: i32, n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let half = fast_pow(x, n / 2);
        if n % 2 == 0 {
            return half * half;
        }
        half * half * x
    }
    ```

=== "C"

    ```c title="fast_power.c"
    /* 빠른 거듭제곱 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Kotlin"

    ```kotlin title="fast_power.kt"
    /* 빠른 거듭제곱 */
    fun fastPow(x: Int, n: Int): Int {
        if (n == 0) {
            return 1
        }
        val half = fastPow(x, n / 2)
        if (n % 2 == 0) {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Ruby"

    ```ruby title="fast_power.rb"
    ### 빠른 거듭제곱 ###
    def fast_pow(x, n)
      return 1 if n == 0

      half = fast_pow(x, n / 2)
      return half * half if n.even?

      half * half * x
    end
    ```

`x = 3`, `n = 5`로 설정하고 이 함수를 실행한다.

<!-- numbered-subquestions -->

1. 재귀 호출에서 매개변수 `n`은 차례대로 어떤 값이 되는가?
2. 가장 깊은 호출부터 반환할 때 각 호출은 차례대로 어떤 값을 반환하는가?
3. 곱셈 양쪽에서 같은 부분 문제를 한 번씩 호출하지 않고, 먼저 재귀 호출의 결과를 `half`에 저장하는 이유는 무엇인가?

??? success "참고 답안"

    1. 매개변수는 `5 → 2 → 1 → 0` 순으로 바뀐다. 종료 조건에 도달할 때까지 매번 지수를 절반으로 줄인다.

    2. `n = 0`이면 1을 반환한다. `n = 1`이면 $1×1×3=3$을 반환한다.
        `n = 2`이면 $3×3=9$를, `n = 5`이면 $9×9×3=243$을 반환한다.

    3. 곱셈 양쪽에서 같은 부분 문제를 한 번씩 호출하면 두 재귀 호출은 완전히 같은 계산을 수행한다.
        먼저 결과를 `half`에 저장하면 각 단계에서 재귀 호출을 한 번만 하면 되고, 재귀 깊이는 대략 $\log n$이다.
        두 번 호출하면 같은 계산이 대량으로 반복된다.

### 3. &nbsp; 순회 결과에서 왼쪽 서브트리와 오른쪽 서브트리 나누기

중복된 노드가 없는 이진 트리의 전위 순회와 중위 순회 결과는 다음과 같다.

- 전위 순회: `[A, B, D, E, C]`
- 중위 순회: `[D, B, E, A, C]`

루트 노드 수준에서만 나누고, 더 깊이 재귀적으로 나누거나 트리 전체를 그릴 필요는 없다.

<!-- numbered-subquestions -->

1. 루트 노드는 무엇인가?
2. 중위 순회에서 왼쪽 서브트리와 오른쪽 서브트리에 해당하는 구간은 각각 어디인가?
3. 전위 순회에서 왼쪽 서브트리와 오른쪽 서브트리에 해당하는 구간은 각각 어디인가? 루트 노드의 직접적인 자식은 누구인가?

??? success "참고 답안"

    1. 전위 순회의 첫 번째 노드가 루트 노드이므로 루트는 `A`다.

    2. `A`를 기준으로 중위 순회가 두 부분으로 나뉜다. 왼쪽 서브트리는 `[D, B, E]`, 오른쪽 서브트리는 `[C]`다.

    3. 왼쪽 서브트리에 노드가 3개 있으므로 전위 순회에서 루트 노드 `A` 다음의 원소 3개가 왼쪽 서브트리에 속한다.
        즉 `[B, D, E]`가 왼쪽 서브트리이고, 나머지 `[C]`가 오른쪽 서브트리다.
        따라서 루트 노드의 왼쪽 자식은 `B`, 오른쪽 자식은 `C`다.

## 12.6.2 &nbsp; 프로그래밍 연습

### 1. &nbsp; 빠른 거듭제곱

실수 `x`와 정수 `n`이 주어진다. 언어에서 제공하는 거듭제곱 함수를 호출하지 않고 $x^n$을 계산하라.
재귀적인 분할 정복을 사용하여 매번 지수를 절반으로 줄이고, 이미 계산한 부분 문제의 결과를 재사용해야 한다.
이 문제에서는 `x = 0`인 경우를 포함하여 $x^0=1$로 정한다. `n < 0`일 때는 `x != 0`임이 보장되며, 답을 $(1/x)^{-n}$으로 바꾸어 구할 수 있다.

??? tip "풀이 힌트"

    1. n이 0이면 답은 1이다.
    2. x의 n // 2제곱을 계산하여 half에 저장한다. 같은 재귀 호출을 두 번 하지 마라.
    3. n < 0이면 먼저 x를 1 / x로 바꾸고 n을 -n으로 바꾼다. C++이나 Java에서는 n을 먼저 64비트 정수로 변환하면 가장 작은 32비트 정수의 부호를 반대로 바꿀 때 발생하는 오버플로를 피할 수 있다.

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
