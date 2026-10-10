// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* メモ化探索 */
func dfsMem(i int, mem []int) int {
	// dp[1] と dp[2] は既知なので返す
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] の記録があれば、それをそのまま返す
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// dp[i] を記録する
	mem[i] = count
	return count
}

/* 階段登り：メモ化探索 */
func climbingStairsDFSMem(n int) int {
	// mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
