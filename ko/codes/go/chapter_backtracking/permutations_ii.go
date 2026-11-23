// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* 백트래킹 알고리즘: 모든 순열 II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// 상태의 길이가 원소 개수와 같으면 해를 기록한다
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// 모든 선택지를 순회한다
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// 가지치기: 원소를 중복하여 선택할 수 없으며, 값이 같은 원소도 중복하여 선택할 수 없다
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// 시도: 선택하고 상태를 갱신한다
			// 선택한 원소의 값을 기록한다
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// 다음 선택을 진행한다
			backtrackII(state, choices, selected, res)
			// 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* 모든 순열 II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
