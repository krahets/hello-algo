// File: coin_change.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 동전 교환: 동적 계획법 */
func coinChangeDP(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// dp 테이블을 초기화한다
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, amt+1)
	}
	// 상태 전이: 첫 번째 행과 첫 번째 열
	for a := 1; a <= amt; a++ {
		dp[0][a] = max
	}
	// 상태 전이: 나머지 행과 열
	for i := 1; i <= n; i++ {
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 목표 금액을 초과하면 동전 i를 선택하지 않는다
				dp[i][a] = dp[i-1][a]
			} else {
				// 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
				dp[i][a] = int(math.Min(float64(dp[i-1][a]), float64(dp[i][a-coins[i-1]]+1)))
			}
		}
	}
	if dp[n][amt] != max {
		return dp[n][amt]
	}
	return -1
}

/* 동전 교환: 동적 계획법 */
func coinChangeDPComp(coins []int, amt int) int {
	n := len(coins)
	max := amt + 1
	// dp 테이블을 초기화한다
	dp := make([]int, amt+1)
	for i := 1; i <= amt; i++ {
		dp[i] = max
	}
	// 상태 전이
	for i := 1; i <= n; i++ {
		// 정방향 순회
		for a := 1; a <= amt; a++ {
			if coins[i-1] > a {
				// 목표 금액을 초과하면 동전 i를 선택하지 않는다
				dp[a] = dp[a]
			} else {
				// 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
				dp[a] = int(math.Min(float64(dp[a]), float64(dp[a-coins[i-1]]+1)))
			}
		}
	}
	if dp[amt] != max {
		return dp[amt]
	}
	return -1
}
