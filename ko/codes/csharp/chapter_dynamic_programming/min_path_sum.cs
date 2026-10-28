/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* 최소 경로 합: 완전 탐색 */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.Min(left, up) + grid[i][j];
    }

    /* 최소 경로 합: 메모이제이션을 이용한 탐색 */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 기록이 이미 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 최소 경로 합: 동적 계획법 */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 번째 열
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

    /* 최소 경로 합: 공간을 최적화한 동적 계획법 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 번째 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    [Test]
    public void Test() {
        int[][] grid =
        [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2]
        ];

        int n = grid.Length, m = grid[0].Length;

        // 완전 탐색
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 메모이제이션을 이용한 탐색
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 동적 계획법
        res = MinPathSumDP(grid);
        Console.WriteLine("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 공간을 최적화한 동적 계획법
        res = MinPathSumDPComp(grid);
        Console.WriteLine("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);
    }
}
