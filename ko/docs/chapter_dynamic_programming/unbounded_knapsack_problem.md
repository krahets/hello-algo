---
comments: true
---

# 14.5 &nbsp; 무한 배낭 문제

이 절에서는 또 다른 대표적인 배낭 문제인 무한 배낭을 먼저 풀고, 그 특수한 경우인 동전 교환을 알아본다.

## 14.5.1 &nbsp; 무한 배낭 문제

!!! question "문제"

    물건 $n$ 개와 용량이 $cap$인 배낭이 주어진다. $i$ 번째 물건의 무게는 $wgt[i-1]$, 가치는 $val[i-1]$이다. **각 물건을 반복해서 선택할 수 있을 때**, 용량 제한 안에 담을 수 있는 최대 가치를 구하라. 예시는 아래 그림(14-22)과 같다.

![무한 배낭 문제 예시 데이터](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> 그림 14-22 &nbsp; 무한 배낭 문제 예시 데이터 </p>

### 1. &nbsp; 동적 계획법 접근

무한 배낭 문제는 0-1 배낭 문제와 매우 비슷하며, **물건을 선택하는 횟수에 제한이 없다는 점만 다르다**.

- 0-1 배낭에서는 종류별 물건이 하나뿐이므로 물건 $i$를 넣은 뒤에는 앞의 $i-1$ 개 물건에서만 선택할 수 있다.
- 무한 배낭에서는 각 종류의 물건이 무한히 많으므로 물건 $i$를 넣은 뒤에도 **앞의 $i$ 개 물건에서 계속 선택할 수 있다**.

무한 배낭의 규칙에 따라 상태 $[i, c]$의 변화는 두 경우로 나뉜다.

- **물건 $i$를 넣지 않음**: 0-1 배낭과 동일하게 $[i-1, c]$로 전이한다.
- **물건 $i$를 넣음**: 0-1 배낭과 달리 $[i, c-wgt[i-1]]$로 전이한다.

따라서 상태 전이 식은 다음과 같이 바뀐다.

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; 코드 구현

두 문제의 코드를 비교하면 상태 전이의 한 곳이 $i-1$에서 $i$로 바뀌었을 뿐 나머지는 완전히 같다.

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """무한 배낭: 동적 계획법"""
        n = len(wgt)
        # dp 테이블을 초기화한다
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 상태 전이
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c]
                else:
                    # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 무한 배낭: 동적 계획법 */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp 테이블을 초기화한다
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 무한 배낭: 동적 계획법 */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp 테이블을 초기화한다
        int[][] dp = new int[n + 1][cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 무한 배낭: 동적 계획법 */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 무한 배낭: 동적 계획법 */
    func unboundedKnapsackDP(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp 테이블을 초기화한다
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, cap+1)
        }
        // 상태 전이
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i-1][c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 무한 배낭: 동적 계획법 */
    func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp 테이블을 초기화한다
        var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
        // 상태 전이
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 무한 배낭: 동적 계획법 */
    function unboundedKnapsackDP(wgt, val, cap) {
        const n = wgt.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
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
    /* 무한 배낭: 동적 계획법 */
    function unboundedKnapsackDP(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: cap + 1 }, () => 0)
        );
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
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
    /* 무한 배낭: 동적 계획법 */
    int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp 테이블을 초기화한다
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
      // 상태 전이
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
            dp[i][c] = dp[i - 1][c];
          } else {
            // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
            dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[n][cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 무한 배낭: 동적 계획법 */
    fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp 테이블을 초기화한다
        let mut dp = vec![vec![0; cap + 1]; n + 1];
        // 상태 전이
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 무한 배낭: 동적 계획법 */
    int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp 테이블을 초기화한다
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(cap + 1, sizeof(int));
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[n][cap];
        // 메모리 해제
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* 무한 배낭: 동적 계획법 */
    fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
        val n = wgt.size
        // dp 테이블을 초기화한다
        val dp = Array(n + 1) { IntArray(cap + 1) }
        // 상태 전이
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i][c] = dp[i - 1][c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[n][cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### 무한 배낭: 동적 계획법 ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # dp 테이블을 초기화한다
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # 상태 전이
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
            dp[i][c] = dp[i - 1][c]
          else
            # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%AC%B4%ED%95%9C%20%EB%B0%B0%EB%82%AD%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%ED%81%B0%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EB%AC%BC%EA%B1%B4%EC%9D%98%20%EC%B5%9C%EB%8C%80%20%EA%B0%80%EC%B9%98%EB%8A%94%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%AC%B4%ED%95%9C%20%EB%B0%B0%EB%82%AD%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28cap%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20dp%5Bi%20-%201%5D%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%ED%81%B0%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bc%5D%20%3D%20max%28dp%5Bi%20-%201%5D%5Bc%5D,%20dp%5Bi%5D%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bcap%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EB%AC%BC%EA%B1%B4%EC%9D%98%20%EC%B5%9C%EB%8C%80%20%EA%B0%80%EC%B9%98%EB%8A%94%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 3. &nbsp; 공간 최적화

현재 상태는 왼쪽과 위쪽 상태에서 전이되므로 **공간 최적화 후에는 $dp$ 테이블의 각 행을 정방향으로 순회해야 한다**.

이는 0-1 배낭의 순회 순서와 정반대다. 아래 그림(14-23)으로 차이를 이해해 보자.

=== "<1>"
    ![공간 최적화 후 무한 배낭의 동적 계획법 과정](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![공간 최적화된 무한 배낭 2단계](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![공간 최적화된 무한 배낭 3단계](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![공간 최적화된 무한 배낭 4단계](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![공간 최적화된 무한 배낭 5단계](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![공간 최적화된 무한 배낭 6단계](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 그림 14-23 &nbsp; 공간 최적화 후 무한 배낭의 동적 계획법 과정 </p>

구현은 간단하다. 배열 `dp`의 첫 번째 차원을 없애면 된다.

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """무한 배낭: 공간을 최적화한 동적 계획법"""
        n = len(wgt)
        # dp 테이블을 초기화한다
        dp = [0] * (cap + 1)
        # 상태 전이
        for i in range(1, n + 1):
            # 정방향 순회
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c]
                else:
                    # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // dp 테이블을 초기화한다
        vector<int> dp(cap + 1, 0);
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // dp 테이블을 초기화한다
        int[] dp = new int[cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
        n := len(wgt)
        // dp 테이블을 초기화한다
        dp := make([]int, cap+1)
        // 상태 전이
        for i := 1; i <= n; i++ {
            for c := 1; c <= cap; c++ {
                if wgt[i-1] > c {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
        let n = wgt.count
        // dp 테이블을 초기화한다
        var dp = Array(repeating: 0, count: cap + 1)
        // 상태 전이
        for i in 1 ... n {
            for c in 1 ... cap {
                if wgt[i - 1] > c {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    function unboundedKnapsackDPComp(wgt, val, cap) {
        const n = wgt.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    function unboundedKnapsackDPComp(
        wgt: Array<number>,
        val: Array<number>,
        cap: number
    ): number {
        const n = wgt.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: cap + 1 }, () => 0);
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
      int n = wgt.length;
      // dp 테이블을 초기화한다
      List<int> dp = List.filled(cap + 1, 0);
      // 상태 전이
      for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
          if (wgt[i - 1] > c) {
            // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
            dp[c] = dp[c];
          } else {
            // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
            dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
          }
        }
      }
      return dp[cap];
    }
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
        let n = wgt.len();
        // dp 테이블을 초기화한다
        let mut dp = vec![0; cap + 1];
        // 상태 전이
        for i in 1..=n {
            for c in 1..=cap {
                if wgt[i - 1] > c as i32 {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
                }
            }
        }
        dp[cap]
    }
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
        int n = wgtSize;
        // dp 테이블을 초기화한다
        int *dp = calloc(cap + 1, sizeof(int));
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        int res = dp[cap];
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    fun unboundedKnapsackDPComp(
        wgt: IntArray,
        _val: IntArray,
        cap: Int
    ): Int {
        val n = wgt.size
        // dp 테이블을 초기화한다
        val dp = IntArray(cap + 1)
        // 상태 전이
        for (i in 1..n) {
            for (c in 1..cap) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c]
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
                }
            }
        }
        return dp[cap]
    }
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    ### 무한 배낭: 동적 계획법 ###
    def unbounded_knapsack_dp(wgt, val, cap)
      n = wgt.length
      # dp 테이블을 초기화한다
      dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
      # 상태 전이
      for i in 1...(n + 1)
        for c in 1...(cap + 1)
          if wgt[i - 1] > c
            # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
            dp[i][c] = dp[i - 1][c]
          else
            # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
            dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[n][cap]
    end

    ### 무한 배낭: 공간을 최적화한 동적 계획법 ##3
    def unbounded_knapsack_dp_comp(wgt, val, cap)
      n = wgt.length
      # dp 테이블을 초기화한다
      dp = Array.new(cap + 1, 0)
      # 상태 전이
      for i in 1...(n + 1)
        # 정방향 순회
        for c in 1...(cap + 1)
          if wgt[i -1] > c
            # 배낭 용량을 초과하면 물건 i를 선택하지 않는다
            dp[c] = dp[c]
          else
            # 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
            dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
          end
        end
      end
      dp[cap]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%AC%B4%ED%95%9C%20%EB%B0%B0%EB%82%AD%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%ED%81%B0%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EB%AC%BC%EA%B1%B4%EC%9D%98%20%EC%B5%9C%EB%8C%80%20%EA%B0%80%EC%B9%98%EB%8A%94%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20unbounded_knapsack_dp_comp%28wgt%3A%20list%5Bint%5D,%20val%3A%20list%5Bint%5D,%20cap%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%AC%B4%ED%95%9C%20%EB%B0%B0%EB%82%AD%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28wgt%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28cap%20%2B%201%29%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20c%20in%20range%281,%20cap%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20wgt%5Bi%20-%201%5D%20%3E%20c%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20dp%5Bc%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AC%BC%EA%B1%B4%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%ED%81%B0%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bc%5D%20%3D%20max%28dp%5Bc%5D,%20dp%5Bc%20-%20wgt%5Bi%20-%201%5D%5D%20%2B%20val%5Bi%20-%201%5D%29%0A%20%20%20%20return%20dp%5Bcap%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20wgt%20%3D%20%5B1,%202,%203%5D%0A%20%20%20%20val%20%3D%20%5B5,%2011,%2015%5D%0A%20%20%20%20cap%20%3D%204%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20unbounded_knapsack_dp_comp%28wgt,%20val,%20cap%29%0A%20%20%20%20print%28f%22%EB%B0%B0%EB%82%AD%20%EC%9A%A9%EB%9F%89%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EB%AC%BC%EA%B1%B4%EC%9D%98%20%EC%B5%9C%EB%8C%80%20%EA%B0%80%EC%B9%98%EB%8A%94%20%7Bres%7D%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 14.5.2 &nbsp; 동전 교환 문제

배낭 문제는 동적 계획법의 큰 문제군을 대표하며, 동전 교환 같은 여러 변형이 있다.

!!! question "문제"

    동전 $n$ 종류가 주어지며 $i$ 번째 동전의 액면가는 $coins[i - 1]$이고 목표 금액은 $amt$다. **각 종류의 동전을 반복해서 선택할 수 있을 때**, 목표 금액을 만드는 최소 동전 수를 구하라. 목표 금액을 만들 수 없으면 $-1$을 반환하라. 예시는 아래 그림(14-24)과 같다.

![동전 교환 문제 예시 데이터](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> 그림 14-24 &nbsp; 동전 교환 문제 예시 데이터 </p>

### 1. &nbsp; 동적 계획법 접근

**동전 교환은 무한 배낭 문제의 특수한 경우로 볼 수 있으며**, 다음과 같은 공통점과 차이점이 있다.

- 두 문제는 서로 변환할 수 있다. '물건'은 '동전', '물건 무게'는 '동전 액면가', '배낭 용량'은 '목표 금액'에 대응한다.
- 최적화 목표가 반대다. 무한 배낭은 물건 가치를 최대화하고, 동전 교환은 동전 수를 최소화한다.
- 무한 배낭은 용량을 '넘지 않는' 해를 구하지만, 동전 교환은 목표 금액을 '정확히' 만드는 해를 구한다.

**1단계: 매 차례의 결정을 생각하고 상태를 정의하여 $dp$ 테이블을 얻는다**

상태 $[i, a]$의 부분 문제는 **앞의 $i$ 종류 동전으로 금액 $a$를 만드는 최소 동전 수**이며, 이를 $dp[i, a]$라고 한다.

2차원 $dp$ 테이블의 크기는 $(n+1) \times (amt+1)$이다.

**2단계: 최적 부분 구조를 찾아 상태 전이 식을 도출한다**

이 문제의 상태 전이 식은 무한 배낭과 다음 두 가지가 다르다.

- 최솟값을 구하므로 연산자 $\max()$를 $\min()$으로 바꾼다.
- 최적화 대상은 상품 가치가 아니라 동전 수이므로, 동전을 선택하면 $+1$만 수행한다.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**3단계: 경계 조건과 상태 전이 순서를 정한다**

목표 금액이 $0$이면 최소 동전 수는 $0$이다. 즉, 첫 열의 모든 $dp[i, 0]$은 $0$이다.

동전이 없으면 **$> 0$인 어떤 목표 금액도 만들 수 없으므로** 유효하지 않은 해다. 상태 전이 식의 $\min()$이 이를 알아보고 제외하도록 $+ \infty$로 나타낸다. 즉, 첫 행의 모든 $dp[0, a]$를 $+ \infty$로 둔다.

### 2. &nbsp; 코드 구현

대부분의 프로그래밍 언어는 $+ \infty$ 변수를 제공하지 않아 정수 타입 `int`의 최댓값으로 대신해야 한다. 하지만 그러면 상태 전이 식의 $+ 1$ 연산에서 정수 오버플로가 발생할 수 있다.

이를 피하기 위해 유효하지 않은 해를 $amt + 1$로 나타낸다. $amt$를 만드는 동전 수는 많아도 $amt$ 개이기 때문이다. 마지막에 $dp[n, amt]$가 $amt + 1$인지 확인하고, 같으면 목표 금액을 만들 수 없다는 뜻으로 $-1$을 반환한다. 코드는 다음과 같다.

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """동전 교환: 동적 계획법"""
        n = len(coins)
        MAX = amt + 1
        # dp 테이블을 초기화한다
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 상태 전이: 첫 번째 행과 첫 번째 열
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # 상태 전이: 나머지 행과 열
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 동전 교환: 동적 계획법 */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 동전 교환: 동적 계획법 */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int[][] dp = new int[n + 1][amt + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 동전 교환: 동적 계획법 */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, amt + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 동전 교환: 동적 계획법 */
    func coinChangeDP(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // dp 테이블을 초기화한다
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for a := 1; a <= amt; a++ {
            dp[0][a] = max
        }
        // 상태 전이: 나머지 행과 열
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
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
    /* 동전 교환: 동적 계획법 */
    func coinChangeDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // dp 테이블을 초기화한다
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for a in 1 ... amt {
            dp[0][a] = MAX
        }
        // 상태 전이: 나머지 행과 열
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 동전 교환: 동적 계획법 */
    function coinChangeDP(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 동전 교환: 동적 계획법 */
    function coinChangeDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (let a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] !== MAX ? dp[n][amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 동전 교환: 동적 계획법 */
    int coinChangeDP(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // dp 테이블을 초기화한다
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 상태 전이: 첫 번째 행과 첫 번째 열
      for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
      }
      // 상태 전이: 나머지 행과 열
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[i][a] = dp[i - 1][a];
          } else {
            // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
            dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 동전 교환: 동적 계획법 */
    fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // dp 테이블을 초기화한다
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for a in 1..=amt {
            dp[0][a] = max;
        }
        // 상태 전이: 나머지 행과 열
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
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
    /* 동전 교환: 동적 계획법 */
    int coinChangeDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
        // 메모리 해제
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 동전 교환: 동적 계획법 */
    fun coinChangeDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // dp 테이블을 초기화한다
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (a in 1..amt) {
            dp[0][a] = MAX
        }
        // 상태 전이: 나머지 행과 열
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[n][amt] != MAX) dp[n][amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### 동전 교환: 동적 계획법 ###
    def coin_change_dp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # dp 테이블을 초기화한다
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # 상태 전이: 첫 번째 행과 첫 번째 열
      (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
      # 상태 전이: 나머지 행과 열
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[i][a] = dp[i - 1][a]
          else
            # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
            dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[n][amt] != _MAX ? dp[n][amt] : -1
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%EA%B3%BC%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8D%B0%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%EB%8F%99%EC%A0%84%20%EA%B0%9C%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%ED%96%89%EA%B3%BC%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%0A%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Ba%5D%20%3D%20MAX%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20min%28dp%5Bi%20-%201%5D%5Ba%5D,%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%20if%20dp%5Bn%5D%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8D%B0%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%EB%8F%99%EC%A0%84%20%EA%B0%9C%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

아래 그림(14-25)의 동전 교환 동적 계획법 과정은 무한 배낭 문제와 매우 비슷하다.

=== "<1>"
    ![동전 교환 문제의 동적 계획법 과정](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![동전 교환 동적 계획법 2단계](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![동전 교환 동적 계획법 3단계](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![동전 교환 동적 계획법 4단계](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![동전 교환 동적 계획법 5단계](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![동전 교환 동적 계획법 6단계](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![동전 교환 동적 계획법 7단계](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![동전 교환 동적 계획법 8단계](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![동전 교환 동적 계획법 9단계](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![동전 교환 동적 계획법 10단계](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![동전 교환 동적 계획법 11단계](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![동전 교환 동적 계획법 12단계](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![동전 교환 동적 계획법 13단계](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![동전 교환 동적 계획법 14단계](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![동전 교환 동적 계획법 15단계](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> 그림 14-25 &nbsp; 동전 교환 문제의 동적 계획법 과정 </p>

### 3. &nbsp; 공간 최적화

동전 교환의 공간 최적화는 무한 배낭과 같은 방식으로 처리한다.

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """동전 교환: 공간을 최적화한 동적 계획법"""
        n = len(coins)
        MAX = amt + 1
        # dp 테이블을 초기화한다
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # 상태 전이
        for i in range(1, n + 1):
            # 정방향 순회
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                else:
                    # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Go"

    ```go title="coin_change.go"
    /* 동전 교환: 동적 계획법 */
    func coinChangeDPComp(coins []int, amt int) int {
        n := len(coins)
        max := amt + 1
        // dp 테이블을 초기화한다
        dp := make([]int, amt+1)
        for i := 1; i <= amt; i++ {
            dp[i] = max
        }
        // 상태 전이
        for i := 1; i <= n; i++ {
            // 정방향 순회
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
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
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        let MAX = amt + 1
        // dp 테이블을 초기화한다
        var dp = Array(repeating: MAX, count: amt + 1)
        dp[0] = 0
        // 상태 전이
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1
    }
    ```

=== "JS"

    ```javascript title="coin_change.js"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    function coinChangeDPComp(coins, amt) {
        const n = coins.length;
        const MAX = amt + 1;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    function coinChangeDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        const MAX = amt + 1;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: amt + 1 }, () => MAX);
        dp[0] = 0;
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] !== MAX ? dp[amt] : -1;
    }
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    int coinChangeDPComp(List<int> coins, int amt) {
      int n = coins.length;
      int MAX = amt + 1;
      // dp 테이블을 초기화한다
      List<int> dp = List.filled(amt + 1, MAX);
      dp[0] = 0;
      // 상태 전이
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[a] = dp[a];
          } else {
            // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
            dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
        }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        let max = amt + 1;
        // dp 테이블을 초기화한다
        let mut dp = vec![0; amt + 1];
        dp.fill(max);
        dp[0] = 0;
        // 상태 전이
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
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
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    int coinChangeDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        int MAX = amt + 1;
        // dp 테이블을 초기화한다
        int *dp = malloc((amt + 1) * sizeof(int));
        for (int j = 1; j <= amt; j++) {
            dp[j] = MAX;
        } 
        dp[0] = 0;

        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        int res = dp[amt] != MAX ? dp[amt] : -1;
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    /* 동전 교환: 공간을 최적화한 동적 계획법 */
    fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        val MAX = amt + 1
        // dp 테이블을 초기화한다
        val dp = IntArray(amt + 1)
        dp.fill(MAX)
        dp[0] = 0
        // 상태 전이
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
                }
            }
        }
        return if (dp[amt] != MAX) dp[amt] else -1
    }
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    ### 동전 교환: 공간을 최적화한 동적 계획법 ###
    def coin_change_dp_comp(coins, amt)
      n = coins.length
      _MAX = amt + 1
      # dp 테이블을 초기화한다
      dp = Array.new(amt + 1, _MAX)
      dp[0] = 0
      # 상태 전이
      for i in 1...(n + 1)
        # 정방향 순회
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[a] = dp[a]
          else
            # 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
            dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
          end
        end
      end
      dp[amt] != _MAX ? dp[amt] : -1
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8D%B0%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%EB%8F%99%EC%A0%84%20%EA%B0%9C%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20MAX%20%3D%20amt%20%2B%201%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5BMAX%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%200%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%20%EC%A4%91%20%EB%8D%94%20%EC%9E%91%EC%9D%80%20%EA%B0%92%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20min%28dp%5Ba%5D,%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%20%2B%201%29%0A%20%20%20%20return%20dp%5Bamt%5D%20if%20dp%5Bamt%5D%20%21%3D%20MAX%20else%20-1%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%204%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8D%B0%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%B5%9C%EC%86%8C%20%EB%8F%99%EC%A0%84%20%EA%B0%9C%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

## 14.5.3 &nbsp; 동전 교환 문제 II

!!! question "문제"

    동전 $n$ 종류가 주어지며 $i$ 번째 동전의 액면가는 $coins[i - 1]$이고 목표 금액은 $amt$다. 각 종류의 동전을 반복해서 선택할 수 있을 때, **목표 금액을 만드는 동전 조합 수를 구하라**. 예시는 아래 그림(14-26)과 같다.

![동전 교환 문제 II 예시 데이터](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> 그림 14-26 &nbsp; 동전 교환 문제 II 예시 데이터 </p>

### 1. &nbsp; 동적 계획법 접근

앞 문제와 달리 이번에는 조합 수를 구하므로 부분 문제는 **앞의 $i$ 종류 동전으로 금액 $a$를 만드는 조합 수**가 된다. $dp$ 테이블은 여전히 $(n+1) \times (amt + 1)$ 크기의 2차원 행렬이다.

현재 상태의 조합 수는 현재 동전을 선택하지 않는 경우와 선택하는 경우의 조합 수를 더한 값이다. 상태 전이 식은 다음과 같다.

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

목표 금액이 $0$이면 동전을 하나도 선택하지 않고도 만들 수 있으므로 첫 열의 모든 $dp[i, 0]$을 $1$로 초기화한다. 동전이 없으면 $>0$인 목표 금액을 만들 수 없으므로 첫 행의 모든 $dp[0, a]$는 $0$이다.

### 2. &nbsp; 코드 구현

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """동전 교환 II: 동적 계획법"""
        n = len(coins)
        # dp 테이블을 초기화한다
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 첫 번째 열을 초기화한다
        for i in range(n + 1):
            dp[i][0] = 1
        # 상태 전이
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 동전 교환 II: 동적 계획법 */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // dp 테이블을 초기화한다
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 첫 번째 열을 초기화한다
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 동전 교환 II: 동적 계획법 */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // dp 테이블을 초기화한다
        int[][] dp = new int[n + 1][amt + 1];
        // 첫 번째 열을 초기화한다
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 동전 교환 II: 동적 계획법 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, amt + 1];
        // 첫 번째 열을 초기화한다
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 동전 교환 II: 동적 계획법 */
    func coinChangeIIDP(coins []int, amt int) int {
        n := len(coins)
        // dp 테이블을 초기화한다
        dp := make([][]int, n+1)
        for i := 0; i <= n; i++ {
            dp[i] = make([]int, amt+1)
        }
        // 첫 번째 열을 초기화한다
        for i := 0; i <= n; i++ {
            dp[i][0] = 1
        }
        // 상태 전이: 나머지 행과 열
        for i := 1; i <= n; i++ {
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i-1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 동전 교환 II: 동적 계획법 */
    func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // dp 테이블을 초기화한다
        var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
        // 첫 번째 열을 초기화한다
        for i in 0 ... n {
            dp[i][0] = 1
        }
        // 상태 전이
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 동전 교환 II: 동적 계획법 */
    function coinChangeIIDP(coins, amt) {
        const n = coins.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 첫 번째 열을 초기화한다
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 동전 교환 II: 동적 계획법 */
    function coinChangeIIDP(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: n + 1 }, () =>
            Array.from({ length: amt + 1 }, () => 0)
        );
        // 첫 번째 열을 초기화한다
        for (let i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 동전 교환 II: 동적 계획법 */
    int coinChangeIIDP(List<int> coins, int amt) {
      int n = coins.length;
      // dp 테이블을 초기화한다
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
      // 첫 번째 열을 초기화한다
      for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
      }
      // 상태 전이
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[i][a] = dp[i - 1][a];
          } else {
            // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
          }
        }
      }
      return dp[n][amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 동전 교환 II: 동적 계획법 */
    fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // dp 테이블을 초기화한다
        let mut dp = vec![vec![0; amt + 1]; n + 1];
        // 첫 번째 열을 초기화한다
        for i in 0..=n {
            dp[i][0] = 1;
        }
        // 상태 전이
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
                }
            }
        }
        dp[n][amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 동전 교환 II: 동적 계획법 */
    int coinChangeIIDP(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // dp 테이블을 초기화한다
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(amt + 1, sizeof(int));
        }
        // 첫 번째 열을 초기화한다
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        int res = dp[n][amt];
        // 메모리 해제
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 동전 교환 II: 동적 계획법 */
    fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // dp 테이블을 초기화한다
        val dp = Array(n + 1) { IntArray(amt + 1) }
        // 첫 번째 열을 초기화한다
        for (i in 0..n) {
            dp[i][0] = 1
        }
        // 상태 전이
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i][a] = dp[i - 1][a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
                }
            }
        }
        return dp[n][amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### 동전 교환 II: 동적 계획법 ###
    def coin_change_ii_dp(coins, amt)
      n = coins.length
      # dp 테이블을 초기화한다
      dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
      # 첫 번째 열을 초기화한다
      (0...(n + 1)).each { |i| dp[i][0] = 1 }
      # 상태 전이
      for i in 1...(n + 1)
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[i][a] = dp[i - 1][a]
          else
            # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
            dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
          end
        end
      end
      dp[n][amt]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%20II%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%9D%98%20%EB%B0%A9%EB%B2%95%20%EC%88%98%EB%A5%BC%20%EB%8D%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8F%99%EC%A0%84%20%EC%A1%B0%ED%95%A9%EC%9D%98%20%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%20II%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20%28amt%20%2B%201%29%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%EC%B2%AB%20%EB%B2%88%EC%A7%B8%20%EC%97%B4%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20for%20i%20in%20range%28n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%9D%98%20%EB%B0%A9%EB%B2%95%20%EC%88%98%EB%A5%BC%20%EB%8D%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Ba%5D%20%3D%20dp%5Bi%20-%201%5D%5Ba%5D%20%2B%20dp%5Bi%5D%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bn%5D%5Bamt%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8F%99%EC%A0%84%20%EC%A1%B0%ED%95%A9%EC%9D%98%20%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>

### 3. &nbsp; 공간 최적화

공간 최적화 방법도 같으며, 동전 차원을 없애면 된다.

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """동전 교환 II: 공간을 최적화한 동적 계획법"""
        n = len(coins)
        # dp 테이블을 초기화한다
        dp = [0] * (amt + 1)
        dp[0] = 1
        # 상태 전이
        for i in range(1, n + 1):
            # 정방향 순회
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                else:
                    # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // dp 테이블을 초기화한다
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // dp 테이블을 초기화한다
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    func coinChangeIIDPComp(coins []int, amt int) int {
        n := len(coins)
        // dp 테이블을 초기화한다
        dp := make([]int, amt+1)
        dp[0] = 1
        // 상태 전이
        for i := 1; i <= n; i++ {
            // 정방향 순회
            for a := 1; a <= amt; a++ {
                if coins[i-1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a-coins[i-1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
        let n = coins.count
        // dp 테이블을 초기화한다
        var dp = Array(repeating: 0, count: amt + 1)
        dp[0] = 1
        // 상태 전이
        for i in 1 ... n {
            for a in 1 ... amt {
                if coins[i - 1] > a {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    function coinChangeIIDPComp(coins, amt) {
        const n = coins.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    function coinChangeIIDPComp(coins: Array<number>, amt: number): number {
        const n = coins.length;
        // dp 테이블을 초기화한다
        const dp = Array.from({ length: amt + 1 }, () => 0);
        dp[0] = 1;
        // 상태 전이
        for (let i = 1; i <= n; i++) {
            for (let a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int coinChangeIIDPComp(List<int> coins, int amt) {
      int n = coins.length;
      // dp 테이블을 초기화한다
      List<int> dp = List.filled(amt + 1, 0);
      dp[0] = 1;
      // 상태 전이
      for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
          if (coins[i - 1] > a) {
            // 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[a] = dp[a];
          } else {
            // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
            dp[a] = dp[a] + dp[a - coins[i - 1]];
          }
        }
      }
      return dp[amt];
    }
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
        let n = coins.len();
        // dp 테이블을 초기화한다
        let mut dp = vec![0; amt + 1];
        dp[0] = 1;
        // 상태 전이
        for i in 1..=n {
            for a in 1..=amt {
                if coins[i - 1] > a as i32 {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
                }
            }
        }
        dp[amt]
    }
    ```

=== "C"

    ```c title="coin_change_ii.c"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
        int n = coinsSize;
        // dp 테이블을 초기화한다
        int *dp = calloc(amt + 1, sizeof(int));
        dp[0] = 1;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        int res = dp[amt];
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
        val n = coins.size
        // dp 테이블을 초기화한다
        val dp = IntArray(amt + 1)
        dp[0] = 1
        // 상태 전이
        for (i in 1..n) {
            for (a in 1..amt) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a]
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
                }
            }
        }
        return dp[amt]
    }
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    ### 동전 교환 II: 공간을 최적화한 동적 계획법 ###
    def coin_change_ii_dp_comp(coins, amt)
      n = coins.length
      # dp 테이블을 초기화한다
      dp = Array.new(amt + 1, 0)
      dp[0] = 1
      # 상태 전이
      for i in 1...(n + 1)
        # 정방향 순회
        for a in 1...(amt + 1)
          if coins[i - 1] > a
            # 목표 금액을 초과하면 동전 i를 선택하지 않는다
            dp[a] = dp[a]
          else
            # 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
            dp[a] = dp[a] + dp[a - coins[i - 1]]
          end
        end
      end
      dp[amt]
    end
    ```

??? pythontutor "코드 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="코드 시각화" src="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%20II%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%9D%98%20%EB%B0%A9%EB%B2%95%20%EC%88%98%EB%A5%BC%20%EB%8D%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8F%99%EC%A0%84%20%EC%A1%B0%ED%95%A9%EC%9D%98%20%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20coin_change_ii_dp_comp%28coins%3A%20list%5Bint%5D,%20amt%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EB%8F%99%EC%A0%84%20%EA%B5%90%ED%99%98%20II%3A%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28coins%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%9D%84%20%EC%B4%88%EA%B8%B0%ED%99%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28amt%20%2B%201%29%0A%20%20%20%20dp%5B0%5D%20%3D%201%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%A0%95%EB%B0%A9%ED%96%A5%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%20%20%20%20for%20a%20in%20range%281,%20amt%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20coins%5Bi%20-%201%5D%20%3E%20a%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EC%B4%88%EA%B3%BC%ED%95%98%EB%A9%B4%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%EB%8F%99%EC%A0%84%20i%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%98%EC%A7%80%20%EC%95%8A%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%99%80%20%EC%84%A0%ED%83%9D%ED%95%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EC%9D%98%20%EB%B0%A9%EB%B2%95%20%EC%88%98%EB%A5%BC%20%EB%8D%94%ED%95%9C%EB%8B%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20dp%5Ba%5D%20%3D%20dp%5Ba%5D%20%2B%20dp%5Ba%20-%20coins%5Bi%20-%201%5D%5D%0A%20%20%20%20return%20dp%5Bamt%5D%0A%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20coins%20%3D%20%5B1,%202,%205%5D%0A%20%20%20%20amt%20%3D%205%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%EC%9D%84%20%EC%B5%9C%EC%A0%81%ED%99%94%ED%95%9C%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20coin_change_ii_dp_comp%28coins,%20amt%29%0A%20%20%20%20print%28f%22%EB%AA%A9%ED%91%9C%20%EA%B8%88%EC%95%A1%EC%9D%84%20%EB%A7%8C%EB%93%9C%EB%8A%94%20%EB%8F%99%EC%A0%84%20%EC%A1%B0%ED%95%A9%EC%9D%98%20%EC%88%98%EB%8A%94%20%7Bres%7D%EA%B0%9C%EC%9D%B4%EB%8B%A4%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면 ></a></div>
