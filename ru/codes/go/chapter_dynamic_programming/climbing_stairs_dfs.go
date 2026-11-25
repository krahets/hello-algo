// File: climbing_stairs_dfs.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Поиск */
func dfs(i int) int {
	// Для dp[1] и dp[2] вернуть известные значения
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfs(i-1) + dfs(i-2)
	return count
}

/* Подъём по лестнице: поиск */
func climbingStairsDFS(n int) int {
	return dfs(n)
}
