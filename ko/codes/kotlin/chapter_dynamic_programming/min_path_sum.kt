/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 최소 경로 합: 완전 탐색 */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    return min(left, up) + grid[i][j]
}

/* 최소 경로 합: 메모이제이션을 이용한 탐색 */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* 최소 경로 합: 동적 계획법 */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // dp 테이블을 초기화한다
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // 상태 전이: 첫 번째 행
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // 상태 전이: 첫 번째 열
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

/* 최소 경로 합: 공간을 최적화한 동적 계획법 */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // dp 테이블을 초기화한다
    val dp = IntArray(m)
    // 상태 전이: 첫 번째 행
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // 상태 전이: 나머지 행
    for (i in 1..<n) {
        // 상태 전이: 첫 번째 열
        dp[0] = dp[0] + grid[i][0]
        // 상태 전이: 나머지 열
        for (j in 1..<m) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

/* 실행 코드 */
fun main() {
    val grid = arrayOf(
        intArrayOf(1, 3, 1, 5),
        intArrayOf(2, 2, 4, 2),
        intArrayOf(5, 3, 2, 1),
        intArrayOf(4, 3, 5, 2)
    )
    val n = grid.size
    val m = grid[0].size

    // 완전 탐색
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합 = $res")

    // 메모이제이션을 이용한 탐색
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합 = $res")

    // 동적 계획법
    res = minPathSumDP(grid)
    println("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합 = $res")

    // 공간을 최적화한 동적 계획법
    res = minPathSumDPComp(grid)
    println("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합 = $res")
}