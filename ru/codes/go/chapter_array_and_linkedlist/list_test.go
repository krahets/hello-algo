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
	/* Инициализация списка */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Список nums =", nums)

	// [region]{access_element}
	/* Доступ к элементу */
	num := nums[1] // Обратиться к элементу по индексу 1
	// [endregion]{access_element}
	fmt.Println("Элемент по индексу 1: num =", num)

	// [region]{update_element}
	/* Изменение элемента */
	nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
	// [endregion]{update_element}
	fmt.Println("После изменения значения элемента с индексом 1 на 0 nums =", nums)

	// [region]{clear_list}
	/* Очистить список */
	nums = nil
	// [endregion]{clear_list}
	fmt.Println("После очистки списка nums =", nums)

	// [region]{append_element}
	/* Добавление элемента в конец */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	// [endregion]{append_element}
	fmt.Println("После добавления элементов nums =", nums)

	// [region]{insert_element}
	/* Вставка элемента в середину */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // Вставить число 6 по индексу 3
	// [endregion]{insert_element}
	fmt.Println("После вставки числа 6 по индексу 3 nums =", nums)

	// [region]{remove_element}
	/* Удаление элемента */
	nums = append(nums[:3], nums[4:]...) // Удалить элемент по индексу 3
	// [endregion]{remove_element}
	fmt.Println("После удаления элемента по индексу 3 nums =", nums)

	// [region]{iterate_list}
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
	// [endregion]{iterate_list}

	// [region]{concat_list}
	/* Объединить два списка */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // Присоединить список nums1 после nums
	// [endregion]{concat_list}
	fmt.Println("После конкатенации списка nums1 к nums nums =", nums)

	// [region]{sort_list}
	/* Отсортировать список */
	sort.Ints(nums) // После сортировки элементы списка располагаются по возрастанию
	// [endregion]{sort_list}
	fmt.Println("После сортировки списка nums =", nums)
}
