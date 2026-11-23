// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 메모이제이션을 이용한 탐색 */
func dfsMem(i int, mem []int) int {
	// dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
	if i == 1 || i == 2 {
		return i
	}
	// dp[i]의 기록이 있으면 해당 값을 바로 반환한다
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// dp[i]를 기록한다
	mem[i] = count
	return count
}

/* 계단 오르기: 메모이제이션을 이용한 탐색 */
func climbingStairsDFSMem(n int) int {
	// mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
