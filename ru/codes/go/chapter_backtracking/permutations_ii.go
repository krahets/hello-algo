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
	// Перебрать все варианты выбора
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Попытка: сделать выбор и обновить состояние
			// Записатьвыбранныеэлементзначение
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Перейти к следующему варианту выбора
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
