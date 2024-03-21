// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 判斷當前狀態是否為解 */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* 記錄解 */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* 判斷在當前狀態下，該選擇是否合法 */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* 更新狀態 */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* 恢復狀態 */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* 回溯演算法：例題三 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// 檢查是否為解
	if isSolution(state) {
		// 記錄解
		recordSolution(state, res)
	}
	// 走訪所有選擇
	for _, choice := range *choices {
		// 剪枝：檢查選擇是否合法
		if isValid(state, choice) {
			// 嘗試：做出選擇，更新狀態
			makeChoice(state, choice)
			// 進行下一輪選擇
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// 回退：撤銷選擇，恢復到之前的狀態
			undoChoice(state, choice)
		}
	}
}
