// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Memoized search */
func dfsMem(i int, mem []int) int {
	// The values of dp[1] and dp[2] are known; return them
	if i == 1 || i == 2 {
		return i
	}
	// If dp[i] has been recorded, return it directly
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// Record dp[i]
	mem[i] = count
	return count
}

/* Climbing stairs: memoized search */
func climbingStairsDFSMem(n int) int {
	// mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
