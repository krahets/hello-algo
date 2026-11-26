---
comments: true
---

# 14.3 &nbsp; 동적 계획법 문제 풀이

앞선 두 절에서 동적 계획법 문제의 주요 특성을 알아보았다. 이제 실제로 문제를 풀 때 마주치는 두 가지 질문을 살펴보자.

1. 동적 계획법으로 풀 문제인지 어떻게 판단하는가?
2. 동적 계획법 문제는 어디에서 시작해 어떤 순서로 풀어야 하는가?

## 14.3.1 &nbsp; 문제 판별

일반적으로 중복되는 부분 문제와 최적 부분 구조가 있고 무후효성을 만족한다면 동적 계획법이 적합하다. 하지만 문제 설명만 보고 이런 특성을 바로 알아내기는 어렵다. 그래서 조건을 조금 완화하여 **백트래킹(완전 탐색)으로 풀 수 있는지 먼저 살펴본다**.

**백트래킹이 적합한 문제는 보통 ‘의사 결정 트리’로 나타낼 수 있다**. 각 노드는 하나의 결정을, 각 경로는 일련의 결정을 나타낸다.

다시 말해 무엇을 결정하는지가 명확하고 그러한 결정들이 모여 해가 된다면 의사 결정 트리로 모델링할 수 있으며, 대개 백트래킹으로 풀 수 있다.

여기에 다음과 같은 특징까지 있다면 동적 계획법이 적합할 가능성이 더 높다.

- 최대나 최소, 가장 많거나 가장 적은 수 등 최적화 목표가 주어진다.
- 리스트, 다차원 행렬 또는 트리로 상태를 나타낼 수 있고, 한 상태와 주변 상태 사이에 점화 관계가 있다.

반대로 다음과 같은 특징은 동적 계획법이 적합할 가능성을 낮춘다.

- 최적해 하나를 구하는 것이 아니라 가능한 모든 해를 찾아야 한다.
- 문제에 순열이나 조합의 특징이 뚜렷하며, 구체적인 방법을 여러 개 반환해야 한다.

문제를 의사 결정 트리로 나타낼 수 있고 동적 계획법에 유리한 특징이 뚜렷하면, 일단 동적 계획법 문제라고 가정하고 풀어 가면서 그 가정을 확인할 수 있다.

## 14.3.2 &nbsp; 문제 풀이 단계

동적 계획법의 풀이 과정은 문제의 성격과 난이도에 따라 달라진다. 보통은 각 단계의 결정을 설명하고, 상태를 정의하고, $dp$ 테이블을 만든 뒤, 상태 전이식을 유도하고 경계 조건을 정한다.

풀이 단계를 구체적으로 살펴보기 위해 대표적인 문제인 ‘최소 경로 합’을 예로 들자.

!!! question

    크기가 $n \times m$인 2차원 격자 `grid`가 주어진다. 각 칸에는 그 칸의 비용을 나타내는 음이 아닌 정수가 들어 있다. 로봇은 왼쪽 위 칸에서 출발해 한 번에 아래나 오른쪽으로 한 칸씩 이동하여 오른쪽 아래 칸에 도달한다. 왼쪽 위에서 오른쪽 아래까지의 최소 경로 합을 반환하라.

아래 그림(14-10)에서 주어진 격자의 최소 경로 합은 $13$이다.

![최소 경로 합의 예시 데이터](dp_solution_pipeline.assets/min_path_sum_example.svg){ class="animation-figure" }

<p align="center"> 그림 14-10 &nbsp; 최소 경로 합의 예시 데이터 </p>

**첫 번째 단계: 매번 내릴 결정을 생각하고 상태를 정의해 $dp$ 테이블 구성하기**

이 문제에서 매번 내리는 결정은 현재 칸에서 아래로 한 칸 갈지 오른쪽으로 한 칸 갈지다. 현재 칸의 행과 열 인덱스가 $[i, j]$이라면 아래나 오른쪽으로 움직인 뒤에는 각각 $[i+1, j]$ 또는 $[i, j+1]$이 된다. 따라서 상태에는 행 인덱스와 열 인덱스라는 두 변수가 필요하며 이를 $[i, j]$로 표기한다.

