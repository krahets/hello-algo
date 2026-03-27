// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Случайный доступ к элементу */
func randomAccess(nums []int) (randomNum int) {
	// Случайным образом выбрать число из интервала [0, nums.length)
	randomIndex := rand.Intn(len(nums))
	// Получить и вернуть случайный элемент
	randomNum = nums[randomIndex]
	return
}

/* Увеличить длину массива */
func extend(nums []int, enlarge int) []int {
	// Инициализировать массив увеличенной длины
	res := make([]int, len(nums)+enlarge)
	// Скопировать все элементы исходного массива в новый массив
	for i, num := range nums {
		res[i] = num
	}
	// Вернуть новый массив после расширения
	return res
}

/* Вставить элемент num по индексу index в массив */
func insert(nums []int, num int, index int) {
	// Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Присвоить num элементу по индексу index
	nums[index] = num
}

/* Удалить элемент по индексу index */
func remove(nums []int, index int) {
	// Сдвинуть все элементы после индекса index на одну позицию вперед
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* Обход массива */
func traverse(nums []int) {
	count := 0
	// Обход массива по индексам
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// Непосредственно обходить элементы массива
	for _, num := range nums {
		count += num
	}
	// Одновременно обходить индексы и элементы данных
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Найти заданный элемент в массиве */
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
