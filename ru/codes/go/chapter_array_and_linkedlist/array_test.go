// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
 * Здесь мы рассматриваем Slice в Go как массив Array.
 * Так проще понимать материал и сосредоточиться на структурах данных и алгоритмах.
 */

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* Инициализировать массив */
	var arr [5]int
	fmt.Println("массив arr =", arr)
	// В Go при указании длины ([5]int) это массив, а без указания длины ([]int) это срез
	// Поскольку массивы в Go спроектированы с длиной, определяемой на этапе компиляции, длину можно задавать только константой
	// Чтобы упростить реализацию функции расширения extend(), ниже Slice рассматривается как Array
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("массив nums =", nums)

	/* Случайный доступ */
	randomNum := randomAccess(nums)
	fmt.Println("Полученный случайный элемент из nums", randomNum)

	/* Расширение длины */
	nums = extend(nums, 3)
	fmt.Println("После расширения длины массива до 8 получаем nums =", nums)

	/* Вставить элемент */
	insert(nums, 6, 3)
	fmt.Println("После вставки числа 6 по индексу 3 получаем nums =", nums)

	/* Удалить элемент */
	remove(nums, 2)
	fmt.Println("После удаления элемента по индексу 2 получаем nums =", nums)

	/* Перебрать массив */
	traverse(nums)

	/* Найти элемент */
	index := find(nums, 3)
	fmt.Println("Поиск элемента 3 в nums дает индекс =", index)
}
