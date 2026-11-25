// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* Сортировка пузырьком */
func bubbleSort(nums []int) {
	// Внешний цикл: неотсортированный участок [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Поменять местами nums[j] и nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* Сортировка пузырьком с флагом обмена*/
func bubbleSortWithFlag(nums []int) {
	// Внешний цикл: неотсортированный участок [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // Инициализировать флаг
		// Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Поменять местами nums[j] и nums[j + 1]
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // Отметить, что произошёл обмен
			}
		}
		if flag == false { // За этот проход обменов не было. Выйти из цикла
			break
		}
	}
}
