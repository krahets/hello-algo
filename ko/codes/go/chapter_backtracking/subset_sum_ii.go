// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* 백트래킹 알고리즘: 부분 집합 합 II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// 부분 집합의 합이 target과 같으면 해를 기록한다
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 모든 선택지를 순회한다
	// 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
	// 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
	for i := start; i < len(*choices); i++ {
		// 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
		// 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
		if target-(*choices)[i] < 0 {
			break
		}
		// 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// 시도: 선택하고 target, start를 갱신한다
		*state = append(*state, (*choices)[i])
		// 다음 선택을 진행한다
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
		*state = (*state)[:len(*state)-1]
	}
}

/* 부분 집합 합 II 풀기 */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // 상태(부분 집합)
	sort.Ints(nums)         // nums를 정렬한다
	start := 0              // 순회 시작 위치
	res := make([][]int, 0) // 결과 리스트(부분 집합 리스트)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
