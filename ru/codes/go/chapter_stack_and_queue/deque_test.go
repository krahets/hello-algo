// File: deque_test.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestDeque(t *testing.T) {
	/* Инициализировать двустороннюю очередь */
	// В Go list используется как двусторонняя очередь
	deque := list.New()

	/* Поместить элемент в очередь */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("двусторонняя очередь deque =")
	PrintList(deque)

	/* Получить доступ к элементу */
	front := deque.Front()
	fmt.Println("элемент в голове очереди front =", front.Value)
	rear := deque.Back()
	fmt.Println("элемент в хвосте очереди rear =", rear.Value)

	/* Извлечь элемент из очереди */
	deque.Remove(front)
	fmt.Print("Элемент, извлеченный из головы очереди, front =", front.Value, ", deque после извлечения из головы =")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("Элемент, извлеченный из хвоста очереди, rear =", rear.Value, ", deque после извлечения из хвоста =")
	PrintList(deque)

	/* Получить длину двусторонней очереди */
	size := deque.Len()
	fmt.Println("Длина двусторонней очереди size =", size)

	/* Проверить, пуста ли двусторонняя очередь */
	isEmpty := deque.Len() == 0
	fmt.Println("двусторонняя Очередь пуста:", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Инициализировать двустороннюю очередь */
	// В Go list используется как двусторонняя очередь
	deque := newArrayDeque(16)

	/* Поместить элемент в очередь */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("двусторонняя очередь deque =")
	PrintSlice(deque.toSlice())

	/* Получить доступ к элементу */
	peekFirst := deque.peekFirst()
	fmt.Println("элемент в голове очереди peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("элемент в хвосте очереди peekLast =", peekLast)

	/* Поместить элемент в очередь */
	deque.pushLast(4)
	fmt.Print("После помещения элемента 4 в хвост очереди deque =")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("После помещения элемента 1 в голову очереди deque =")
	PrintSlice(deque.toSlice())

	/* Извлечь элемент из очереди */
	popFirst := deque.popFirst()
	fmt.Print("Элемент, извлеченный из головы очереди, popFirst =", popFirst, ", deque после извлечения из головы =")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Элемент, извлеченный из хвоста очереди, popLast =", popLast, ", deque после извлечения из хвоста =")
	PrintSlice(deque.toSlice())

	/* Получить длину двусторонней очереди */
	size := deque.size()
	fmt.Println("Длина двусторонней очереди size =", size)

	/* Проверить, пуста ли двусторонняя очередь */
	isEmpty := deque.isEmpty()
	fmt.Println("двусторонняя Очередь пуста:", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Инициализировать очередь
	deque := newLinkedListDeque()

	// Поместить элемент в очередь
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("очередь deque =")
	PrintList(deque.toList())

	// Получить элемент в начале очереди
	front := deque.peekFirst()
	fmt.Println("элемент в голове очереди front =", front)
	rear := deque.peekLast()
	fmt.Println("элемент в хвосте очереди rear =", rear)

	// Извлечь элемент из очереди
	popFirst := deque.popFirst()
	fmt.Print("Элемент, извлеченный из головы очереди, popFirst =", popFirst, ", deque после извлечения из головы =")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Элемент, извлеченный из хвоста очереди, popLast =", popLast, ", deque после извлечения из хвоста =")
	PrintList(deque.toList())

	// Получить длину очереди
	size := deque.size()
	fmt.Println("Длина очереди size =", size)

	// Проверить, пуста ли структура
	isEmpty := deque.isEmpty()
	fmt.Println("Пуста ли очередь =", isEmpty)
}

// BenchmarkLinkedListDeque 67.92 ns/op in Mac M1 Pro
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
