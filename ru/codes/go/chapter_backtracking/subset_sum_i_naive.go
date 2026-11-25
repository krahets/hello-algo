// File: subset_sum_i_naive.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

/* Поиск с возвратом: сумма подмножества I */
func backtrackSubsetSumINaive(total, target int, state, choices *[]int, res *[][]int) {
	// Если сумма подмножества равна target, сохраняем решение
	if target == total {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Перебираем все варианты
	for i := 0; i < len(*choices); i++ {
		// Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
		if total+(*choices)[i] > target {
			continue
		}
		// Пробуем вариант и обновляем сумму элементов total
		*state = append(*state, (*choices)[i])
		// Переходим к следующему выбору
		backtrackSubsetSumINaive(total+(*choices)[i], target, state, choices, res)
		// Возврат: отменяем выбор и восстанавливаем прежнее состояние
		*state = (*state)[:len(*state)-1]
	}
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
func subsetSumINaive(nums []int, target int) [][]int {
	state := make([]int, 0) // Состояние (подмножество)
	total := 0              // Сумма подмножества
	res := make([][]int, 0) // Список результатов (список подмножеств)
	backtrackSubsetSumINaive(total, target, &state, &nums, &res)
	return res
}