상태 $[i, j]$의 부분 문제는 출발점 $[0, 0]$에서 $[i, j]$까지의 최소 경로 합을 구하는 것이다. 그 해를 $dp[i, j]$로 표기한다.

이렇게 하면 아래 그림(14-11)처럼 입력 격자 $grid$와 크기가 같은 2차원 $dp$ 행렬을 얻는다.

![상태 정의와 dp 테이블](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.svg){ class="animation-figure" }

<p align="center"> 그림 14-11 &nbsp; 상태 정의와 dp 테이블 </p>

!!! note

    동적 계획법과 백트래킹의 과정은 일련의 결정으로 설명할 수 있다. 상태는 모든 결정 변수로 구성된다. 풀이가 어디까지 진행되었는지를 나타내는 변수를 빠짐없이 담아야 다음 상태를 유도하는 데 필요한 정보가 충분하다.
    
    각 상태는 하나의 부분 문제에 대응한다. 모든 부분 문제의 해를 저장할 $dp$ 테이블을 정의하면 상태의 각 독립변수가 $dp$ 테이블의 한 차원이 된다. 본질적으로 $dp$ 테이블은 상태를 그 부분 문제의 해에 대응시키는 표다.

**두 번째 단계: 최적 부분 구조를 찾고 상태 전이식 유도하기**

상태 $[i, j]$로는 위쪽 칸 $[i-1, j]$과 왼쪽 칸 $[i, j-1]$에서만 올 수 있다. 따라서 $[i, j]$까지의 최소 경로 합은 $[i, j-1]$까지의 최소 경로 합과 $[i-1, j]$까지의 최소 경로 합 중 작은 쪽으로 결정된다. 이것이 최적 부분 구조다.

이 관계로부터 아래 그림(14-12)의 상태 전이식을 얻는다.

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![최적 부분 구조와 상태 전이식](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.svg){ class="animation-figure" }

<p align="center"> 그림 14-12 &nbsp; 최적 부분 구조와 상태 전이식 </p>

!!! note

    정의한 $dp$ 테이블을 바탕으로 원래 문제와 부분 문제의 관계를 살펴본다. 부분 문제의 최적해로 원래 문제의 최적해를 구성하는 방법을 찾으면 그것이 최적 부분 구조다.

    최적 부분 구조를 찾으면 이를 바탕으로 상태 전이식을 세울 수 있다.

**세 번째 단계: 경계 조건과 상태 전이 순서 정하기**

이 문제에서 첫 행의 상태는 왼쪽 상태에서만, 첫 열의 상태는 위쪽 상태에서만 올 수 있다. 따라서 첫 행 $i = 0$과 첫 열 $j = 0$이 경계 조건이다.

아래 그림(14-13)처럼 각 칸은 왼쪽 칸과 위쪽 칸에서 전이하므로 반복문으로 행렬을 순회한다. 바깥 반복문에서는 행을, 안쪽 반복문에서는 열을 차례로 방문한다.

![경계 조건과 상태 전이 순서](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.svg){ class="animation-figure" }

<p align="center"> 그림 14-13 &nbsp; 경계 조건과 상태 전이 순서 </p>

!!! note

    경계 조건은 동적 계획법에서는 $dp$ 테이블을 초기화하는 데, 탐색에서는 가지치기에 쓰인다.
    
    상태 전이 순서를 정할 때는 현재 문제의 해를 구하는 시점에 그 해가 의존하는 더 작은 부분 문제들이 모두 올바르게 풀려 있도록 해야 한다.

지금까지의 분석만으로도 동적 계획법 코드를 바로 작성할 수 있다. 다만 부분 문제로 나누는 사고 과정은 하향식이므로 ‘완전 탐색 $\rightarrow$ 메모이제이션 탐색 $\rightarrow$ 동적 계획법’ 순서로 구현하는 편이 자연스럽다.

### 1. &nbsp; 방법 1: 완전 탐색

상태 $[i, j]$에서 탐색을 시작해 더 작은 상태 $[i-1, j]$과 $[i, j-1]$로 계속 나눈다. 재귀 함수는 다음 요소로 구성된다.

