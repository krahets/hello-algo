// File: worst_best_time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"math/rand"
)

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
func randomNumbers(n int) []int {
	nums := make([]int, n)
	// Создать массив nums = { 1, 2, 3, ..., n }
	for i := 0; i < n; i++ {
		nums[i] = i + 1
	}
	// Случайно перемешать элементы массива
	rand.Shuffle(len(nums), func(i, j int) {
		nums[i], nums[j] = nums[j], nums[i]
	})
	return nums
}

/* Найти индекс числа 1 в массиве nums */
func findOne(nums []int) int {
	for i := 0; i < len(nums); i++ {
		// Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
		// Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
		if nums[i] == 1 {
			return i
		}
	}
	return -1
}
