// File: climbing_stairs_dfs.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 탐색 */
func dfs(i int) int {
	// dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfs(i-1) + dfs(i-2)
	return count
}

/* 계단 오르기: 탐색 */
func climbingStairsDFS(n int) int {
	return dfs(n)
}
