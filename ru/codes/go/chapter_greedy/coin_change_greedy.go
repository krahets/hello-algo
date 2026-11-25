// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins []int, amt int) int {
	// Список coins предполагается отсортированным
	i := len(coins) - 1
	count := 0
	// Повторяем жадный выбор, пока остаток суммы не обнулится
	for amt > 0 {
		// Ищем ближайший к остатку номинал среди меньших, чем остаток
		for i > 0 && coins[i] > amt {
			i--
		}
		// Берём coins[i]
		amt -= coins[i]
		count++
	}
	// Если решения не нашлось, возвращаем -1
	if amt != 0 {
		return -1
	}
	return count
}
