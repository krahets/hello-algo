// File: climbing_stairs_constraint_dp.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 제약 조건이 있는 계단 오르기: 동적 계획법 */
func climbingStairsConstraintDP(n int) int {
	if n == 1 || n == 2 {
		return 1
	}
	// 부분 문제의 해를 저장할 dp 테이블을 초기화한다
	dp := make([][3]int, n+1)
	// 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
	dp[1][1] = 1
	dp[1][2] = 0
	dp[2][1] = 0
	dp[2][2] = 1
	// 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
	for i := 3; i <= n; i++ {
		dp[i][1] = dp[i-1][2]
		dp[i][2] = dp[i-2][1] + dp[i-2][2]
	}
	return dp[n][1] + dp[n][2]
}
