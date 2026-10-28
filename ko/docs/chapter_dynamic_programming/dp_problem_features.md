---
comments: true
---

# 14.2 &nbsp; 동적 계획법 문제의 특성

앞 절에서는 부분 문제로 나누어 원래 문제를 푸는 동적 계획법을 배웠다. 부분 문제로 나누는 것은 일반적인 알고리즘 아이디어지만 분할 정복, 동적 계획법, 백트래킹에서는 강조점이 다르다.

- 분할 정복은 원래 문제를 독립적인 여러 부분 문제로 재귀적으로 나누어 가장 작은 부분 문제까지 내려간다. 이후 되돌아오면서 해를 합쳐 원래 문제의 해를 얻는다.
- 동적 계획법도 문제를 재귀적으로 나누지만, 분할 정복과 달리 부분 문제들이 서로 의존하며 분해 과정에서 중복 부분 문제가 많이 생긴다.
- 백트래킹은 시도와 되돌리기로 가능한 모든 해를 열거하고 가지치기로 불필요한 탐색 가지를 피한다. 원래 문제의 해는 일련의 의사 결정 단계로 이루어지며, 각 결정 단계에 앞선 부분 수열을 부분 문제로 볼 수 있다.

동적 계획법은 최적화 문제에 자주 쓰인다. 이러한 문제에는 중복 부분 문제뿐 아니라 최적 부분 구조와 무후효성이라는 두 가지 특성이 더 있다.

## 14.2.1 &nbsp; 최적 부분 구조

최적 부분 구조의 개념을 더 잘 보여 주도록 계단 오르기 문제를 조금 바꿔 보자.

!!! question "계단 오르기의 최소 비용"

    계단을 한 번에 $1$ 칸 또는 $2$ 칸 오를 수 있다. 각 칸에는 그곳에서 지불할 비용인 음이 아닌 정수가 적혀 있다. 음이 아닌 정수 배열 $cost$가 주어지며, $cost[i]$는 $i$ 번째 칸의 비용이고 $cost[0]$은 바닥(출발점)에 해당한다. 맨 위에 도달하는 데 필요한 최소 비용을 구하라.

아래 그림(14-6)과 같이 $1$, $2$, $3$ 번째 칸의 비용이 각각 $1$, $10$, $1$이면 바닥에서 $3$ 번째 칸까지 오르는 최소 비용은 $2$다.

![3번째 칸까지 오르는 최소 비용](dp_problem_features.assets/min_cost_cs_example.png){ class="animation-figure" }

<p align="center"> 그림 14-6 &nbsp; 3번째 칸까지 오르는 최소 비용 </p>

$i$ 번째 칸까지 오르는 데 지불한 누적 비용을 $dp[i]$라고 하자. $i$ 번째 칸에는 $i - 1$ 번째 또는 $i - 2$ 번째 칸에서만 올 수 있으므로 $dp[i]$는 $dp[i - 1] + cost[i]$ 또는 $dp[i - 2] + cost[i]$다. 비용을 최소화하려면 둘 중 작은 값을 선택해야 한다.

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

여기서 최적 부분 구조의 의미를 알 수 있다. **원래 문제의 최적해는 부분 문제의 최적해로 구성된다**.

이 문제는 분명히 최적 부분 구조를 가진다. 두 부분 문제의 최적해 $dp[i-1]$과 $dp[i-2]$ 중 더 좋은 것을 골라 원래 문제 $dp[i]$의 최적해를 구성하기 때문이다.

그렇다면 앞 절의 계단 오르기 문제도 최적 부분 구조를 가질까? 방법 수를 구하는 것이 목표이므로 단순한 계수 문제처럼 보인다. 하지만 '최대 방법 수를 구하라'고 바꿔 보면 **문제의 의미는 같은데 최적 부분 구조가 드러난다**. $n$ 번째 칸의 최대 방법 수는 $n-1$ 번째와 $n-2$ 번째 칸의 최대 방법 수를 더한 값이다. 이처럼 최적 부분 구조의 해석은 유연하며 문제마다 다른 의미를 가질 수 있다.

