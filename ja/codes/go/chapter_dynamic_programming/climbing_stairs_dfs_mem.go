// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* メモ化探索 */
func dfsMem(i int, mem []int) int {
	// 既知の値 dp[1] と dp[2] のうち、該当する方を返す
	if i == 1 || i == 2 {
		return i
	}
	// dp[i] が記録済みなら、その値を返す
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// dp[i] を記録する
	mem[i] = count
	return count
}

/* 階段の登り方：メモ化探索 */
func climbingStairsDFSMem(n int) int {
	// mem[i] に i 段目までの登り方の総数を記録する。-1 は未記録を表す
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
