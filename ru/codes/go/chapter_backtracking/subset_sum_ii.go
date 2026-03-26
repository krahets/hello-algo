// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Алгоритм бэктрекинга: сумма подмножества II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// Если сумма подмножества равна target, записать решение
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Обойти все варианты выбора
	// Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
	// Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
	for i := start; i < len(*choices); i++ {
		// Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
		// Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
		if target-(*choices)[i] < 0 {
			break
		}
		// Отсечение 4: если этот элемент равен элементу слева, значит данная ветвь поиска дублируется, ее нужно сразу пропустить
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// Попытка: сделать выбор и обновить target, start
		*state = append(*state, (*choices)[i])
		// Перейти к следующему варианту выбора
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// Откат: отменить выбор и восстановить предыдущее состояние
		*state = (*state)[:len(*state)-1]
	}
}

/* Решить задачу суммы подмножества II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // Состояние (подмножество)
	sort.Ints(nums)         // Отсортировать nums
	start := 0              // Обход начальной вершины
	res := make([][]int, 0) // Список результатов (список подмножеств)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
