// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Сортировка выбором */
func selectionSort(nums []int) {
	n := len(nums)
	// Внешний цикл: неотсортированный диапазон [i, n-1]
	for i := 0; i < n-1; i++ {
		// Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// Записать индекс минимального элемента
				k = j
			}
		}
		// Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
		nums[i], nums[k] = nums[k], nums[i]

	}
}
