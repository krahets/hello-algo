// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 메모이제이션 탐색 */
func dfsMem(i int, mem []int) int {
	// 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
	if i == 1 || i == 2 {
		return i
	}
	// dp[i]의 기록이 있으면 바로 반환한다
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// dp[i] 기록
	mem[i] = count
	return count
}

/* 계단 오르기: 메모이제이션 탐색 */
func climbingStairsDFSMem(n int) int {
	// mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
