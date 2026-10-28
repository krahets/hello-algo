// File: min_path_sum.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 최소 경로 합: 완전 탐색 */
func minPathSumDFS(grid [][]int, i, j int) int {
	// 왼쪽 위 모서리의 칸이면 탐색을 종료한다
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
	up := minPathSumDFS(grid, i-1, j)
	left := minPathSumDFS(grid, i, j-1)
	// 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
	return int(math.Min(float64(left), float64(up))) + grid[i][j]
}

/* 최소 경로 합: 메모이제이션을 이용한 탐색 */
func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
	// 왼쪽 위 모서리의 칸이면 탐색을 종료한다
	if i == 0 && j == 0 {
		return grid[0][0]
	}
	// 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
	if i < 0 || j < 0 {
		return math.MaxInt
	}
	// 기록이 이미 있으면 바로 반환한다
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
	up := minPathSumDFSMem(grid, mem, i-1, j)
	left := minPathSumDFSMem(grid, mem, i, j-1)
	// 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
	mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
	return mem[i][j]
}

/* 최소 경로 합: 동적 계획법 */
func minPathSumDP(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// dp 테이블을 초기화한다
	dp := make([][]int, n)
	for i := 0; i < n; i++ {
		dp[i] = make([]int, m)
	}
	dp[0][0] = grid[0][0]
	// 상태 전이: 첫 번째 행
	for j := 1; j < m; j++ {
		dp[0][j] = dp[0][j-1] + grid[0][j]
	}
	// 상태 전이: 첫 번째 열
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

/* 최소 경로 합: 공간을 최적화한 동적 계획법 */
func minPathSumDPComp(grid [][]int) int {
	n, m := len(grid), len(grid[0])
	// dp 테이블을 초기화한다
	dp := make([]int, m)
	// 상태 전이: 첫 번째 행
	dp[0] = grid[0][0]
	for j := 1; j < m; j++ {
		dp[j] = dp[j-1] + grid[0][j]
	}
	// 상태 전이: 나머지 행과 열
	for i := 1; i < n; i++ {
		// 상태 전이: 첫 번째 열
		dp[0] = dp[0] + grid[i][0]
		// 상태 전이: 나머지 열
		for j := 1; j < m; j++ {
			dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
		}
	}
	return dp[m-1]
}
