// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Memoized search */
func dfsMem(i int, mem []int) int {
	// Known dp[1] and dp[2], return them
	if i == 1 || i == 2 {
		return i
	}
	// If there is a record for dp[i], return it
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// Record dp[i]
	mem[i] = count
	return count
}

/* Climbing stairs: Memoized search */
func climbingStairsDFSMem(n int) int {
	// mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
