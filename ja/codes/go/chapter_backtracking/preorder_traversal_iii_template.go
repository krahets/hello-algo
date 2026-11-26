// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 現在の状態が解かどうか判定する */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* 解を記録する */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* 現在の状態でその選択が可能か判定する */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* 状態を更新する */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* 状態を元に戻す */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* バックトラッキング：例題 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// 解かどうか調べる
	if isSolution(state) {
		// 解を記録する
		recordSolution(state, res)
	}
	// すべての選択肢を調べる
	for _, choice := range *choices {
		// 枝刈り：その選択が可能か調べる
		if isValid(state, choice) {
			// 試行：選択して状態を更新する
			makeChoice(state, choice)
			// 次の選択に進む
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// 後戻り：選択を取り消し、元の状態に戻す
			undoChoice(state, choice)
		}
	}
}
