// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* Двоичный поиск на замкнутом интервале */
func binarySearch(nums []int, target int) int {
	// Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
	i, j := 0, len(nums)-1
	// Повторяем, пока интервал поиска не опустеет (i > j)
	for i <= j {
		m := i + (j-i)/2      // Вычисляем индекс середины m
		if nums[m] < target { // Искать target следует в интервале [m+1, j]
			i = m + 1
		} else if nums[m] > target { // Искать target следует в интервале [i, m-1]
			j = m - 1
		} else { // Элемент найден, возвращаем его индекс
			return m
		}
	}
	// Элемент не найден, возвращаем -1
	return -1
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
func binarySearchLCRO(nums []int, target int) int {
	// Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
	i, j := 0, len(nums)
	// Повторяем, пока интервал поиска не опустеет (i = j)
	for i < j {
		m := i + (j-i)/2      // Вычисляем индекс середины m
		if nums[m] < target { // Искать target следует в интервале [m+1, j)
			i = m + 1
		} else if nums[m] > target { // Искать target следует в интервале [i, m)
			j = m
		} else { // Элемент найден, возвращаем его индекс
			return m
		}
	}
	// Элемент не найден, возвращаем -1
	return -1
}