상태 전이 식과 초기 상태 $dp[1] = cost[1]$, $dp[2] = cost[2]$를 이용하면 다음 동적 계획법 코드를 얻는다.

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
        """계단 오르기의 최소 비용: 동적 계획법"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        dp = [0] * (n + 1)
        # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1], dp[2] = cost[1], cost[2]
        # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in range(3, n + 1):
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        return dp[n]
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int minCostClimbingStairsDP(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        vector<int> dp(n + 1);
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[] dp = new int[n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[] dp = new int[n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    func minCostClimbingStairsDP(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        dp := make([]int, n+1)
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i := 3; i <= n; i++ {
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    func minCostClimbingStairsDP(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        var dp = Array(repeating: 0, count: n + 1)
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in 3 ... n {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    function minCostClimbingStairsDP(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        const dp = new Array(n + 1);
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    function minCostClimbingStairsDP(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        const dp = new Array(n + 1);
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int minCostClimbingStairsDP(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
      List<int> dp = List.filled(n + 1, 0);
      // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
      dp[1] = cost[1];
      dp[2] = cost[2];
      // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
      for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        let mut dp = vec![-1; n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in 3..=n {
            dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int minCostClimbingStairsDP(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int *dp = calloc(n + 1, sizeof(int));
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
        }
        int res = dp[n];
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    fun minCostClimbingStairsDP(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        val dp = IntArray(n + 1)
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (i in 3..n) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### 계단 오르기의 최소 비용: 동적 계획법 ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
      dp = Array.new(n + 1, 0)
      # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
      dp[1], dp[2] = cost[1], cost[2]
      # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%EC%B4%88%EA%B8%B0%20%EC%83%81%ED%83%9C%3A%20%EA%B0%80%EC%9E%A5%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EB%AF%B8%EB%A6%AC%20%EC%84%A4%EC%A0%95%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%B6%80%ED%84%B0%20%EC%A0%90%EC%B0%A8%20%ED%81%B0%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%A5%BC%20%ED%91%BC%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%ED%95%9C%20%EA%B3%84%EB%8B%A8%EC%9D%98%20%EB%B9%84%EC%9A%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20%7Bcost%7D%EC%9D%B4%EB%8B%A4%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%EA%B3%84%EB%8B%A8%EC%9D%84%20%EB%AA%A8%EB%91%90%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%EC%B4%88%EA%B8%B0%20%EC%83%81%ED%83%9C%3A%20%EA%B0%80%EC%9E%A5%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EB%AF%B8%EB%A6%AC%20%EC%84%A4%EC%A0%95%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%B6%80%ED%84%B0%20%EC%A0%90%EC%B0%A8%20%ED%81%B0%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%A5%BC%20%ED%91%BC%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%ED%95%9C%20%EA%B3%84%EB%8B%A8%EC%9D%98%20%EB%B9%84%EC%9A%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20%7Bcost%7D%EC%9D%B4%EB%8B%A4%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%EA%B3%84%EB%8B%A8%EC%9D%84%20%EB%AA%A8%EB%91%90%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(14-7)은 위 코드의 동적 계획법 과정이다.

![계단 오르기 최소 비용의 동적 계획법 과정](dp_problem_features.assets/min_cost_cs_dp.png){ class="animation-figure" }

<p align="center"> 그림 14-7 &nbsp; 계단 오르기 최소 비용의 동적 계획법 과정 </p>

이 문제도 공간을 최적화하여 1차원을 0차원으로 압축하고, 공간 복잡도를 $O(n)$에서 $O(1)$로 줄일 수 있다.

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
        """계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        a, b = cost[1], cost[2]
        for i in range(3, n + 1):
            a, b = b, min(a, b) + cost[i]
        return b
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    int minCostClimbingStairsDPComp(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    func minCostClimbingStairsDPComp(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        a, b := cost[1], cost[2]
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i := 3; i <= n; i++ {
            tmp := b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        var (a, b) = (cost[1], cost[2])
        for i in 3 ... n {
            (a, b) = (b, min(a, b) + cost[i])
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    function minCostClimbingStairsDPComp(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    function minCostClimbingStairsDPComp(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    int minCostClimbingStairsDPComp(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      int a = cost[1], b = cost[2];
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        };
        let (mut a, mut b) = (cost[1], cost[2]);
        for i in 3..=n {
            let tmp = b;
            b = cmp::min(a, tmp) + cost[i];
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    int minCostClimbingStairsDPComp(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = myMin(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
    fun minCostClimbingStairsDPComp(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        var a = cost[1]
        var b = cost[2]
        for (i in 3..n) {
            val tmp = b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### 계단 오르기의 최소 비용: 동적 계획법 ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
      dp = Array.new(n + 1, 0)
      # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
      dp[1], dp[2] = cost[1], cost[2]
      # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end

    # 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법
    def min_cost_climbing_stairs_dp_comp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      a, b = cost[1], cost[2]
      (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
      b
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%ED%95%9C%20%EA%B3%84%EB%8B%A8%EC%9D%98%20%EB%B9%84%EC%9A%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20%7Bcost%7D%EC%9D%B4%EB%8B%A4%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%EA%B3%84%EB%8B%A8%EC%9D%84%20%EB%AA%A8%EB%91%90%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%EC%9E%85%EB%A0%A5%ED%95%9C%20%EA%B3%84%EB%8B%A8%EC%9D%98%20%EB%B9%84%EC%9A%A9%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%8A%94%20%7Bcost%7D%EC%9D%B4%EB%8B%A4%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%EA%B3%84%EB%8B%A8%EC%9D%84%20%EB%AA%A8%EB%91%90%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EC%B5%9C%EC%86%8C%20%EB%B9%84%EC%9A%A9%EC%9D%80%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 14.2.2 &nbsp; 무후효성

무후효성은 동적 계획법이 문제를 효과적으로 해결할 수 있게 하는 중요한 특성이다. **어떤 상태가 주어졌을 때 이후의 전개가 현재 상태에만 의존하고, 과거에 거쳐 온 모든 상태와는 무관하다**는 뜻이다.

계단 오르기에서 상태 $i$는 $1$ 칸 또는 $2$ 칸 오르는 선택에 따라 상태 $i+1$ 또는 $i+2$로 이어진다. 두 선택을 할 때 상태 $i$ 이전의 상태를 고려할 필요는 없다. 과거 상태는 $i$ 이후의 전개에 영향을 주지 않기 때문이다.

하지만 계단 오르기에 제약 하나를 추가하면 상황이 달라진다.

!!! question "제약이 있는 계단 오르기"

    총 $n$ 칸의 계단을 한 번에 $1$ 칸 또는 $2$ 칸 오를 수 있다. **단, 연속 두 번 $1$ 칸씩 오를 수는 없다**. 맨 위까지 오르는 방법은 몇 가지인가?

아래 그림(14-8)에서는 $3$ 번째 칸까지 오르는 유효한 방법이 $2$ 가지만 남는다. $1$ 칸씩 세 번 연속 오르는 방법은 제약 조건을 만족하지 않아 제외된다.

![제약이 있을 때 3번째 칸까지 오르는 방법 수](dp_problem_features.assets/climbing_stairs_constraint_example.png){ class="animation-figure" }

<p align="center"> 그림 14-8 &nbsp; 제약이 있을 때 3번째 칸까지 오르는 방법 수 </p>

이 문제에서 직전에 $1$ 칸 올라왔다면 다음에는 반드시 $2$ 칸 올라야 한다. 즉, **다음 선택은 현재 상태(현재 칸 번호)만으로 정해지지 않고 이전 상태(직전에 있던 칸 번호)에도 의존한다**.

따라서 기존 상태 정의로는 무후효성을 만족하지 않으며, 상태 전이 식 $dp[i] = dp[i-1] + dp[i-2]$도 더 이상 유효하지 않다. $dp[i-1]$은 이번에 $1$ 칸 오르는 경우인데, 그 안에는 '직전에도 $1$ 칸 올라온' 방법이 많이 들어 있다. 제약을 만족하려면 $dp[i-1]$을 그대로 $dp[i]$에 더할 수 없다.

이를 위해 상태 정의를 확장해야 한다. **상태 $[i, j]$는 현재 $i$ 번째 칸에 있고 직전에 $j$ 칸 올라왔음을 나타내며**, $j \in \{1, 2\}$이다. 이렇게 정의하면 직전에 $1$ 칸 왔는지 $2$ 칸 왔는지를 구분하여 현재 상태의 이전 상태를 판단할 수 있다.

- 직전에 $1$ 칸 왔다면 그 앞에서는 $2$ 칸만 올 수 있다. 즉, $dp[i, 1]$은 $dp[i-1, 2]$에서만 전이된다.
- 직전에 $2$ 칸 왔다면 그 앞에서는 $1$ 칸이나 $2$ 칸 모두 가능하다. 즉, $dp[i, 2]$는 $dp[i-2, 1]$ 또는 $dp[i-2, 2]$에서 전이된다.

아래 그림(14-9)과 같이 이 정의에서 $dp[i, j]$는 상태 $[i, j]$의 방법 수를 나타낸다. 상태 전이 식은 다음과 같다.

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![제약을 고려한 점화 관계](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png){ class="animation-figure" }

<p align="center"> 그림 14-9 &nbsp; 제약을 고려한 점화 관계 </p>

마지막으로 $dp[n, 1] + dp[n, 2]$를 반환하면 된다. 두 값의 합은 $n$ 번째 칸까지 오르는 전체 방법 수다.

=== "Python"

    ```python title="climbing_stairs_constraint_dp.py"
    def climbing_stairs_constraint_dp(n: int) -> int:
        """제약 조건이 있는 계단 오르기: 동적 계획법"""
        if n == 1 or n == 2:
            return 1
        # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        dp = [[0] * 3 for _ in range(n + 1)]
        # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1], dp[1][2] = 1, 0
        dp[2][1], dp[2][2] = 0, 1
        # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in range(3, n + 1):
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        return dp[n][1] + dp[n][2]
    ```

=== "C++"

    ```cpp title="climbing_stairs_constraint_dp.cpp"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        vector<vector<int>> dp(n + 1, vector<int>(3, 0));
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_constraint_dp.java"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[][] dp = new int[n + 1][3];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_constraint_dp.cs"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, 3];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_constraint_dp.go"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    func climbingStairsConstraintDP(n int) int {
        if n == 1 || n == 2 {
            return 1
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        dp := make([][3]int, n+1)
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i := 3; i <= n; i++ {
            dp[i][1] = dp[i-1][2]
            dp[i][2] = dp[i-2][1] + dp[i-2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_constraint_dp.swift"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    func climbingStairsConstraintDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in 3 ... n {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_constraint_dp.js"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    function climbingStairsConstraintDP(n) {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        const dp = Array.from(new Array(n + 1), () => new Array(3));
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_constraint_dp.ts"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    function climbingStairsConstraintDP(n: number): number {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () => new Array(3));
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_constraint_dp.dart"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int climbingStairsConstraintDP(int n) {
      if (n == 1 || n == 2) {
        return 1;
      }
      // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
      // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
      dp[1][1] = 1;
      dp[1][2] = 0;
      dp[2][1] = 0;
      dp[2][2] = 1;
      // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
      for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
      }
      return dp[n][1] + dp[n][2];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_constraint_dp.rs"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    fn climbing_stairs_constraint_dp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return 1;
        };
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        let mut dp = vec![vec![-1; 3]; n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for i in 3..=n {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        dp[n][1] + dp[n][2]
    }
    ```

=== "C"

    ```c title="climbing_stairs_constraint_dp.c"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(3, sizeof(int));
        }
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        int res = dp[n][1] + dp[n][2];
        // 메모리 해제
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_constraint_dp.kt"
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    fun climbingStairsConstraintDP(n: Int): Int {
        if (n == 1 || n == 2) {
            return 1
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        val dp = Array(n + 1) { IntArray(3) }
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (i in 3..n) {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_constraint_dp.rb"
    ### 제약 조건이 있는 계단 오르기: 동적 계획법 ###
    def climbing_stairs_constraint_dp(n)
      return 1 if n == 1 || n == 2

      # 부분 문제의 해를 저장할 dp 테이블을 초기화한다
      dp = Array.new(n + 1) { Array.new(3, 0) }
      # 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
      dp[1][1], dp[1][2] = 1, 0
      dp[2][1], dp[2][2] = 0, 1
      # 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
      for i in 3...(n + 1)
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
      end

      dp[n][1] + dp[n][2]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EC%95%BD%20%EC%A1%B0%EA%B1%B4%EC%9D%B4%20%EC%9E%88%EB%8A%94%20%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%B4%88%EA%B8%B0%20%EC%83%81%ED%83%9C%3A%20%EA%B0%80%EC%9E%A5%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EB%AF%B8%EB%A6%AC%20%EC%84%A4%EC%A0%95%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%B6%80%ED%84%B0%20%EC%A0%90%EC%B0%A8%20%ED%81%B0%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%A5%BC%20%ED%91%BC%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%EA%B0%9C%EC%9D%98%20%EA%B3%84%EB%8B%A8%EC%9D%84%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EB%B0%A9%EB%B2%95%EC%9D%80%20%EC%B4%9D%20%7Bres%7D%EA%B0%80%EC%A7%80%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%A0%9C%EC%95%BD%20%EC%A1%B0%EA%B1%B4%EC%9D%B4%20%EC%9E%88%EB%8A%94%20%EA%B3%84%EB%8B%A8%20%EC%98%A4%EB%A5%B4%EA%B8%B0%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EC%A0%80%EC%9E%A5%ED%95%A0%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%B4%88%EA%B8%B0%20%EC%83%81%ED%83%9C%3A%20%EA%B0%80%EC%9E%A5%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EC%9D%98%20%ED%95%B4%EB%A5%BC%20%EB%AF%B8%EB%A6%AC%20%EC%84%A4%EC%A0%95%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%9E%91%EC%9D%80%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%B6%80%ED%84%B0%20%EC%A0%90%EC%B0%A8%20%ED%81%B0%20%EB%B6%80%EB%B6%84%20%EB%AC%B8%EC%A0%9C%EB%A5%BC%20%ED%91%BC%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%EA%B0%9C%EC%9D%98%20%EA%B3%84%EB%8B%A8%EC%9D%84%20%EC%98%A4%EB%A5%B4%EB%8A%94%20%EB%B0%A9%EB%B2%95%EC%9D%80%20%EC%B4%9D%20%7Bres%7D%EA%B0%80%EC%A7%80%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

위 예시는 이전 상태 하나만 추가로 고려하면 되므로 상태 정의를 확장하여 무후효성을 다시 만족시킬 수 있었다. 하지만 일부 문제는 '과거의 영향'이 매우 강하다.

!!! question "계단 오르기와 장애물 생성"

    총 $n$ 칸의 계단을 한 번에 $1$ 칸 또는 $2$ 칸 오를 수 있다. **$i$ 번째 칸에 도착하면 시스템이 자동으로 $2i$ 번째 칸에 장애물을 놓으며, 이후의 모든 이동에서는 $2i$ 번째 칸으로 갈 수 없다**. 예를 들어 처음 두 번에 $2$, $3$ 번째 칸에 도착했다면 이후에는 $4$, $6$ 번째 칸에 갈 수 없다. 맨 위까지 오르는 방법은 몇 가지인가?

이 문제에서 다음 이동은 과거의 모든 상태에 의존한다. 매번 이동할 때마다 더 높은 칸에 장애물이 생겨 이후 이동에 영향을 주기 때문이다. 이런 문제는 동적 계획법으로 해결하기 어려운 경우가 많다.

외판원 문제 같은 복잡한 조합 최적화 문제 중에는 무후효성을 만족하지 않는 경우가 많다. 이런 문제에는 보통 휴리스틱 탐색, 유전 알고리즘, 강화 학습 등의 다른 방법을 사용하여 제한된 시간 안에 활용 가능한 국소 최적해를 구한다.
