// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Алгоритм бэктрекинга: все перестановки I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Когда длина состояния равна числу элементов, записать решение
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Перебор всех вариантов выбора
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Отсечение: нельзя выбирать один и тот же элемент повторно
		if !(*selected)[i] {
			// Попытка: сделать выбор и обновить состояние
			(*selected)[i] = true
			*state = append(*state, choice)
			// Перейти к следующему выбору
			backtrackI(state, choices, selected, res)
			// Откат: отменить выбор и восстановить предыдущее состояние
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Все перестановки I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
