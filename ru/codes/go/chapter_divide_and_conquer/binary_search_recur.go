// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* Двоичный поиск: задача f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// Если интервал пуст, искомого элемента нет. Возвращаем -1
	if i > j {
		return -1
	}
	//	Вычисляем индекс середины
	m := i + ((j - i) >> 1)
	//Сравниваем средний элемент с искомым
	if nums[m] < target {
		// Если он меньше, продолжаем поиск в правой половине
		// Рекурсивно решаем подзадачу f(m+1, j)
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// Если он больше, продолжаем поиск в левой половине
		// Рекурсивно решаем подзадачу f(i, m-1)
		return dfs(nums, target, i, m-1)
	} else {
		// Искомый элемент найден. Возвращаем его индекс
		return m
	}
}

/* Двоичный поиск */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
