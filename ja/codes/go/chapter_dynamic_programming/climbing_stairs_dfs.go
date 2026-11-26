// File: climbing_stairs_dfs.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 探索 */
func dfs(i int) int {
	// 既知の値 dp[1] と dp[2] のうち、該当する方を返す
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfs(i-1) + dfs(i-2)
	return count
}

/* 階段の登り方：探索 */
func climbingStairsDFS(n int) int {
	return dfs(n)
}
