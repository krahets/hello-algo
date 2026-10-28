/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// 행렬의 최대 행과 열 개수가 100이라고 가정한다
#define MAX_SIZE 100

/* 최솟값 구하기 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 최소 경로 합: 완전 탐색 */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* 최소 경로 합: 메모이제이션을 이용한 탐색 */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* 최소 경로 합: 동적 계획법 */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // dp 테이블을 초기화한다
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
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

/* 최소 경로 합: 공간을 최적화한 동적 계획법 */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // dp 테이블을 초기화한다
    int *dp = calloc(m, sizeof(int));
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
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // 메모리 해제
    free(dp);
    return res;
}

/* 실행 코드 */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // 행렬의 용량은 MAX_SIZE * MAX_SIZE이며, 실제 사용하는 행과 열의 크기는 n * m이다

    // 완전 탐색
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합은 %d이다\n", res);

    // 메모이제이션을 이용한 탐색
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합은 %d이다\n", res);

    // 동적 계획법
    res = minPathSumDP(grid, n, m);
    printf("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합은 %d이다\n", res);

    // 공간을 최적화한 동적 계획법
    res = minPathSumDPComp(grid, n, m);
    printf("왼쪽 위에서 오른쪽 아래까지의 최소 경로 합은 %d이다\n", res);

    return 0;
}
