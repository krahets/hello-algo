// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 現在の状態が解かを判定 */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* 解を記録する */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* 現在の状態でこの選択が有効か判定 */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* 状態を更新する */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* 状態を復元する */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* バックトラッキング：例題 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// 解かを確認
	if isSolution(state) {
		// 解を記録する
		recordSolution(state, res)
	}
	// すべての選択肢を走査する
	for _, choice := range *choices {
		// 枝刈り：選択が有効か確認
		if isValid(state, choice) {
			// 試行：選択を行い、状態を更新する
			makeChoice(state, choice)
			// 次の選択に進む
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// 復元：選択を取り消し、以前の状態に戻す
			undoChoice(state, choice)
		}
	}
}
