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
	// Выполнить бинарный поиск в массиве
	actual := binarySearch(nums, target)
	fmt.Println("Индекс целевого элемента 6 =", actual)
	if actual != expected {
		t.Errorf("Индекс целевого элемента 6 = %d, должно быть %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// Массив с повторяющимися элементами
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\nМассив nums =", nums)

	// Бинарный поиск левой и правой границы
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("Индекс самого левого элемента", target, "равен", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("Индекс самого правого элемента", target, "равен", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// Массив без повторяющихся элементов
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("Массив nums =", nums)

	// Бинарный поиск точки вставки
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("Индекс позиции вставки элемента", target, "равен", index)
	}

	// Массив с повторяющимися элементами
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\nМассив nums =", nums)

	// Бинарный поиск точки вставки
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("Индекс позиции вставки элемента", target, "равен", index)
	}
}
