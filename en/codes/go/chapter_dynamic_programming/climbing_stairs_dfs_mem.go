// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Memoization search */
func dfsMem(i int, mem []int) int {
	// Known dp[1] and dp[2], return them
	if i == 1 || i == 2 {
		return i
	}
	// If record dp[i] exists, return it directly
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// Record dp[i]
	mem[i] = count
	return count
}

/* Climbing stairs: Memoization search */
func climbingStairsDFSMem(n int) int {
	// mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
