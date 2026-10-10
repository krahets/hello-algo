// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 現在の状態が解かどうかを判定 */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* 解を記録 */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* 現在の状態で、この選択が有効かどうかを判定 */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* 状態を更新 */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* 状態を元に戻す */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* バックトラッキング：例題 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// 解かどうかを確認
	if isSolution(state) {
		// 解を記録
		recordSolution(state, res)
	}
	// すべての選択肢を走査
	for _, choice := range *choices {
		// 枝刈り：選択が妥当かを確認する
		if isValid(state, choice) {
			// 試行: 選択を行い、状態を更新
			makeChoice(state, choice)
			// 次の選択へ進む
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// バックトラック：選択を取り消し、前の状態に戻す
			undoChoice(state, choice)
		}
	}
}
