// File: subset_sum_i.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* 백트래킹 알고리즘: 부분 집합 합 I */
func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
	// 부분 집합의 합이 target과 같으면 해를 기록한다
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// 모든 선택지를 순회한다
	// 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
	for i := start; i < len(*choices); i++ {
		// 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
		// 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
		if target-(*choices)[i] < 0 {
			break
		}
		// 시도: 선택하고 target, start를 갱신한다
		*state = append(*state, (*choices)[i])
		// 다음 선택을 진행한다
		backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
		// 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
		*state = (*state)[:len(*state)-1]
	}
}

/* 부분 집합 합 I 풀기 */
func subsetSumI(nums []int, target int) [][]int {
	state := make([]int, 0) // 상태(부분 집합)
	sort.Ints(nums)         // nums를 정렬한다
	start := 0              // 순회 시작 위치
	res := make([][]int, 0) // 결과 리스트(부분 집합 리스트)
	backtrackSubsetSumI(start, target, &state, &nums, &res)
	return res
}
