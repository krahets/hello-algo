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
	// [region]{init_deque}
	/* Инициализация двусторонней очереди */
	// В Go list используется как двусторонняя очередь
	deque := list.New()
	// [endregion]{init_deque}

	// [region]{push}
	/* Добавление элемента в очередь */
	deque.PushBack(2) // Добавить в хвост
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3) // Добавить в голову
	deque.PushFront(1)
	// [endregion]{push}
	fmt.Print("Двусторонняя очередь deque = ")
	PrintList(deque)

	// [region]{peek_first}
	/* Доступ к элементу */
	front := deque.Front() // Элемент в голове
	// [endregion]{peek_first}
	fmt.Println("Первый элемент front =", front.Value)
	// [region]{peek_last}
	rear := deque.Back() // Элемент в хвосте
	// [endregion]{peek_last}
	fmt.Println("Последний элемент rear =", rear.Value)

	// [region]{pop_first}
	/* Извлечение элемента из очереди */
	deque.Remove(front) // Извлечь элемент из головы
	// [endregion]{pop_first}
	fmt.Print("Извлеченный из головы элемент front = ", front.Value, ", deque после извлечения из головы = ")
	PrintList(deque)
	// [region]{pop_last}
	deque.Remove(rear) // Извлечь элемент из хвоста
	// [endregion]{pop_last}
	fmt.Print("Извлеченный из хвоста элемент rear = ", rear.Value, ", deque после извлечения из хвоста = ")
	PrintList(deque)

	// [region]{size}
	/* Получение длины двусторонней очереди */
	size := deque.Len()
	// [endregion]{size}
	fmt.Println("Длина двусторонней очереди size =", size)

	// [region]{is_empty}
	/* Проверка, пуста ли двусторонняя очередь */
	isEmpty := deque.Len() == 0
	// [endregion]{is_empty}
	fmt.Println("Пуста ли двусторонняя очередь =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Инициализация двусторонней очереди */
	deque := newArrayDeque(16)

	/* Добавление элемента в очередь */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("Двусторонняя очередь deque = ")
	PrintSlice(deque.toSlice())

	/* Доступ к элементу */
	peekFirst := deque.peekFirst()
	fmt.Println("Первый элемент peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("Последний элемент peekLast =", peekLast)

	/* Добавление элемента в очередь */
	deque.pushLast(4)
	fmt.Print("После добавления элемента 4 в хвост deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("После добавления элемента 1 в голову deque = ")
	PrintSlice(deque.toSlice())

	/* Извлечение элемента из очереди */
	popFirst := deque.popFirst()
	fmt.Print("Извлеченный из головы элемент popFirst = ", popFirst, ", deque после извлечения из головы = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Извлеченный из хвоста элемент popLast = ", popLast, ", deque после извлечения из хвоста = ")
	PrintSlice(deque.toSlice())

	/* Получение длины двусторонней очереди */
	size := deque.size()
	fmt.Println("Длина двусторонней очереди size =", size)

	/* Проверка, пуста ли двусторонняя очередь */
	isEmpty := deque.isEmpty()
	fmt.Println("Пуста ли двусторонняя очередь =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Инициализация очереди
	deque := newLinkedListDeque()

	// Добавление элемента в очередь
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("Двусторонняя очередь deque = ")
	PrintList(deque.toList())

	// Доступ к элементу в начале очереди
	front := deque.peekFirst()
	fmt.Println("Первый элемент front =", front)
	rear := deque.peekLast()
	fmt.Println("Последний элемент rear =", rear)

	// Извлечение элемента из очереди
	popFirst := deque.popFirst()
	fmt.Print("Извлеченный из головы элемент popFirst = ", popFirst, ", deque после извлечения из головы = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Извлеченный из хвоста элемент popLast = ", popLast, ", deque после извлечения из хвоста = ")
	PrintList(deque.toList())

	// Получить длину очереди
	size := deque.size()
	fmt.Println("Длина очереди size =", size)

	// Проверка на пустоту
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
