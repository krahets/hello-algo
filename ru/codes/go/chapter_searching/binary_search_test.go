// File: binary_search_test.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestBinarySearch(t *testing.T) {
	var (
		target   = 6
		nums     = []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
		expected = 2
	)
	// Выполняем двоичный поиск в массиве
	actual := binarySearch(nums, target)
	fmt.Println("Индекс элемента 6 =", actual)
	if actual != expected {
		t.Errorf("Индекс элемента 6 = %d, ожидается %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// Массив с повторяющимися элементами
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\nМассив nums = ", nums)

	// Двоичный поиск левой и правой границ
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("Индекс первого вхождения", target, "равен", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("Индекс последнего вхождения", target, "равен", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// Массив без повторяющихся элементов
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("Массив nums =", nums)

	// Двоичный поиск позиции вставки
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("Позиция вставки элемента", target, "равна", index)
	}

	// Массив с повторяющимися элементами
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\nМассив nums =", nums)

	// Двоичный поиск позиции вставки
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("Позиция вставки элемента", target, "равна", index)
	}
}
