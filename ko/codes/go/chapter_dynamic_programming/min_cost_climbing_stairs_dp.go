// File: min_cost_climbing_stairs_dp.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 계단 오르기의 최소 비용: 동적 계획법 */
func minCostClimbingStairsDP(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// 부분 문제의 해를 저장할 dp 테이블 초기화
	dp := make([]int, n+1)
	// 초기 상태: 가장 작은 부분 문제의 해를 설정한다
	dp[1] = cost[1]
	dp[2] = cost[2]
	// 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
	for i := 3; i <= n; i++ {
		dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
	}
	return dp[n]
}

/* 계단 오르기의 최소 비용: 공간 최적화 동적 계획법 */
func minCostClimbingStairsDPComp(cost []int) int {
	n := len(cost) - 1
	if n == 1 || n == 2 {
		return cost[n]
	}
	min := func(a, b int) int {
		if a < b {
			return a
		}
		return b
	}
	// 초기 상태: 가장 작은 부분 문제의 해를 설정한다
	a, b := cost[1], cost[2]
	// 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
	for i := 3; i <= n; i++ {
		tmp := b
		b = min(a, tmp) + cost[i]
		a = tmp
	}
	return b
}
