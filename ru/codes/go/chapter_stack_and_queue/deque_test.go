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
	/* Инициализировать дек */
	// В Go в качестве дека используется список из пакета list
	deque := list.New()

	/* Добавить элементы в дек */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("Дек deque = ")
	PrintList(deque)

	/* Посмотреть первый и последний элементы */
	front := deque.Front()
	fmt.Println("Первый элемент дека front =", front.Value)
	rear := deque.Back()
	fmt.Println("Последний элемент дека rear =", rear.Value)

	/* Извлечь элементы из дека */
	deque.Remove(front)
	fmt.Print("Извлечённый первый элемент front = ", front.Value, ", после извлечения из начала deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("Извлечённый последний элемент rear = ", rear.Value, ", после извлечения из конца deque = ")
	PrintList(deque)

	/* Получить длину дека */
	size := deque.Len()
	fmt.Println("Длина дека size =", size)

	/* Проверить, пуст ли дек */
	isEmpty := deque.Len() == 0
	fmt.Println("Дек пуст =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Инициализировать дек */
	deque := newArrayDeque(16)

	/* Добавить элементы в дек */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("Дек deque = ")
	PrintSlice(deque.toSlice())

	/* Посмотреть первый и последний элементы */
	peekFirst := deque.peekFirst()
	fmt.Println("Первый элемент дека peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("Последний элемент дека peekLast =", peekLast)

	/* Добавить элементы в дек */
	deque.pushLast(4)
	fmt.Print("После добавления 4 в конец дека deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("После добавления 1 в начало дека deque = ")
	PrintSlice(deque.toSlice())

	/* Извлечь элементы из дека */
	popFirst := deque.popFirst()
	fmt.Print("Извлечённый первый элемент popFirst = ", popFirst, ", после извлечения из начала deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Извлечённый последний элемент popLast = ", popLast, ", после извлечения из конца deque = ")
	PrintSlice(deque.toSlice())

	/* Получить длину дека */
	size := deque.size()
	fmt.Println("Длина дека size =", size)

	/* Проверить, пуст ли дек */
	isEmpty := deque.isEmpty()
	fmt.Println("Дек пуст =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Инициализировать дек
	deque := newLinkedListDeque()

	// Добавить элементы в дек
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("Дек deque = ")
	PrintList(deque.toList())

	// Посмотреть первый элемент дека
	front := deque.peekFirst()
	fmt.Println("Первый элемент дека front =", front)
	rear := deque.peekLast()
	fmt.Println("Последний элемент дека rear =", rear)

	// Извлечь элементы из дека
	popFirst := deque.popFirst()
	fmt.Print("Извлечённый первый элемент popFirst = ", popFirst, ", после извлечения из начала deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Извлечённый последний элемент popLast = ", popLast, ", после извлечения из конца deque = ")
	PrintList(deque.toList())

	// Получить длину дека
	size := deque.size()
	fmt.Println("Длина дека size =", size)

	// Проверить, пуст ли дек
	isEmpty := deque.isEmpty()
	fmt.Println("Дек пуст =", isEmpty)
}

// Результат BenchmarkLinkedListDeque на Mac с M1 Pro — 67.92 ns/op
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// Число итераций цикла задаёт b.N
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
