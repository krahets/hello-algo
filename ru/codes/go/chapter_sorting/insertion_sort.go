// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Сортировка вставками */
func insertionSort(nums []int) {
	// Внешний цикл: отсортированный диапазон [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // Сдвинуть nums[j] на одну позицию вправо
			j--
		}
		nums[j+1] = base // Поместить base в правильную позицию
	}
}
