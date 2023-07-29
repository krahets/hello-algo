// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 记忆化搜索 */
func dfsMem(i int, mem []int) int {
	// 已知 dp[1] 和 dp[2] ，返回之
	if i == 1 || i == 2 {
		return i
	}
	// 若存在记录 dp[i] ，则直接返回之
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// 记录 dp[i]
	mem[i] = count
	return count
}

/* 爬楼梯：记忆化搜索 */
func climbingStairsDFSMem(n int) int {
	// mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
