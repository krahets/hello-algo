// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Алгоритм бэктрекинга: сумма подмножеств I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// Если сумма подмножества равна target, записать решение
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Перебор всех вариантов выбора
	for i := 0; i < len(*choices); i++ {
		// Отсечение: если сумма подмножества превышает target, пропустить этот выбор
		if total+(*choices)[i] > target {
			continue
		}
		// Попытка: сделать выбор и обновить элемент и total
		*state = append(*state, (*choices)[i])
		// Перейти к следующему выбору
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Откат: отменить выбор и восстановить предыдущее состояние
		*state = (*state)[:len(*state)-1]
	}
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // Состояние (подмножество)
	total := 0              // Сумма подмножеств
	res := make([][]int, 0) // Список результатов (список подмножеств)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
