---
comments: true
---

# 14.6 &nbsp; 편집 거리 문제

편집 거리 또는 Levenshtein 거리는 두 문자열을 서로 바꾸는 데 필요한 최소 수정 횟수다. 정보 검색과 자연어 처리에서 두 시퀀스의 유사도를 측정할 때 자주 사용한다.

!!! question "문제"

    두 문자열 $s$와 $t$를 입력받아 $s$를 $t$로 바꾸는 데 필요한 최소 편집 횟수를 반환하라.
    
    문자열에 문자를 하나 삽입하거나, 하나 삭제하거나, 한 문자를 임의의 다른 문자로 바꾸는 세 연산을 할 수 있다.

아래 그림(14-27)과 같이 `kitten`을 `sitting`으로 바꾸려면 교체 2회와 추가 1회로 총 3회 편집해야 한다. `hello`를 `algo`로 바꾸려면 교체 2회와 삭제 1회로 총 3회가 필요하다.

![편집 거리 예시 데이터](edit_distance_problem.assets/edit_distance_example.png){ class="animation-figure" }

<p align="center"> 그림 14-27 &nbsp; 편집 거리 예시 데이터 </p>

**편집 거리 문제는 의사 결정 트리 모형으로 자연스럽게 설명할 수 있다**. 문자열은 트리 노드에, 한 번의 결정(편집 연산)은 간선 하나에 대응한다.

아래 그림(14-28)과 같이 연산을 제한하지 않으면 각 노드에서 다양한 연산에 대응하는 많은 간선이 뻗어 나온다. 즉, `hello`에서 `algo`로 가는 경로는 매우 많다.

의사 결정 트리의 관점에서 이 문제의 목표는 노드 `hello`와 노드 `algo` 사이의 최단 경로를 구하는 것이다.

![의사 결정 트리로 표현한 편집 거리 문제](edit_distance_problem.assets/edit_distance_decision_tree.png){ class="animation-figure" }

<p align="center"> 그림 14-28 &nbsp; 의사 결정 트리로 표현한 편집 거리 문제 </p>

### 1. &nbsp; 동적 계획법 접근

**1단계: 매 차례의 결정을 생각하고 상태를 정의하여 $dp$ 테이블을 얻는다**

매 차례의 결정은 문자열 $s$에 편집 연산을 한 번 적용하는 것이다.

부분 문제를 만들려면 편집하는 동안 문제의 크기가 점차 줄어들어야 한다. 문자열 $s$와 $t$의 길이를 각각 $n$과 $m$이라고 하고, 두 문자열의 마지막 문자 $s[n-1]$과 $t[m-1]$을 먼저 살펴보자.

- $s[n-1]$과 $t[m-1]$이 같으면 두 문자를 건너뛰고 $s[n-2]$와 $t[m-2]$를 바로 살펴볼 수 있다.
- $s[n-1]$과 $t[m-1]$이 다르면 $s$에 편집(삽입, 삭제, 교체)을 한 번 적용하여 끝 문자가 같아지게 하고, 이를 건너뛰어 더 작은 문제를 살펴본다.

즉, 문자열 $s$에서 결정(편집 연산)을 할 때마다 $s$와 $t$에서 아직 맞추어야 하는 문자들이 달라진다. 따라서 현재 살펴보는 $s$의 $i$ 번째 문자와 $t$의 $j$ 번째 문자를 상태로 정의하고 $[i, j]$라고 한다.

상태 $[i, j]$의 부분 문제는 **$s$의 앞 $i$ 개 문자를 $t$의 앞 $j$ 개 문자로 바꾸는 최소 편집 횟수**다.

이로써 $(n+1) \times (m+1)$ 크기의 2차원 $dp$ 테이블을 얻는다.

**2단계: 최적 부분 구조를 찾아 상태 전이 식을 도출한다**

부분 문제 $dp[i, j]$에 해당하는 두 문자열의 끝 문자는 $s[i-1]$과 $t[j-1]$이다. 편집 연산에 따라 아래 그림(14-29)의 세 경우로 나뉜다.

