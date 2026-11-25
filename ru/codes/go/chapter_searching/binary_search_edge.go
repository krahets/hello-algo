// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Двоичный поиск первого вхождения target */
func binarySearchLeftEdge(nums []int, target int) int {
	// Задача равносильна поиску позиции вставки target
	i := binarySearchInsertion(nums, target)
	// Значение target не найдено, возвращаем -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// Значение target найдено, возвращаем индекс i
	return i
}

/* Двоичный поиск последнего вхождения target */
func binarySearchRightEdge(nums []int, target int) int {
	// Сводим задачу к поиску первого вхождения target + 1
	i := binarySearchInsertion(nums, target+1)
	// j указывает на последнее вхождение target, а i — на первый элемент, больший target
	j := i - 1
	// Значение target не найдено, возвращаем -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// Значение target найдено, возвращаем индекс j
	return j
}
