// File: unbounded_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 무한 배낭: 동적 계획법 */
func unboundedKnapsackDP(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp 테이블을 초기화한다
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, cap+1)
	}
	// 상태 전이
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// 배낭 용량을 초과하면 물건 i를 선택하지 않는다
				dp[i][c] = dp[i-1][c]
			} else {
				// 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 무한 배낭: 공간을 최적화한 동적 계획법 */
func unboundedKnapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp 테이블을 초기화한다
	dp := make([]int, cap+1)
	// 상태 전이
	for i := 1; i <= n; i++ {
		for c := 1; c <= cap; c++ {
			if wgt[i-1] > c {
				// 배낭 용량을 초과하면 물건 i를 선택하지 않는다
				dp[c] = dp[c]
			} else {
				// 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
