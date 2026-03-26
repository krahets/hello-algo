// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins []int, amt int) int {
	// Предположим, что список coins упорядочен
	i := len(coins) - 1
	count := 0
	// Повторять жадный выбор, пока не останется суммы
	for amt > 0 {
		// Найти монету, которая меньше оставшейся суммы и ближе всего к ней
		for i > 0 && coins[i] > amt {
			i--
		}
		// Выбрать coins[i]
		amt -= coins[i]
		count++
	}
	// Если допустимое решение не найдено, вернуть -1
	if amt != 0 {
		return -1
	}
	return count
}
