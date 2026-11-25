// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Двоичный поиск позиции вставки без повторов */
func binarySearchInsertionSimple(nums []int, target int) int {
	// Задаём замкнутый интервал [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Вычисляем индекс середины m
		m := i + (j-i)/2
		if nums[m] < target {
			// Ищем target в интервале [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Ищем target в интервале [i, m-1]
			j = m - 1
		} else {
			// Значение target найдено, возвращаем позицию вставки m
			return m
		}
	}
	// Значение target не найдено, возвращаем позицию вставки i
	return i
}

/* Двоичный поиск позиции вставки при наличии повторов */
func binarySearchInsertion(nums []int, target int) int {
	// Задаём замкнутый интервал [0, n-1]
	i, j := 0, len(nums)-1
	for i <= j {
		// Вычисляем индекс середины m
		m := i + (j-i)/2
		if nums[m] < target {
			// Ищем target в интервале [m+1, j]
			i = m + 1
		} else if nums[m] > target {
			// Ищем target в интервале [i, m-1]
			j = m - 1
		} else {
			// В интервале [i, m-1] ищем последний элемент, меньший target
			j = m - 1
		}
	}
	// Возвращаем позицию вставки i
	return i
}
