// File: subset_sum_i.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Алгоритм бэктрекинга: сумма подмножеств I */
func backtrackSubsetSumI(start, target int, state, choices *[]int, res *[][]int) {
	// Если сумма подмножества равна target, записать решение
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Обойти все варианты выбора
	// Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
	for i := start; i < len(*choices); i++ {
		// Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
		// Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
		if target-(*choices)[i] < 0 {
			break
		}
		// Попытка: сделать выбор и обновить target и start
		*state = append(*state, (*choices)[i])
		// Перейти к следующему выбору
		backtrackSubsetSumI(i, target-(*choices)[i], state, choices, res)
		// Откат: отменить выбор и восстановить предыдущее состояние
		*state = (*state)[:len(*state)-1]
	}
}

/* Решить задачу суммы подмножеств I */
func subsetSumI(nums []int, target int) [][]int {
	state := make([]int, 0) // Состояние (подмножество)
	sort.Ints(nums)         // Отсортировать nums
	start := 0              // Стартовая вершина обхода
	res := make([][]int, 0) // Список результатов (список подмножеств)
	backtrackSubsetSumI(start, target, &state, &nums, &res)
	return res
}
