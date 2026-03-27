// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* Бинарный поиск самого левого target */
func binarySearchLeftEdge(nums []int, target int) int {
	// Эквивалентно поиску точки вставки target
	i := binarySearchInsertion(nums, target)
	// target не найден, вернуть -1
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// Найти target и вернуть индекс i
	return i
}

/* Бинарный поиск самого правого target */
func binarySearchRightEdge(nums []int, target int) int {
	// Преобразовать задачу в поиск самого левого target + 1
	i := binarySearchInsertion(nums, target+1)
	// j указывает на самый правый target, а i — на первый элемент больше target
	j := i - 1
	// target не найден, вернуть -1
	if j == -1 || nums[j] != target {
		return -1
	}
	// Найти target и вернуть индекс j
	return j
}
