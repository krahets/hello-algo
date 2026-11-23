// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Алгоритм бэктрекинга: все перестановки II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Когда длина состояния равна числу элементов, записать решение
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Перебор всех вариантов выбора
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Попробовать: сделать выбор, обновить состояние
			// Записать значение уже выбранного элемента
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Перейти к следующему выбору
			backtrackII(state, choices, selected, res)
			// Откат: отменить выбор и восстановить предыдущее состояние
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Все перестановки II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
