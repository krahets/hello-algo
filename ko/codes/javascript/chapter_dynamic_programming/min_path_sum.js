/**
 * File: min_path_sum.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 최소 경로 합: 완전 탐색 */
function minPathSumDFS(grid, i, j) {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    return Math.min(left, up) + grid[i][j];
}

/* 최소 경로 합: 메모이제이션을 이용한 탐색 */
function minPathSumDFSMem(grid, mem, i, j) {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][j] !== -1) {
        return mem[i][j];
    }
    // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* 최소 경로 합: 동적 계획법 */
function minPathSumDP(grid) {
    const n = grid.length,
        m = grid[0].length;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // 상태 전이: 첫 번째 행
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 상태 전이: 첫 번째 열
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

/* 최소 경로 합: 공간을 최적화한 동적 계획법 */
function minPathSumDPComp(grid) {
    const n = grid.length,
        m = grid[0].length;
    // dp 테이블을 초기화한다
    const dp = new Array(m);
    // 상태 전이: 첫 번째 행
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 상태 전이: 나머지 행
    for (let i = 1; i < n; i++) {
        // 상태 전이: 첫 번째 열
        dp[0] = dp[0] + grid[i][0];
        // 상태 전이: 나머지 열
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* 실행 코드 */
const grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
];
const n = grid.length,
    m = grid[0].length;
// 완전 탐색
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: ${res}`);

// 메모이제이션을 이용한 탐색
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: ${res}`);

// 동적 계획법
res = minPathSumDP(grid);
console.log(`왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: ${res}`);

// 공간을 최적화한 동적 계획법
res = minPathSumDPComp(grid);
console.log(`왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: ${res}`);
