// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* 백트래킹: 부분집합의 합 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 부분집합의 합이 target과 같으면 해를 기록한다
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 모든 선택지를 순회한다
	// 가지치기 2: start부터 순회하여 같은 부분집합이 중복 생성되는 것을 막는다
	// 가지치기 3: start부터 순회하여 같은 원소를 다시 선택하지 않는다
	for i := start; i < len(*choices); i++ {
		// 가지치기 1: 부분집합의 합이 target을 초과하면 즉시 반복을 끝낸다
		// 배열이 정렬되어 뒤의 원소가 더 크므로 부분집합의 합이 반드시 target을 초과한다
		if target-(*choices)[i] < 0 {
			break
		}
		// 가지치기 4: 왼쪽 원소와 값이 같으면 중복된 탐색 분기이므로 건너뛴다
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 시도: 원소를 선택하고 target과 start를 갱신한다
		*state = append(*state, (*choices)[i])
		// 다음 선택을 진행한다
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 되돌리기: 선택을 취소하고 이전 상태를 복원한다
		*state = (*state)[:len(*state)-1]
	}
}

/* 부분집합의 합 II 풀기 */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 상태(부분집합)
	sort.Ints(nums)         // nums를 정렬한다
	start := 0              // 순회 시작점
	res := make([][]int, 0) // 결과 리스트(부분집합의 리스트)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
