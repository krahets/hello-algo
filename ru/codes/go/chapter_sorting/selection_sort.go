// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Сортировка выбором */
func selectionSort(nums []int) {
	n := len(nums)
	// Внешний цикл: неотсортированный участок [i, n-1]
	for i := 0; i < n-1; i++ {
		// Внутренний цикл: найти минимум неотсортированного участка
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// Запомнить индекс минимума
				k = j
			}
		}
		// Поменять минимум местами с первым элементом неотсортированного участка
		nums[i], nums[k] = nums[k], nums[i]

	}
}
