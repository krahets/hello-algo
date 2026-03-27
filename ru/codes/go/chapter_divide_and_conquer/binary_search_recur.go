// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Бинарный поиск: задача f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// Если интервал пуст, это означает отсутствие целевого элемента, вернуть -1
	if i > j {
		return -1
	}
	// Вычислить средний индекс
	m := i + ((j - i) >> 1)
	// Сравнить середину и целевой элемент
	if nums[m] < target {
		// Если меньше, рекурсивно обрабатывать правую половину массива
		// Рекурсивная подзадача f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// Если больше, рекурсивно обработать левую половину массива
		// Рекурсивная подзадача f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// Целевой элемент найден, вернуть его индекс
		return m
	}
}

/* Бинарный поиск */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