- **재귀 호출의 매개변수**: 상태 $[i, j]$.
- **반환값**: $[0, 0]$에서 $[i, j]$까지의 최소 경로 합 $dp[i, j]$.
- **종료 조건**: $i = 0$이고 $j = 0$이면 비용 $grid[0, 0]$을 반환한다.
- **가지치기**: $i < 0$이거나 $j < 0$이면 인덱스가 범위를 벗어나므로, 불가능한 경로를 나타내는 비용 $+\infty$를 반환한다.

코드는 다음과 같다.

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """최소 경로 합: 완전 탐색"""
        # 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 and j == 0:
            return grid[0][0]
        # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 or j < 0:
            return inf
        # 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return min(left, up) + grid[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 최소 경로 합: 완전 탐색 */
    int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 최소 경로 합: 완전 탐색 */
    int minPathSumDFS(int[][] grid, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 최소 경로 합: 완전 탐색 */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.Min(left, up) + grid[i][j];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 최소 경로 합: 완전 탐색 */
    func minPathSumDFS(grid [][]int, i, j int) int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        up := minPathSumDFS(grid, i-1, j)
        left := minPathSumDFS(grid, i, j-1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return int(math.Min(float64(left), float64(up))) + grid[i][j]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 최소 경로 합: 완전 탐색 */
    func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return .max
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
        let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return min(left, up) + grid[i][j]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 최소 경로 합: 완전 탐색 */
    function minPathSumDFS(grid, i, j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 최소 경로 합: 완전 탐색 */
    function minPathSumDFS(
        grid: Array<Array<number>>,
        i: number,
        j: number
    ): number {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i === 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 최소 경로 합: 완전 탐색 */
    int minPathSumDFS(List<List<int>> grid, int i, int j) {
      // 왼쪽 위 칸이면 탐색을 종료한다
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
      if (i < 0 || j < 0) {
        // Dart의 int는 범위가 고정된 정수형으로, 무한대를 나타내는 값이 없다
        return BigInt.from(2).pow(31).toInt();
      }
      // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
      int up = minPathSumDFS(grid, i - 1, j);
      int left = minPathSumDFS(grid, i, j - 1);
      // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
      return min(left, up) + grid[i][j];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 최소 경로 합: 완전 탐색 */
    fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        let up = min_path_sum_dfs(grid, i - 1, j);
        let left = min_path_sum_dfs(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        std::cmp::min(left, up) + grid[i as usize][j as usize]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 최소 경로 합: 완전 탐색 */
    int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 최소 경로 합: 완전 탐색 */
    fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
        val up = minPathSumDFS(grid, i - 1, j)
        val left = minPathSumDFS(grid, i, j - 1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
        return min(left, up) + grid[i][j]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 최소 경로 합: 완전 탐색 ###
    def min_path_sum_dfs(grid, i, j)
      # 왼쪽 위 칸이면 탐색을 종료한다
      return grid[i][j] if i == 0 && j == 0
      # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
      return Float::INFINITY if i < 0 || j < 0
      # 왼쪽 위에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 구한다
      up = min_path_sum_dfs(grid, i - 1, j)
      left = min_path_sum_dfs(grid, i, j - 1)
      # 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 반환한다
      [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EC%99%84%EC%A0%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%20%EC%B9%B8%EC%9D%B4%EB%A9%B4%20%ED%83%90%EC%83%89%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%ED%96%89%20%EB%98%90%EB%8A%94%20%EC%97%B4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%B9%84%EC%9A%A9%20%2B%E2%88%9E%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i-1,%20j%29%EC%99%80%20%28i,%20j-1%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i,%20j%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EC%99%84%EC%A0%84%20%ED%83%90%EC%83%89%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EC%99%84%EC%A0%84%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%20%EC%B9%B8%EC%9D%B4%EB%A9%B4%20%ED%83%90%EC%83%89%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%ED%96%89%20%EB%98%90%EB%8A%94%20%EC%97%B4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%B9%84%EC%9A%A9%20%2B%E2%88%9E%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i-1,%20j%29%EC%99%80%20%28i,%20j-1%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EA%B5%AC%ED%95%9C%EB%8B%A4%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i,%20j%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EC%99%84%EC%A0%84%20%ED%83%90%EC%83%89%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

아래 그림(14-14)은 $dp[2, 1]$을 루트로 하는 재귀 트리다. 중복되는 부분 문제가 보이며, 그 수는 격자 `grid`의 크기가 커질수록 급격히 늘어난다.

부분 문제가 중복되는 근본적인 이유는 **왼쪽 위에서 어떤 칸까지 도달하는 경로가 여러 개일 수 있기 때문**이다.

![완전 탐색의 재귀 트리](dp_solution_pipeline.assets/min_path_sum_dfs.svg){ class="animation-figure" }

<p align="center"> 그림 14-14 &nbsp; 완전 탐색의 재귀 트리 </p>

각 상태에서는 아래와 오른쪽으로 가는 두 가지 선택이 있고, 왼쪽 위에서 오른쪽 아래까지는 총 $m + n - 2$걸음이 필요하다. 따라서 최악의 시간 복잡도는 $O(2^{m + n})$이다. 여기서 $n$과 $m$은 각각 격자의 행 수와 열 수다. 이 계산은 격자 경계 부근의 상황을 고려하지 않는다. 경계에 도달하면 선택지가 하나만 남으므로 실제 경로 수는 이보다 적다.

### 2. &nbsp; 방법 2: 메모이제이션 탐색

격자 `grid`와 크기가 같은 메모 리스트 `mem`을 두어 각 부분 문제의 해를 기록하고 중복되는 부분 문제를 가지치기한다.

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """최소 경로 합: 메모이제이션 탐색"""
        # 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 and j == 0:
            return grid[0][0]
        # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 or j < 0:
            return inf
        # 기록이 있으면 바로 반환한다
        if mem[i][j] != -1:
            return mem[i][j]
        # 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
        left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
        # 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 최소 경로 합: 메모이제이션 탐색 */
    int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
        return mem[i][j];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 최소 경로 합: 메모이제이션 탐색 */
    int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 최소 경로 합: 메모이제이션 탐색 */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 최소 경로 합: 메모이제이션 탐색 */
    func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 기록이 있으면 바로 반환한다
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        up := minPathSumDFSMem(grid, mem, i-1, j)
        left := minPathSumDFSMem(grid, mem, i, j-1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 최소 경로 합: 메모이제이션 탐색 */
    func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return .max
        }
        // 기록이 있으면 바로 반환한다
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
        let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 최소 경로 합: 메모이제이션 탐색 */
    function minPathSumDFSMem(grid, mem, i, j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] !== -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        const up = minPathSumDFSMem(grid, mem, i - 1, j);
        const left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 최소 경로 합: 메모이제이션 탐색 */
    function minPathSumDFSMem(
        grid: Array<Array<number>>,
        mem: Array<Array<number>>,
        i: number,
        j: number
    ): number {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        const up = minPathSumDFSMem(grid, mem, i - 1, j);
        const left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 최소 경로 합: 메모이제이션 탐색 */
    int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
      // 왼쪽 위 칸이면 탐색을 종료한다
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
      if (i < 0 || j < 0) {
        // Dart의 int는 범위가 고정된 정수형으로, 무한대를 나타내는 값이 없다
        return BigInt.from(2).pow(31).toInt();
      }
      // 기록이 있으면 바로 반환한다
      if (mem[i][j] != -1) {
        return mem[i][j];
      }
      // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
      int up = minPathSumDFSMem(grid, mem, i - 1, j);
      int left = minPathSumDFSMem(grid, mem, i, j - 1);
      // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
      mem[i][j] = min(left, up) + grid[i][j];
      return mem[i][j];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 최소 경로 합: 메모이제이션 탐색 */
    fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 기록이 있으면 바로 반환한다
        if mem[i as usize][j as usize] != -1 {
            return mem[i as usize][j as usize];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
        let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
        mem[i as usize][j as usize]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 최소 경로 합: 메모이제이션 탐색 */
    int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
        return mem[i][j];
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 최소 경로 합: 메모이제이션 탐색 */
    fun minPathSumDFSMem(
        grid: Array<IntArray>,
        mem: Array<IntArray>,
        i: Int,
        j: Int
    ): Int {
        // 왼쪽 위 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j]
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        val up = minPathSumDFSMem(grid, mem, i - 1, j)
        val left = minPathSumDFSMem(grid, mem, i, j - 1)
        // 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 최소 경로 합: 메모이제이션 탐색 ###
    def min_path_sum_dfs_mem(grid, mem, i, j)
      # 왼쪽 위 칸이면 탐색을 종료한다
      return grid[0][0] if i == 0 && j == 0
      # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
      return Float::INFINITY if i < 0 || j < 0
      # 기록이 있으면 바로 반환한다
      return mem[i][j] if mem[i][j] != -1
      # 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
      up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
      left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
      # 왼쪽 위에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
      mem[i][j] = [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EB%A9%94%EB%AA%A8%EC%9D%B4%EC%A0%9C%EC%9D%B4%EC%85%98%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%20%EC%B9%B8%EC%9D%B4%EB%A9%B4%20%ED%83%90%EC%83%89%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%ED%96%89%20%EB%98%90%EB%8A%94%20%EC%97%B4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%B9%84%EC%9A%A9%20%2B%E2%88%9E%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%EA%B8%B0%EB%A1%9D%EC%9D%B4%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EB%B0%94%EB%A1%9C%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%B9%B8%EA%B3%BC%20%EC%9C%84%EC%AA%BD%20%EC%B9%B8%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i,%20j%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EA%B8%B0%EB%A1%9D%ED%95%98%EA%B3%A0%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%EB%A9%94%EB%AA%A8%EC%9D%B4%EC%A0%9C%EC%9D%B4%EC%85%98%20%ED%83%90%EC%83%89%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EB%A9%94%EB%AA%A8%EC%9D%B4%EC%A0%9C%EC%9D%B4%EC%85%98%20%ED%83%90%EC%83%89%22%22%22%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%20%EC%B9%B8%EC%9D%B4%EB%A9%B4%20%ED%83%90%EC%83%89%EC%9D%84%20%EC%A2%85%EB%A3%8C%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%ED%96%89%20%EB%98%90%EB%8A%94%20%EC%97%B4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%EA%B0%80%20%EB%B2%94%EC%9C%84%EB%A5%BC%20%EB%B2%97%EC%96%B4%EB%82%98%EB%A9%B4%20%EB%B9%84%EC%9A%A9%20%2B%E2%88%9E%EB%A5%BC%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%EA%B8%B0%EB%A1%9D%EC%9D%B4%20%EC%9E%88%EC%9C%BC%EB%A9%B4%20%EB%B0%94%EB%A1%9C%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%B9%B8%EA%B3%BC%20%EC%9C%84%EC%AA%BD%20%EC%B9%B8%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%28i,%20j%29%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%EB%B9%84%EC%9A%A9%EC%9D%84%20%EA%B8%B0%EB%A1%9D%ED%95%98%EA%B3%A0%20%EB%B0%98%ED%99%98%ED%95%9C%EB%8B%A4%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%EB%A9%94%EB%AA%A8%EC%9D%B4%EC%A0%9C%EC%9D%B4%EC%85%98%20%ED%83%90%EC%83%89%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

아래 그림(14-15)처럼 메모이제이션을 적용하면 각 부분 문제의 해를 한 번만 계산한다. 따라서 시간 복잡도는 전체 상태 수, 즉 격자의 크기에 비례하는 $O(nm)$이다.

![메모이제이션 탐색의 재귀 트리](dp_solution_pipeline.assets/min_path_sum_dfs_mem.svg){ class="animation-figure" }

<p align="center"> 그림 14-15 &nbsp; 메모이제이션 탐색의 재귀 트리 </p>

### 3. &nbsp; 방법 3: 동적 계획법

반복문을 사용해 동적 계획법을 구현하면 다음과 같다.

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp(grid: list[list[int]]) -> int:
        """최소 경로 합: 동적 계획법"""
        n, m = len(grid), len(grid[0])
        # dp 테이블 초기화
        dp = [[0] * m for _ in range(n)]
        dp[0][0] = grid[0][0]
        # 상태 전이: 첫 행
        for j in range(1, m):
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        # 상태 전이: 첫 열
        for i in range(1, n):
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        # 상태 전이: 나머지 행과 열
        for i in range(1, n):
            for j in range(1, m):
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        return dp[n - 1][m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 최소 경로 합: 동적 계획법 */
    int minPathSumDP(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // dp 테이블 초기화
        vector<vector<int>> dp(n, vector<int>(m));
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 최소 경로 합: 동적 계획법 */
    int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp 테이블 초기화
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 최소 경로 합: 동적 계획법 */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp 테이블 초기화
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // 상태 전이: 첫 행
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 최소 경로 합: 동적 계획법 */
    func minPathSumDP(grid [][]int) int {
        n, m := len(grid), len(grid[0])
        // dp 테이블 초기화
        dp := make([][]int, n)
        for i := 0; i < n; i++ {
            dp[i] = make([]int, m)
        }
        dp[0][0] = grid[0][0]
        // 상태 전이: 첫 행
        for j := 1; j < m; j++ {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }
        // 상태 전이: 첫 열
        for i := 1; i < n; i++ {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }
        // 상태 전이: 나머지 행과 열
        for i := 1; i < n; i++ {
            for j := 1; j < m; j++ {
                dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
            }
        }
        return dp[n-1][m-1]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 최소 경로 합: 동적 계획법 */
    func minPathSumDP(grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        // dp 테이블 초기화
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        dp[0][0] = grid[0][0]
        // 상태 전이: 첫 행
        for j in 1 ..< m {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        // 상태 전이: 첫 열
        for i in 1 ..< n {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        // 상태 전이: 나머지 행과 열
        for i in 1 ..< n {
            for j in 1 ..< m {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        return dp[n - 1][m - 1]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 최소 경로 합: 동적 계획법 */
    function minPathSumDP(grid) {
        const n = grid.length,
            m = grid[0].length;
        // dp 테이블 초기화
        const dp = Array.from({ length: n }, () =>
            Array.from({ length: m }, () => 0)
        );
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for (let j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (let i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i < n; i++) {
            for (let j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 최소 경로 합: 동적 계획법 */
    function minPathSumDP(grid: Array<Array<number>>): number {
        const n = grid.length,
            m = grid[0].length;
        // dp 테이블 초기화
        const dp = Array.from({ length: n }, () =>
            Array.from({ length: m }, () => 0)
        );
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for (let j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (let i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (let i = 1; i < n; i++) {
            for (let j: number = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 최소 경로 합: 동적 계획법 */
    int minPathSumDP(List<List<int>> grid) {
      int n = grid.length, m = grid[0].length;
      // dp 테이블 초기화
      List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
      dp[0][0] = grid[0][0];
      // 상태 전이: 첫 행
      for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
      }
      // 상태 전이: 첫 열
      for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
      }
      // 상태 전이: 나머지 행과 열
      for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
          dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
      }
      return dp[n - 1][m - 1];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 최소 경로 합: 동적 계획법 */
    fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
        let (n, m) = (grid.len(), grid[0].len());
        // dp 테이블 초기화
        let mut dp = vec![vec![0; m]; n];
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for j in 1..m {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for i in 1..n {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for i in 1..n {
            for j in 1..m {
                dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        dp[n - 1][m - 1]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 최소 경로 합: 동적 계획법 */
    int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
        // dp 테이블 초기화
        int **dp = malloc(n * sizeof(int *));
        for (int i = 0; i < n; i++) {
            dp[i] = calloc(m, sizeof(int));
        }
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 행
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 열
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        int res = dp[n - 1][m - 1];
        // 메모리 해제
        for (int i = 0; i < n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 최소 경로 합: 동적 계획법 */
    fun minPathSumDP(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        // dp 테이블 초기화
        val dp = Array(n) { IntArray(m) }
        dp[0][0] = grid[0][0]
        // 상태 전이: 첫 행
        for (j in 1..<m) {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        // 상태 전이: 첫 열
        for (i in 1..<n) {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        // 상태 전이: 나머지 행과 열
        for (i in 1..<n) {
            for (j in 1..<m) {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        return dp[n - 1][m - 1]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 최소 경로 합: 동적 계획법 ###
    def min_path_sum_dp(grid)
      n, m = grid.length, grid.first.length
      # dp 테이블 초기화
      dp = Array.new(n) { Array.new(m, 0) }
      dp[0][0] = grid[0][0]
      # 상태 전이: 첫 행
      (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
      # 상태 전이: 첫 열
      (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
      # 상태 전이: 나머지 행과 열
      for i in 1...n
        for j in 1...m
          dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
        end
      end
      dp[n -1][m -1]
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%ED%96%89%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%ED%96%89%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%EA%B3%BC%20%EC%97%B4%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>

아래 그림(14-16)은 최소 경로 합을 구하는 상태 전이 과정이다. 격자 전체를 순회하므로 **시간 복잡도는 $O(nm)$이다**.

배열 `dp`의 크기는 $n \times m$이므로 **공간 복잡도는 $O(nm)$이다**.

=== "<1>"
    ![동적 계획법으로 최소 경로 합을 구하는 과정](dp_solution_pipeline.assets/min_path_sum_dp_step1.svg){ class="animation-figure" }

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.svg){ class="animation-figure" }

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.svg){ class="animation-figure" }

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.svg){ class="animation-figure" }

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.svg){ class="animation-figure" }

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.svg){ class="animation-figure" }

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.svg){ class="animation-figure" }

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.svg){ class="animation-figure" }

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.svg){ class="animation-figure" }

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.svg){ class="animation-figure" }

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.svg){ class="animation-figure" }

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.svg){ class="animation-figure" }

<p align="center"> 그림 14-16 &nbsp; 동적 계획법으로 최소 경로 합을 구하는 과정 </p>

### 4. &nbsp; 공간 최적화

각 칸은 왼쪽 칸과 위쪽 칸에만 의존하므로 한 행짜리 배열 하나로 $dp$ 테이블을 구현할 수 있다.

배열 `dp`는 한 행의 상태만 나타낼 수 있다. 따라서 첫 열의 상태를 모두 미리 초기화할 수 없고, 각 행을 순회할 때 해당 값을 갱신해야 한다.

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """최소 경로 합: 공간 최적화 동적 계획법"""
        n, m = len(grid), len(grid[0])
        # dp 테이블 초기화
        dp = [0] * m
        # 상태 전이: 첫 행
        dp[0] = grid[0][0]
        for j in range(1, m):
            dp[j] = dp[j - 1] + grid[0][j]
        # 상태 전이: 나머지 행
        for i in range(1, n):
            # 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0]
            # 상태 전이: 나머지 열
            for j in range(1, m):
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        return dp[m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    int minPathSumDPComp(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // dp 테이블 초기화
        vector<int> dp(m);
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp 테이블 초기화
        int[] dp = new int[m];
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp 테이블 초기화
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // 상태 전이: 첫 행
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    func minPathSumDPComp(grid [][]int) int {
        n, m := len(grid), len(grid[0])
        // dp 테이블 초기화
        dp := make([]int, m)
        // 상태 전이: 첫 행
        dp[0] = grid[0][0]
        for j := 1; j < m; j++ {
            dp[j] = dp[j-1] + grid[0][j]
        }
        // 상태 전이: 나머지 행과 열
        for i := 1; i < n; i++ {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0]
            // 상태 전이: 나머지 열
            for j := 1; j < m; j++ {
                dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
            }
        }
        return dp[m-1]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    func minPathSumDPComp(grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        // dp 테이블 초기화
        var dp = Array(repeating: 0, count: m)
        // 상태 전이: 첫 행
        dp[0] = grid[0][0]
        for j in 1 ..< m {
            dp[j] = dp[j - 1] + grid[0][j]
        }
        // 상태 전이: 나머지 행
        for i in 1 ..< n {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0]
            // 상태 전이: 나머지 열
            for j in 1 ..< m {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
        return dp[m - 1]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    function minPathSumDPComp(grid) {
        const n = grid.length,
            m = grid[0].length;
        // dp 테이블 초기화
        const dp = new Array(m);
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for (let j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (let i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (let j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    function minPathSumDPComp(grid: Array<Array<number>>): number {
        const n = grid.length,
            m = grid[0].length;
        // dp 테이블 초기화
        const dp = new Array(m);
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for (let j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (let i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (let j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    int minPathSumDPComp(List<List<int>> grid) {
      int n = grid.length, m = grid[0].length;
      // dp 테이블 초기화
      List<int> dp = List.filled(m, 0);
      dp[0] = grid[0][0];
      for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
      }
      // 상태 전이: 나머지 행
      for (int i = 1; i < n; i++) {
        // 상태 전이: 첫 열
        dp[0] = dp[0] + grid[i][0];
        // 상태 전이: 나머지 열
        for (int j = 1; j < m; j++) {
          dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
      }
      return dp[m - 1];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
        let (n, m) = (grid.len(), grid[0].len());
        // dp 테이블 초기화
        let mut dp = vec![0; m];
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for j in 1..m {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for i in 1..n {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for j in 1..m {
                dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        dp[m - 1]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
        // dp 테이블 초기화
        int *dp = calloc(m, sizeof(int));
        // 상태 전이: 첫 행
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        int res = dp[m - 1];
        // 메모리 해제
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 최소 경로 합: 공간 최적화 동적 계획법 */
    fun minPathSumDPComp(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        // dp 테이블 초기화
        val dp = IntArray(m)
        // 상태 전이: 첫 행
        dp[0] = grid[0][0]
        for (j in 1..<m) {
            dp[j] = dp[j - 1] + grid[0][j]
        }
        // 상태 전이: 나머지 행
        for (i in 1..<n) {
            // 상태 전이: 첫 열
            dp[0] = dp[0] + grid[i][0]
            // 상태 전이: 나머지 열
            for (j in 1..<m) {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
        return dp[m - 1]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 최소 경로 합: 공간 최적화 동적 계획법 ###
    def min_path_sum_dp_comp(grid)
      n, m = grid.length, grid.first.length
      # dp 테이블 초기화
      dp = Array.new(m, 0)
      # 상태 전이: 첫 행
      dp[0] = grid[0][0]
      (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
      # 상태 전이: 나머지 행
      for i in 1...n
        # 상태 전이: 첫 열
        dp[0] = dp[0] + grid[i][0]
        # 상태 전이: 나머지 열
        (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
      end
      dp[m - 1]
    end
    ```

??? pythontutor "실행 과정 시각화"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="실행 과정 시각화" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EA%B3%B5%EA%B0%84%20%EC%B5%9C%EC%A0%81%ED%99%94%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%ED%96%89%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EC%97%B4%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%EC%97%B4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%20%EC%B5%9C%EC%A0%81%ED%99%94%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%EA%B3%B5%EA%B0%84%20%EC%B5%9C%EC%A0%81%ED%99%94%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%ED%96%89%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%ED%96%89%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EC%B2%AB%20%EC%97%B4%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%EC%83%81%ED%83%9C%20%EC%A0%84%EC%9D%B4%3A%20%EB%82%98%EB%A8%B8%EC%A7%80%20%EC%97%B4%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%EA%B3%B5%EA%B0%84%20%EC%B5%9C%EC%A0%81%ED%99%94%20%EB%8F%99%EC%A0%81%20%EA%B3%84%ED%9A%8D%EB%B2%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%EC%99%BC%EC%AA%BD%20%EC%9C%84%EC%97%90%EC%84%9C%20%EC%98%A4%EB%A5%B8%EC%AA%BD%20%EC%95%84%EB%9E%98%EA%B9%8C%EC%A7%80%EC%9D%98%20%EC%B5%9C%EC%86%8C%20%EA%B2%BD%EB%A1%9C%20%ED%95%A9%3A%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">전체 화면으로 보기 ></a></div>
