// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 백트래킹 */
func backtrack(choices []int, state, n int, res []int) {
	// n번째 계단에 도달하면 방법의 수에 1을 더한다
	if state == n {
		res[0] = res[0] + 1
	}
	// 모든 선택지를 순회한다
	for _, choice := range choices {
		// 가지치기: n번째 계단을 넘어갈 수 없다
		if state+choice > n {
			continue
		}
		// 시도: 선택하고 상태를 갱신한다
		backtrack(choices, state+choice, n, res)
		// 되돌리기
	}
}

/* 계단 오르기: 백트래킹 */
func climbingStairsBacktrack(n int) int {
	// 한 계단 또는 두 계단 오르기를 선택할 수 있다
	choices := []int{1, 2}
	// 0번째 계단에서 오르기 시작한다
	state := 0
	res := make([]int, 1)
	// res[0]에 방법의 수를 기록한다
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