1. $s[i-1]$ 뒤에 $t[j-1]$을 추가하면 부분 문제 $dp[i, j-1]$이 남는다.
2. $s[i-1]$을 삭제하면 부분 문제 $dp[i-1, j]$가 남는다.
3. $s[i-1]$을 $t[j-1]$로 바꾸면 부분 문제 $dp[i-1, j-1]$이 남는다.

![편집 거리의 상태 전이](edit_distance_problem.assets/edit_distance_state_transfer.png){ class="animation-figure" }

<p align="center"> 그림 14-29 &nbsp; 편집 거리의 상태 전이 </p>

위 분석으로 최적 부분 구조를 얻는다. $dp[i, j]$의 최소 편집 횟수는 $dp[i, j-1]$, $dp[i-1, j]$, $dp[i-1, j-1]$ 중 가장 작은 편집 횟수에 이번 편집 횟수 $1$을 더한 값이다. 상태 전이 식은 다음과 같다.

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

**$s[i-1]$과 $t[j-1]$이 같으면 현재 문자를 편집할 필요가 없으며**, 이때 상태 전이 식은 다음과 같다.

$$
dp[i, j] = dp[i-1, j-1]
$$

**3단계: 경계 조건과 상태 전이 순서를 정한다**

두 문자열이 모두 비어 있으면 편집 횟수는 $0$이므로 $dp[0, 0] = 0$이다. $s$만 비어 있고 $t$는 비어 있지 않으면 최소 편집 횟수는 $t$의 길이이므로 첫 행은 $dp[0, j] = j$다. 반대로 $s$는 비어 있지 않고 $t$가 비어 있으면 최소 편집 횟수는 $s$의 길이이므로 첫 열은 $dp[i, 0] = i$다.

상태 전이 식에서 $dp[i, j]$는 왼쪽, 위쪽, 왼쪽 위의 해에 의존하므로 이중 반복문으로 전체 $dp$ 테이블을 정방향으로 순회하면 된다.

