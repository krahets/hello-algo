// File: permutations_ii.go
// Created Time: 2023-05-14
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Поиск с возвратом: перестановки II */
func backtrackII(state *[]int, choices *[]int, selected *[]bool, res *[][]int) {
	// Когда длина текущей перестановки равна числу элементов, сохраняем решение
	if len(*state) == len(*choices) {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
	}
	// Перебираем все варианты
	duplicated := make(map[int]struct{}, 0)
	for i := 0; i < len(*choices); i++ {
		choice := (*choices)[i]
		// Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
		if _, ok := duplicated[choice]; !ok && !(*selected)[i] {
			// Пробуем вариант и обновляем состояние
			// Отмечаем уже выбранные значения
			duplicated[choice] = struct{}{}
			(*selected)[i] = true
			*state = append(*state, choice)
			// Переходим к следующему выбору
			backtrackII(state, choices, selected, res)
			// Возврат: отменяем выбор и восстанавливаем прежнее состояние
			(*selected)[i] = false
			*state = (*state)[:len(*state)-1]
		}
	}
}

/* Перестановки II */
func permutationsII(nums []int) [][]int {
	res := make([][]int, 0)
	state := make([]int, 0)
	selected := make([]bool, len(nums))
	backtrackII(&state, &nums, &selected, &res)
	return res
}
