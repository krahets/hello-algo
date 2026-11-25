// File: coin_change_ii.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 동전 교환 II: 동적 계획법 */
func coinChangeIIDP(coins []int, amt int) int {
	n := len(coins)
	// dp 테이블 초기화
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// 첫 열 초기화
	for i := 0; i <= n; i++ {
		dp[i][0] = 1
	}
	// 상태 전이: 나머지 행과 열
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 목표 금액을 넘으면 동전 i를 선택하지 않는다
				dp[i][a] = dp[i-1][a]
			} else {
				// 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
				dp[i][a] = dp[i-1][a] + dp[i][a-coins[i-1]]
			}
		}
	}
	return dp[n][amt]
}

/* 동전 교환 II: 공간 최적화 동적 계획법 */
func coinChangeIIDPComp(coins []int, amt int) int {
	n := len(coins)
	// dp 테이블 초기화
	dp := make([]int, amt+1)
	dp[0] = 1
	// 상태 전이
	for i := 1; i <= n; i++ {
		// 정순으로 순회
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 목표 금액을 넘으면 동전 i를 선택하지 않는다
				dp[a] = dp[a]
			} else {
				// 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
				dp[a] = dp[a] + dp[a-coins[i-1]]
			}
		}
	}
	return dp[amt]
}
