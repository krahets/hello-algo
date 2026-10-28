// File: knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

import "math"

/* 0-1 배낭: 완전 탐색 */
func knapsackDFS(wgt, val []int, i, c int) int {
	// 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
	if i == 0 || c == 0 {
		return 0
	}
	// 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
	if wgt[i-1] > c {
		return knapsackDFS(wgt, val, i-1, c)
	}
	// 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
	no := knapsackDFS(wgt, val, i-1, c)
	yes := knapsackDFS(wgt, val, i-1, c-wgt[i-1]) + val[i-1]
	// 두 경우 중 더 큰 가치를 반환한다
	return int(math.Max(float64(no), float64(yes)))
}

/* 0-1 배낭: 메모이제이션을 이용한 탐색 */
func knapsackDFSMem(wgt, val []int, mem [][]int, i, c int) int {
	// 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
	if i == 0 || c == 0 {
		return 0
	}
	// 기록이 이미 있으면 바로 반환한다
	if mem[i][c] != -1 {
		return mem[i][c]
	}
	// 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
	if wgt[i-1] > c {
		return knapsackDFSMem(wgt, val, mem, i-1, c)
	}
	// 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
	no := knapsackDFSMem(wgt, val, mem, i-1, c)
	yes := knapsackDFSMem(wgt, val, mem, i-1, c-wgt[i-1]) + val[i-1]
	// 두 경우 중 더 큰 가치를 반환한다
	mem[i][c] = int(math.Max(float64(no), float64(yes)))
	return mem[i][c]
}

/* 0-1 배낭: 동적 계획법 */
func knapsackDP(wgt, val []int, cap int) int {
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
				dp[i][c] = int(math.Max(float64(dp[i-1][c]), float64(dp[i-1][c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[n][cap]
}

/* 0-1 배낭: 공간을 최적화한 동적 계획법 */
func knapsackDPComp(wgt, val []int, cap int) int {
	n := len(wgt)
	// dp 테이블을 초기화한다
	dp := make([]int, cap+1)
	// 상태 전이
	for i := 1; i <= n; i++ {
		// 역방향 순회
		for c := cap; c >= 1; c-- {
			if wgt[i-1] <= c {
				// 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
				dp[c] = int(math.Max(float64(dp[c]), float64(dp[c-wgt[i-1]]+val[i-1])))
			}
		}
	}
	return dp[cap]
}