### 2. &nbsp; 코드 구현

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp(s: str, t: str) -> int:
        """편집 거리: 동적 계획법"""
        n, m = len(s), len(t)
        dp = [[0] * (m + 1) for _ in range(n + 1)]
        # 상태 전이: 첫 번째 행과 첫 번째 열
        for i in range(1, n + 1):
            dp[i][0] = i
        for j in range(1, m + 1):
            dp[0][j] = j
        # 상태 전이: 나머지 행과 열
        for i in range(1, n + 1):
            for j in range(1, m + 1):
                if s[i - 1] == t[j - 1]:
                    # 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
        return dp[n][m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* 편집 거리: 동적 계획법 */
    int editDistanceDP(string s, string t) {
        int n = s.length(), m = t.length();
        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* 편집 거리: 동적 계획법 */
    int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* 편집 거리: 동적 계획법 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* 편집 거리: 동적 계획법 */
    func editDistanceDP(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, m+1)
        }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for i := 1; i <= n; i++ {
            dp[i][0] = i
        }
        for j := 1; j <= m; j++ {
            dp[0][j] = j
        }
        // 상태 전이: 나머지 행과 열
        for i := 1; i <= n; i++ {
            for j := 1; j <= m; j++ {
                if s[i-1] == t[j-1] {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* 편집 거리: 동적 계획법 */
    func editDistanceDP(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for i in 1 ... n {
            dp[i][0] = i
        }
        for j in 1 ... m {
            dp[0][j] = j
        }
        // 상태 전이: 나머지 행과 열
        for i in 1 ... n {
            for j in 1 ... m {
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* 편집 거리: 동적 계획법 */
    function editDistanceDP(s, t) {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
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
    /* 편집 거리: 동적 계획법 */
    function editDistanceDP(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: m + 1 }, () => 0)
        );
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (let i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (let j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i <= n; i++) {
            for (let j = 1; j <= m; j++) {
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
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
    /* 편집 거리: 동적 계획법 */
    int editDistanceDP(String s, String t) {
      int n = s.length, m = t.length;
      List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
      // 상태 전이: 첫 번째 행과 첫 번째 열
      for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
      }
      for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
      }
      // 상태 전이: 나머지 행과 열
      for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
          if (s[i - 1] == t[j - 1]) {
            // 두 문자가 같으면 두 문자를 바로 건너뛴다
            dp[i][j] = dp[i - 1][j - 1];
          } else {
            // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
            dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
          }
        }
      }
      return dp[n][m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* 편집 거리: 동적 계획법 */
    fn edit_distance_dp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![vec![0; m + 1]; n + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for i in 1..=n {
            dp[i][0] = i as i32;
        }
        for j in 1..m {
            dp[0][j] = j as i32;
        }
        // 상태 전이: 나머지 행과 열
        for i in 1..=n {
            for j in 1..=m {
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
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
    /* 편집 거리: 동적 계획법 */
    int editDistanceDP(char *s, char *t, int n, int m) {
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(m + 1, sizeof(int));
        }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        int res = dp[n][m];
        // 메모리 해제
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* 편집 거리: 동적 계획법 */
    fun editDistanceDP(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = Array(n + 1) { IntArray(m + 1) }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (i in 1..n) {
            dp[i][0] = i
        }
        for (j in 1..m) {
            dp[0][j] = j
        }
        // 상태 전이: 나머지 행과 열
        for (i in 1..n) {
            for (j in 1..m) {
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
                }
            }
        }
        return dp[n][m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    ### 편집 거리: 동적 계획법 ###
    def edit_distance_dp(s, t)
      n, m = s.length, t.length
      dp = Array.new(n + 1) { Array.new(m + 1, 0) }
      # 상태 전이: 첫 번째 행과 첫 번째 열
      (1...(n + 1)).each { |i| dp[i][0] = i }
      (1...(m + 1)).each { |j| dp[0][j] = j }
      # 상태 전이: 나머지 행과 열
      for i in 1...(n + 1)
        for j in 1...(m +1)
          if s[i - 1] == t[j - 1]
            # 두 문자가 같으면 두 문자를 바로 건너뛴다
            dp[i][j] = dp[i - 1][j - 1]
          else
            # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
            dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
          end
        end
      end
      dp[n][m]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp%28s%3A%20str,%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%8E%B8%EC%A7%91%20%EA%B1%B0%EB%A6%AC%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28m%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%EA%B3%BC%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20i%0A%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EA%B0%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EB%A5%BC%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%3D%20%EC%82%BD%EC%9E%85,%20%EC%82%AD%EC%A0%9C,%20%EA%B5%90%EC%B2%B4%20%EC%84%B8%20%EC%97%B0%EC%82%B0%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D,%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%29%20%2B%201%0A%20%20%20%20return%20dp%5Bn%5D%5Bm%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20edit_distance_dp%28s,%20t%29%0A%20%20%20%20print%28f%22%7Bs%7D%20%E2%86%92%20%7Bt%7D%20%EB%B3%80%EA%B2%BD%EC%97%90%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp%28s%3A%20str,%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%8E%B8%EC%A7%91%20%EA%B1%B0%EB%A6%AC%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28m%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%EA%B3%BC%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20i%0A%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EA%B0%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EB%A5%BC%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%3D%20%EC%82%BD%EC%9E%85,%20%EC%82%AD%EC%A0%9C,%20%EA%B5%90%EC%B2%B4%20%EC%84%B8%20%EC%97%B0%EC%82%B0%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D,%20dp%5Bi%20-%201%5D%5Bj%20-%201%5D%29%20%2B%201%0A%20%20%20%20return%20dp%5Bn%5D%5Bm%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20edit_distance_dp%28s,%20t%29%0A%20%20%20%20print%28f%22%7Bs%7D%20%E2%86%92%20%7Bt%7D%20%EB%B3%80%EA%B2%BD%EC%97%90%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(14-30)과 같이 편집 거리의 상태 전이는 배낭 문제와 매우 비슷하며, 모두 2차원 격자를 채우는 과정으로 볼 수 있다.

=== "<1>"
    ![편집 거리의 동적 계획법 과정](edit_distance_problem.assets/edit_distance_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![편집 거리 동적 계획법 2단계](edit_distance_problem.assets/edit_distance_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![편집 거리 동적 계획법 3단계](edit_distance_problem.assets/edit_distance_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![편집 거리 동적 계획법 4단계](edit_distance_problem.assets/edit_distance_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![편집 거리 동적 계획법 5단계](edit_distance_problem.assets/edit_distance_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![편집 거리 동적 계획법 6단계](edit_distance_problem.assets/edit_distance_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![편집 거리 동적 계획법 7단계](edit_distance_problem.assets/edit_distance_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![편집 거리 동적 계획법 8단계](edit_distance_problem.assets/edit_distance_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![편집 거리 동적 계획법 9단계](edit_distance_problem.assets/edit_distance_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![편집 거리 동적 계획법 10단계](edit_distance_problem.assets/edit_distance_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![편집 거리 동적 계획법 11단계](edit_distance_problem.assets/edit_distance_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![편집 거리 동적 계획법 12단계](edit_distance_problem.assets/edit_distance_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![편집 거리 동적 계획법 13단계](edit_distance_problem.assets/edit_distance_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![편집 거리 동적 계획법 14단계](edit_distance_problem.assets/edit_distance_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![편집 거리 동적 계획법 15단계](edit_distance_problem.assets/edit_distance_dp_step15.png){ class="animation-figure" }

<p align="center"> 그림 14-30 &nbsp; 편집 거리의 동적 계획법 과정 </p>

### 3. &nbsp; 공간 최적화

$dp[i,j]$는 위쪽 $dp[i-1, j]$, 왼쪽 $dp[i, j-1]$, 왼쪽 위 $dp[i-1, j-1]$에서 전이된다. 그런데 정방향 순회는 왼쪽 위 값 $dp[i-1, j-1]$을 잃고, 역방향 순회는 $dp[i, j-1]$을 미리 계산하지 못하므로 두 순서 모두 그대로는 사용할 수 없다.

이를 위해 변수 `leftup`에 왼쪽 위의 해 $dp[i-1, j-1]$을 잠시 저장하면 왼쪽과 위쪽의 해만 고려하면 된다. 이때는 무한 배낭 문제와 같은 상황이므로 정방향 순회를 사용할 수 있다. 코드는 다음과 같다.

=== "Python"

    ```python title="edit_distance.py"
    def edit_distance_dp_comp(s: str, t: str) -> int:
        """편집 거리: 공간을 최적화한 동적 계획법"""
        n, m = len(s), len(t)
        dp = [0] * (m + 1)
        # 상태 전이: 첫 번째 행
        for j in range(1, m + 1):
            dp[j] = j
        # 상태 전이: 나머지 행
        for i in range(1, n + 1):
            # 상태 전이: 첫 번째 열
            leftup = dp[0]  # dp[i-1, j-1]을 임시로 저장한다
            dp[0] += 1
            # 상태 전이: 나머지 열
            for j in range(1, m + 1):
                temp = dp[j]
                if s[i - 1] == t[j - 1]:
                    # 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup
                else:
                    # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = min(dp[j - 1], dp[j], leftup) + 1
                leftup = temp  # 다음 반복의 dp[i-1, j-1]로 갱신한다
        return dp[m]
    ```

=== "C++"

    ```cpp title="edit_distance.cpp"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int editDistanceDPComp(string s, string t) {
        int n = s.length(), m = t.length();
        vector<int> dp(m + 1, 0);
        // 상태 전이: 첫 번째 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }
    ```

=== "Java"

    ```java title="edit_distance.java"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }
    ```

=== "C#"

    ```csharp title="edit_distance.cs"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }
    ```

=== "Go"

    ```go title="edit_distance.go"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    func editDistanceDPComp(s string, t string) int {
        n := len(s)
        m := len(t)
        dp := make([]int, m+1)
        // 상태 전이: 첫 번째 행
        for j := 1; j <= m; j++ {
            dp[j] = j
        }
        // 상태 전이: 나머지 행
        for i := 1; i <= n; i++ {
            // 상태 전이: 첫 번째 열
            leftUp := dp[0] // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i
            // 상태 전이: 나머지 열
            for j := 1; j <= m; j++ {
                temp := dp[j]
                if s[i-1] == t[j-1] {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftUp
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
                }
                leftUp = temp // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m]
    }
    ```

=== "Swift"

    ```swift title="edit_distance.swift"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    func editDistanceDPComp(s: String, t: String) -> Int {
        let n = s.utf8CString.count
        let m = t.utf8CString.count
        var dp = Array(repeating: 0, count: m + 1)
        // 상태 전이: 첫 번째 행
        for j in 1 ... m {
            dp[j] = j
        }
        // 상태 전이: 나머지 행
        for i in 1 ... n {
            // 상태 전이: 첫 번째 열
            var leftup = dp[0] // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i
            // 상태 전이: 나머지 열
            for j in 1 ... m {
                let temp = dp[j]
                if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m]
    }
    ```

=== "JS"

    ```javascript title="edit_distance.js"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    function editDistanceDPComp(s, t) {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // 상태 전이: 첫 번째 행
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (let i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            let leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }
    ```

=== "TS"

    ```typescript title="edit_distance.ts"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    function editDistanceDPComp(s: string, t: string): number {
        const n = s.length,
            m = t.length;
        const dp = new Array(m + 1).fill(0);
        // 상태 전이: 첫 번째 행
        for (let j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (let i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            let leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (let j = 1; j <= m; j++) {
                const temp = dp[j];
                if (s.charAt(i - 1) === t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }
    ```

=== "Dart"

    ```dart title="edit_distance.dart"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int editDistanceDPComp(String s, String t) {
      int n = s.length, m = t.length;
      List<int> dp = List.filled(m + 1, 0);
      // 상태 전이: 첫 번째 행
      for (int j = 1; j <= m; j++) {
        dp[j] = j;
      }
      // 상태 전이: 나머지 행
      for (int i = 1; i <= n; i++) {
        // 상태 전이: 첫 번째 열
        int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
        dp[0] = i;
        // 상태 전이: 나머지 열
        for (int j = 1; j <= m; j++) {
          int temp = dp[j];
          if (s[i - 1] == t[j - 1]) {
            // 두 문자가 같으면 두 문자를 바로 건너뛴다
            dp[j] = leftup;
          } else {
            // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
            dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
          }
          leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
        }
      }
      return dp[m];
    }
    ```

=== "Rust"

    ```rust title="edit_distance.rs"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
        let (n, m) = (s.len(), t.len());
        let mut dp = vec![0; m + 1];
        // 상태 전이: 첫 번째 행
        for j in 1..m {
            dp[j] = j as i32;
        }
        // 상태 전이: 나머지 행
        for i in 1..=n {
            // 상태 전이: 첫 번째 열
            let mut leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i as i32;
            // 상태 전이: 나머지 열
            for j in 1..=m {
                let temp = dp[j];
                if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        dp[m]
    }
    ```

=== "C"

    ```c title="edit_distance.c"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int editDistanceDPComp(char *s, char *t, int n, int m) {
        int *dp = calloc(m + 1, sizeof(int));
        // 상태 전이: 첫 번째 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        int res = dp[m];
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="edit_distance.kt"
    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    fun editDistanceDPComp(s: String, t: String): Int {
        val n = s.length
        val m = t.length
        val dp = IntArray(m + 1)
        // 상태 전이: 첫 번째 행
        for (j in 1..m) {
            dp[j] = j
        }
        // 상태 전이: 나머지 행
        for (i in 1..n) {
            // 상태 전이: 첫 번째 열
            var leftup = dp[0] // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i
            // 상태 전이: 나머지 열
            for (j in 1..m) {
                val temp = dp[j]
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
                }
                leftup = temp // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m]
    }
    ```

=== "Ruby"

    ```ruby title="edit_distance.rb"
    ### 편집 거리: 공간을 최적화한 동적 계획법 ###
    def edit_distance_dp_comp(s, t)
      n, m = s.length, t.length
      dp = Array.new(m + 1, 0)
      # 상태 전이: 첫 번째 행
      (1...(m + 1)).each { |j| dp[j] = j }
      # 상태 전이: 나머지 행
      for i in 1...(n + 1)
        # 상태 전이: 첫 번째 열
        leftup = dp.first # dp[i-1, j-1]을 임시로 저장한다
        dp[0] += 1
        # 상태 전이: 나머지 열
        for j in 1...(m + 1)
          temp = dp[j]
          if s[i - 1] == t[j - 1]
            # 두 문자가 같으면 두 문자를 바로 건너뛴다
            dp[j] = leftup
          else
            # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
            dp[j] = [dp[j - 1], dp[j], leftup].min + 1
          end
          leftup = temp # 다음 반복의 dp[i-1, j-1]로 갱신한다
        end
      end
      dp[m]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp_comp%28s%3A%20str,%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%8E%B8%EC%A7%91%20%EA%B1%B0%EB%A6%AC%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%0A%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20%20%20%20%20leftup%20%3D%20dp%5B0%5D%20%20%23%20dp%5Bi-1,%20j-1%5D%EC%9D%84%20%EC%9E%84%EC%8B%9C%EB%A1%9C%20%EC%A0%80%EC%9E%A5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%EC%97%B4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20dp%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EA%B0%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EB%A5%BC%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20leftup%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%3D%20%EC%82%BD%EC%9E%85,%20%EC%82%AD%EC%A0%9C,%20%EA%B5%90%EC%B2%B4%20%EC%84%B8%20%EC%97%B0%EC%82%B0%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D,%20leftup%29%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20leftup%20%3D%20temp%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%B0%98%EB%B3%B5%EC%9D%98%20dp%5Bi-1,%20j-1%5D%EB%A1%9C%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20dp%5Bm%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20edit_distance_dp_comp%28s,%20t%29%0A%20%20%20%20print%28f%22%7Bs%7D%20%E2%86%92%20%7Bt%7D%20%EB%B3%80%EA%B2%BD%EC%97%90%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20edit_distance_dp_comp%28s%3A%20str,%20t%3A%20str%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%ED%8E%B8%EC%A7%91%20%EA%B1%B0%EB%A6%AC%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%0A%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20j%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20%20%20%20%20leftup%20%3D%20dp%5B0%5D%20%20%23%20dp%5Bi-1,%20j-1%5D%EC%9D%84%20%EC%9E%84%EC%8B%9C%EB%A1%9C%20%EC%A0%80%EC%9E%A5%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%2B%3D%201%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%EC%97%B4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20dp%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20s%5Bi%20-%201%5D%20%3D%3D%20t%5Bj%20-%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EA%B0%80%20%EA%B0%99%EC%9C%BC%EB%A9%B4%20%EB%91%90%20%EB%AC%B8%EC%9E%90%EB%A5%BC%20%EB%B0%94%EB%A1%9C%20%EA%B1%B4%EB%84%88%EB%9B%B4%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20leftup%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%3D%20%EC%82%BD%EC%9E%85,%20%EC%82%AD%EC%A0%9C,%20%EA%B5%90%EC%B2%B4%20%EC%84%B8%20%EC%97%B0%EC%82%B0%EC%97%90%20%EB%8C%80%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D,%20leftup%29%20%2B%201%0A%20%20%20%20%20%20%20%20%20%20%20%20leftup%20%3D%20temp%20%20%23%20%EB%8B%A4%EC%9D%8C%20%EB%B0%98%EB%B3%B5%EC%9D%98%20dp%5Bi-1,%20j-1%5D%EB%A1%9C%20%EA%B0%B1%EC%8B%A0%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20dp%5Bm%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20s%20%3D%20%22bag%22%0A%20%20%20%20t%20%3D%20%22pack%22%0A%20%20%20%20n,%20m%20%3D%20len%28s%29,%20len%28t%29%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20edit_distance_dp_comp%28s,%20t%29%0A%20%20%20%20print%28f%22%7Bs%7D%20%E2%86%92%20%7Bt%7D%20%EB%B3%80%EA%B2%BD%EC%97%90%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%ED%8E%B8%EC%A7%91%20%ED%9A%9F%EC%88%98%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>
