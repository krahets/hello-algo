// File: subset_sum_ii.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import "sort"

/* Поиск с возвратом: сумма подмножества II */
func backtrackSubsetSumII(start, target int, state, choices *[]int, res *[][]int) {
	// Если сумма подмножества равна target, сохраняем решение
	if target == 0 {
		newState := append([]int{}, *state...)
		*res = append(*res, newState)
		return
	}
	// Перебираем все варианты
	// Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
	// Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
	for i := start; i < len(*choices); i++ {
		// Отсечение 1: если сумма подмножества превышает target, выходим из цикла
		// Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
		if target-(*choices)[i] < 0 {
			break
		}
		// Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
		if i > start && (*choices)[i] == (*choices)[i-1] {
			continue
		}
		// Пробуем вариант и обновляем target и start
		*state = append(*state, (*choices)[i])
		// Переходим к следующему выбору
		backtrackSubsetSumII(i+1, target-(*choices)[i], state, choices, res)
		// Возврат: отменяем выбор и восстанавливаем прежнее состояние
		*state = (*state)[:len(*state)-1]
	}
}

/* Задача о сумме подмножества II */
func subsetSumII(nums []int, target int) [][]int {
	state := make([]int, 0) // Состояние (подмножество)
	sort.Ints(nums)         // Сортируем nums
	start := 0              // Начальная позиция перебора
	res := make([][]int, 0) // Список результатов (список подмножеств)
	backtrackSubsetSumII(start, target, &state, &nums, &res)
	return res
}
