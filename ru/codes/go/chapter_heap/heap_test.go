// File: heap_test.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"container/heap"
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

// [region]{test_heap}
func TestHeap(t *testing.T) {
	/* Инициализация кучи */
	// Инициализация максимальной кучи
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Добавление элемента в кучу */
	// Вызвать функции heap.Interface для добавления элемента
	heap.Push(maxHeap, 1)
	heap.Push(maxHeap, 3)
	heap.Push(maxHeap, 2)
	heap.Push(maxHeap, 5)
	heap.Push(maxHeap, 4)
	PrintHeap(*maxHeap)

	/* Получение элемента с вершины кучи */
	top := maxHeap.Top()
	fmt.Printf("Элемент на вершине кучи = %d\n", top)

	/* Извлечение элемента с вершины кучи */
	// Вызвать функции heap.Interface для удаления элемента
	fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 5
	fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 4
	fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 3
	fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 2
	fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 1

	/* Получение размера кучи */
	size := len(*maxHeap)
	fmt.Printf("Количество элементов в куче = %d\n", size)

	/* Проверка, пуста ли куча */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Пуста ли куча: %t\n", isEmpty)
}

// [endregion]{test_heap}

func TestMyHeap(t *testing.T) {
	/* Инициализация кучи */
	// Инициализация максимальной кучи
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("После построения кучи из входного массива\n")
	maxHeap.print()

	/* Получение элемента с вершины кучи */
	peek := maxHeap.peek()
	fmt.Printf("\nЭлемент на вершине кучи = %d\n", peek)

	/* Добавление элемента в кучу */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nПосле добавления элемента %d в кучу\n", val)
	maxHeap.print()

	/* Извлечение элемента с вершины кучи */
	peek = maxHeap.pop()
	fmt.Printf("\nПосле извлечения элемента вершины кучи %d\n", peek)
	maxHeap.print()

	/* Получение размера кучи */
	size := maxHeap.size()
	fmt.Printf("\nКоличество элементов в куче = %d\n", size)

	/* Проверка, пуста ли куча */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nПуста ли куча: %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Инициализация кучи */
	// Инициализация максимальной кучи
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("Наибольшие " + strconv.Itoa(k) + " элементов")
	PrintHeap(*res)
}
