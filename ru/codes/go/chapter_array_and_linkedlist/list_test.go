// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Демонстрационный код */
func TestList(t *testing.T) {
	/* Инициализация списка */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Список nums =", nums)

	/* Доступ к элементу */
	num := nums[1] // Прочитать элемент по индексу 1
	fmt.Println("Элемент по индексу 1: num =", num)

	/* Изменение элемента */
	nums[1] = 0 // Записать 0 по индексу 1
	fmt.Println("После записи 0 по индексу 1 nums =", nums)

	/* Очистка списка */
	nums = nil
	fmt.Println("После очистки списка nums =", nums)

	/* Добавление элемента в конец */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("После добавления элементов nums =", nums)

	/* Вставка элемента в середину */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Вставить число 6 по индексу 3
	fmt.Println("После вставки числа 6 по индексу 3 nums =", nums)

	/* Удаление элемента */
	nums = append(nums[:3], nums[4:]...) // Удалить элемент по индексу 3
	fmt.Println("После удаления элемента по индексу 3 nums =", nums)

	/* Обойти список по индексам */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* Перебрать элементы списка напрямую */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* Объединение двух списков */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Добавить список nums1 в конец nums
	fmt.Println("После добавления nums1 в конец nums получаем nums =", nums)

	/* Сортировка списка */
	sort.Ints(nums) // После сортировки элементы списка расположены по возрастанию
	fmt.Println("После сортировки nums =", nums)
}
