// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
 * Мы рассматриваем срез Slice в Go как массив Array. Это позволяет
 * снизить порог понимания и сосредоточиться на структурах данных и алгоритмах.
 */

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* Инициализация массива */
	var arr [5]int
	fmt.Println("Массив arr =", arr)
	// В Go при указании длины ([5]int) получается массив, а без указания длины ([]int) — срез
	// Так как массивы в Go имеют длину, определяемую на этапе компиляции, для задания длины можно использовать только константы
	// Для удобства реализации функции расширения extend() ниже срез (Slice) рассматривается как массив (Array)
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Массив nums =", nums)

	/* Случайный доступ */
	randomNum := randomAccess(nums)
	fmt.Println("Случайный элемент из nums =", randomNum)

	/* Расширение длины */
	nums = extend(nums, 3)
	fmt.Println("После увеличения длины массива до 8 nums =", nums)

	/* Вставка элемента */
	insert(nums, 6, 3)
	fmt.Println("После вставки числа 6 по индексу 3 nums =", nums)

	/* Удаление элемента */
	remove(nums, 2)
	fmt.Println("После удаления элемента по индексу 2 nums =", nums)

	/* Обход массива */
	traverse(nums)

	/* Поиск элемента */
	index := find(nums, 3)
	fmt.Println("Поиск элемента 3 в nums: индекс =", index)
}
