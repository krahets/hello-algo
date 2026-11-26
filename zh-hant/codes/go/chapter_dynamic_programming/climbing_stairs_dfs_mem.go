// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 記憶化搜尋 */
func dfsMem(i int, mem []int) int {
	// 已知 dp[1] 和 dp[2]，直接回傳對應的值
	if i == 1 || i == 2 {
		return i
	}
	// 若已有 dp[i] 的紀錄，就直接回傳該值
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// 記錄 dp[i]
	mem[i] = count
	return count
}

/* 爬樓梯：記憶化搜尋 */
func climbingStairsDFSMem(n int) int {
	// mem[i] 記錄爬到第 i 階的走法總數，-1 表示尚無紀錄
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
