// File: climbing_stairs_dfs.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 搜尋 */
func dfs(i int) int {
	// 已知 dp[1] 和 dp[2] ，返回之
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfs(i-1) + dfs(i-2)
	return count
}

/* 爬樓梯：搜尋 */
func climbingStairsDFS(n int) int {
	return dfs(n)
}
