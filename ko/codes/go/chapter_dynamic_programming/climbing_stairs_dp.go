// File: climbing_stairs_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 계단 오르기: 동적 계획법 */
func climbingStairsDP(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	// 부분 문제의 해를 저장할 dp 테이블 초기화
	dp := make([]int, n+1)
	// 초기 상태: 가장 작은 부분 문제의 해를 설정한다
	dp[1] = 1
	dp[2] = 2
	// 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
	for i := 3; i <= n; i++ {
		dp[i] = dp[i-1] + dp[i-2]
	}
	return dp[n]
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
func climbingStairsDPComp(n int) int {
	if n == 1 || n == 2 {
		return n
	}
	a, b := 1, 2
	// 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
	for i := 3; i <= n; i++ {
		a, b = b, a+b
	}
	return b
}
