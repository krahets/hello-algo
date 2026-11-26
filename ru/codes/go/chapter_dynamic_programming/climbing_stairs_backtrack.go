// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Поиск с возвратом */
func backtrack(choices []int, state, n int, res []int) {
	// На ступени n увеличить число способов на 1
	if state == n {
		res[0] = res[0] + 1
	}
	// Перебрать все варианты
	for _, choice := range choices {
		// Отсечь шаги за ступень n
		if state+choice > n {
			continue
		}
		// Сделать выбор и обновить состояние
		backtrack(choices, state+choice, n, res)
		// Отменить выбор
	}
}

/* Подъём по лестнице: поиск с возвратом */
func climbingStairsBacktrack(n int) int {
	// Можно подняться на 1 или 2 ступени
	choices := []int{1, 2}
	// Начать со ступени 0
	state := 0
	res := make([]int, 1)
	// Хранить число способов в res[0]
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
