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
	// Вызвать функцию heap.Interface для добавления элемента
	heap.Push(h, val)
	fmt.Printf("\nЭлемент %d после добавления в кучу \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Вызвать функцию heap.Interface для удаления элемента
	val := heap.Pop(h)
	fmt.Printf("\nвершина кучиЭлемент %d после извлечения из кучи \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Инициализироватькуча */
	// Инициализировать max-кучу
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Добавить элемент в кучу */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Получить верхний элемент кучи */
	top := maxHeap.Top()
	fmt.Printf("вершина кучиэлементравно %d\n", top)

	/* Извлечь верхний элемент из кучи */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Получить размер кучи */
	size := len(*maxHeap)
	fmt.Printf("Количество элементов в куче равно %d\n", size)

	/* Проверить, пуста ли куча */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("кучапуст ли %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Инициализироватькуча */
	// Инициализировать max-кучу
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("После построения кучи по входному массиву\n")
	maxHeap.print()

	/* Получить верхний элемент кучи */
	peek := maxHeap.peek()
	fmt.Printf("\nЭлемент на вершине кучи равен %d\n", peek)

	/* Добавить элемент в кучу */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nЭлемент %d после добавления в кучу\n", val)
	maxHeap.print()

	/* Извлечь верхний элемент из кучи */
	peek = maxHeap.pop()
	fmt.Printf("\nПосле извлечения верхнего элемента %d из кучи\n", peek)
	maxHeap.print()

	/* Получить размер кучи */
	size := maxHeap.size()
	fmt.Printf("\nКоличество элементов в куче равно %d\n", size)

	/* Проверить, пуста ли куча */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nкучапуст ли %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Инициализироватькуча */
	// Инициализировать max-кучу
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("Наибольшие " + strconv.Itoa(k) + " элементов:")
	PrintHeap(*res)
}
