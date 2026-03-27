// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver Code */
func TestList(t *testing.T) {
	/* Инициализировать список */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Список nums =", nums)

	/* Получить доступ к элементу */
	num := nums[1] // обратиться киндекс 1 поэлемент
	fmt.Println("обратиться киндекс 1 поэлемент, получаем num =", num)

	/* Обновить элемент */
	nums[1] = 0 // Обновить элемент по индексу 1 до 0
	fmt.Println("После обновления элемента по индексу 1 на 0 получаем nums =", nums)

	/* Очистить список */
	nums = nil
	fmt.Println("После очистки списка nums =", nums)

	/* Добавить элемент в конец */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("Добавитьэлементпосле nums =", nums)

	/* Вставить элемент в середину */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Вставить число 6 по индексу 3
	fmt.Println("После вставки числа 6 по индексу 3 получаем nums =", nums)

	/* Удалить элемент */
	nums = append(nums[:3], nums[4:]...) // Удалитьиндекс 3 поэлемент
	fmt.Println("Удалитьиндекс 3 поэлемент, получаем nums =", nums)

	/* Обходить список по индексам */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* Непосредственно обходить элементы списка */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* Объединить два списка */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Присоединить список nums1 к nums
	fmt.Println("После присоединения списка nums1 к nums получаем nums =", nums)

	/* Отсортировать список */
	sort.Ints(nums) // Сортировкапосле, списокэлементрасположены по возрастанию
	fmt.Println("После сортировки списка nums =", nums)
}
