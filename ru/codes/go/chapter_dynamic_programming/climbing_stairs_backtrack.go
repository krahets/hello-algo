// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Бэктрекинг */
func backtrack(choices []int, state, n int, res []int) {
	// Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
	if state == n {
		res[0] = res[0] + 1
	}
	// Перебор всех вариантов выбора
	for _, choice := range choices {
		// Отсечение: нельзя выходить за n-ю ступень
		if state+choice > n {
			continue
		}
		// Попытка: сделать выбор и обновить состояние
		backtrack(choices, state+choice, n, res)
		// Откат
	}
}

/* Подъем по лестнице: бэктрекинг */
func climbingStairsBacktrack(n int) int {
	// Можно подняться на 1 или 2 ступени
	choices := []int{1, 2}
	// Начать подъем с 0-й ступени
	state := 0
	res := make([]int, 1)
	// Использовать res[0] для хранения числа решений
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
