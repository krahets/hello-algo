// File: permutations_i.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Поиск с возвратом: перестановки I */
func backtrackI(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Когда длина текущей перестановки равна числу элементов, сохраняем решение
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Перебираем все варианты
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Отсечение: нельзя выбирать один элемент дважды
		if !(*selected)[i] {
			// Пробуем вариант и обновляем состояние
			(*selected)[i] = true
			*state = append(*state, choice)
			// Переходим к следующему выбору
			backtrackI(state, choices, selected, res)
			// Возврат: отменяем выбор и восстанавливаем прежнее состояние
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Перестановки I */
func permutationsI(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackI(&state, &nums, &selected, &res)
	return res
}
