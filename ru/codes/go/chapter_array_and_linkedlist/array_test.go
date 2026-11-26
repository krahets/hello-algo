// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
Здесь и далее мы рассматриваем срез (slice) в Go как массив. Это упрощает
изложение и позволяет сосредоточиться на структурах данных и алгоритмах.
*/

import (
	"fmt"
	"testing"
)

/* Демонстрационный код */
func TestArray(t *testing.T) {
	/* Инициализация массива */
	var arr [5]int
	fmt.Println("Массив arr =", arr)
	// В Go тип с указанной длиной ([5]int) — массив, а без длины ([]int) — срез
	// Длина массива в Go определяется при компиляции, поэтому задать её можно только константой
	// Для удобства реализации функции расширения extend() далее рассматриваем срез (slice) как массив (array)
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("Массив nums =", nums)

	/* Чтение случайного элемента */
	randomNum := randomAccess(nums)
	fmt.Println("Случайный элемент nums:", randomNum)

	/* Увеличение длины */
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
	fmt.Println("Индекс элемента 3 в nums =", index)
}
