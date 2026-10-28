// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 현재 상태가 해인지 판단 */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* 해를 기록한다 */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* 현재 상태에서 해당 선택이 유효한지 판단 */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* 상태 갱신 */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* 상태 복원 */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* 백트래킹 알고리즘: 예제 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// 해인지 확인한다
	if isSolution(state) {
		// 해를 기록한다
		recordSolution(state, res)
	}
	// 모든 선택지를 순회한다
	for _, choice := range *choices {
		// 가지치기: 선택이 유효한지 확인한다
		if isValid(state, choice) {
			// 시도: 선택하고 상태를 갱신한다
			makeChoice(state, choice)
			// 다음 선택을 진행한다
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
			undoChoice(state, choice)
		}
	}
}
