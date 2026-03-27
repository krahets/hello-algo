// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* Размен монет: жадный алгоритм */
func coinChangeGreedy(coins []int, amt int) int {
	// Предположить, что список coins упорядочен
	i := len(coins) - 1
	count := 0
	// Циклически выполнять жадный выбор, пока не останется суммы
	for amt > 0 {
		// Найти монету, которая меньше остатка суммы и наиболее к нему близка
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
