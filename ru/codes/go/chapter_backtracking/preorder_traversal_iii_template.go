// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Проверить, является ли текущее состояние решением */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* Записать решение */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* Обновить состояние */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* Восстановить состояние */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* Алгоритм бэктрекинга: пример 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// Проверить, является ли текущее состояние решением
	if isSolution(state) {
		// Записать решение
		recordSolution(state, res)
	}
	// Перебор всех вариантов выбора
	for _, choice := range *choices {
		// Отсечение: проверить допустимость выбора
		if isValid(state, choice) {
			// Попытка: сделать выбор и обновить состояние
			makeChoice(state, choice)
			// Перейти к следующему выбору
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// Откат: отменить выбор и восстановить предыдущее состояние
			undoChoice(state, choice)
		}
	}
}
