// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// Инициализировать двусторонне замкнутый интервал [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Вычислить индекс середины m
		m := i + (j-i)/2
		if nums[m] < target {
			// target находится в интервале [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// target находится в интервале [i, m-1]
			j = m - 1
		} else {
			// Найти target и вернуть точку вставки m
			return m
		}
	}
	// target не найден, вернуть точку вставки i
	return i
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
func binarySearchInsertion(nums []int, target int) int {
	// Инициализировать двусторонне замкнутый интервал [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Вычислить индекс середины m
		m := i + (j-i)/2
		if nums[m] < target {
			// target находится в интервале [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// target находится в интервале [i, m-1]
			j = m - 1
		} else {
			// Первый элемент меньше target находится в интервале [i, m-1]
			j = m - 1
		}
	}
	// Вернуть точку вставки i
	return i
}
