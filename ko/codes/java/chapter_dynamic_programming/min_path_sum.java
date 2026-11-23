/**
 * File: min_path_sum.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_path_sum {
    /* 최소 경로 합: 완전 탐색 */
    static int minPathSumDFS(int[][] grid, int i, int j) {
        // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
        return Math.min(left, up) + grid[i][j];
    }

    /* 최소 경로 합: 메모이제이션을 이용한 탐색 */
    static int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 기록이 이미 있으면 바로 반환한다
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* 최소 경로 합: 동적 계획법 */
    static int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp 테이블을 초기화한다
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 상태 전이: 첫 번째 열
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

    /* 최소 경로 합: 공간을 최적화한 동적 계획법 */
    static int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp 테이블을 초기화한다
        int[] dp = new int[m];
        // 상태 전이: 첫 번째 행
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i < n; i++) {
            // 상태 전이: 첫 번째 열
            dp[0] = dp[0] + grid[i][0];
            // 상태 전이: 나머지 열
            for (int j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    public static void main(String[] args) {
        int[][] grid = {
                { 1, 3, 1, 5 },
                { 2, 2, 4, 2 },
                { 5, 3, 2, 1 },
                { 4, 3, 5, 2 }
        };
        int n = grid.length, m = grid[0].length;

        // 완전 탐색
        int res = minPathSumDFS(grid, n - 1, m - 1);
        System.out.println("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 메모이제이션을 이용한 탐색
        int[][] mem = new int[n][m];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
        System.out.println("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 동적 계획법
        res = minPathSumDP(grid);
        System.out.println("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);

        // 공간을 최적화한 동적 계획법
        res = minPathSumDPComp(grid);
        System.out.println("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: " + res);
    }
}
