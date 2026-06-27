// File: climbing_stairs_dfs.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Search */
func dfs(i int) int {
	// Known dp[1] and dp[2], return them
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfs(i-1) + dfs(i-2)
	return count
}

/* Climbing stairs: Search */
func climbingStairsDFS(n int) int {
	return dfs(n)
}
