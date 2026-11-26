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

func testPush(h *intHeap, val int) {
	// Вызвать метод heap.Interface для добавления элемента
	heap.Push(h, val)
	fmt.Printf("\nПосле вставки элемента %d:\n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Вызвать метод heap.Interface для удаления элемента
	val := heap.Pop(h)
	fmt.Printf("\nПосле извлечения элемента %d из корня:\n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Инициализировать кучу */
	// Инициализировать макс-кучу
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Вставить элемент в кучу */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Получить элемент в корне */
	top := maxHeap.Top()
	fmt.Printf("Элемент в корне: %d\n", top)

	/* Извлечь элемент из корня */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Размер кучи */
	size := len(*maxHeap)
	fmt.Printf("Число элементов в куче: %d\n", size)

	/* Проверить, пуста ли куча */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Пуста ли куча: %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Инициализировать кучу */
	// Инициализировать макс-кучу
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("Куча, построенная по входному массиву:\n")
	maxHeap.print()

	/* Получить элемент в корне */
	peek := maxHeap.peek()
	fmt.Printf("\nЭлемент в корне: %d\n", peek)

	/* Вставить элемент в кучу */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nПосле вставки элемента %d:\n", val)
	maxHeap.print()

	/* Извлечь элемент из корня */
	peek = maxHeap.pop()
	fmt.Printf("\nПосле извлечения элемента %d из корня:\n", peek)
	maxHeap.print()

	/* Размер кучи */
	size := maxHeap.size()
	fmt.Printf("\nЧисло элементов в куче: %d\n", size)

	/* Проверить, пуста ли куча */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nПуста ли куча: %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("При k = " + strconv.Itoa(k) + " наибольшие элементы:")
	PrintHeap(*res)
}
