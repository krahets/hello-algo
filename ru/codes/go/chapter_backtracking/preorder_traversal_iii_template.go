// File: preorder_traversal_iii_template.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Проверяем, является ли текущее состояние решением */
func isSolution(state *[]*TreeNode) bool {
	return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
}

/* Сохраняем решение */
func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
	*res = append(*res, append([]*TreeNode{}, *state...))
}

/* Проверяем, допустим ли выбор в текущем состоянии */
func isValid(state *[]*TreeNode, choice *TreeNode) bool {
	return choice != nil && choice.Val != 3
}

/* Обновляем состояние */
func makeChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = append(*state, choice)
}

/* Восстанавливаем состояние */
func undoChoice(state *[]*TreeNode, choice *TreeNode) {
	*state = (*state)[:len(*state)-1]
}

/* Поиск с возвратом: пример 3 */
func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
	// Проверяем, найдено ли решение
	if isSolution(state) {
		// Сохраняем решение
		recordSolution(state, res)
	}
	// Перебираем все варианты
	for _, choice := range *choices {
		// Отсечение: проверяем допустимость выбора
		if isValid(state, choice) {
			// Пробуем вариант и обновляем состояние
			makeChoice(state, choice)
			// Переходим к следующему выбору
			temp := make([]*TreeNode, 0)
			temp = append(temp, choice.Left, choice.Right)
			backtrackIII(state, &temp, res)
			// Возврат: отменяем выбор и восстанавливаем прежнее состояние
			undoChoice(state, choice)
		}
	}
}
