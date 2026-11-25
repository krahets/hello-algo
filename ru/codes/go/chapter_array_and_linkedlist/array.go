// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Чтение случайного элемента */
func randomAccess(nums []int) (randomNum int) {
	// Выбрать случайное число из интервала [0, nums.length)
	randomIndex := rand.Intn(len(nums))
	// Получить и вернуть случайный элемент
	randomNum = nums[randomIndex]
	return
}

/* Увеличение длины массива */
func extend(nums []int, enlarge int) []int {
	// Создать массив увеличенной длины
	res := make([]int, len(nums)+enlarge)
	// Скопировать все элементы исходного массива в новый
	for i, num := range nums {
		res[i] = num
	}
	// Вернуть новый массив увеличенной длины
	return res
}

/* Вставить num в массив по индексу index */
func insert(nums []int, num int, index int) {
	// Сдвинуть на одну позицию вправо все элементы начиная с index
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Записать num по индексу index
	nums[index] = num
}

/* Удалить элемент по индексу index */
func remove(nums []int, index int) {
	// Сдвинуть все элементы после index на одну позицию влево
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* Обход массива */
func traverse(nums []int) {
	count := 0
	// Обойти массив по индексам
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// Перебрать элементы массива напрямую
	for _, num := range nums {
		count += num
	}
	// Одновременно перебирать индексы и элементы
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Поиск заданного элемента в массиве */
func find(nums []int, target int) (index int) {
	index = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			index = i
			break
		}
	}
	return
}
