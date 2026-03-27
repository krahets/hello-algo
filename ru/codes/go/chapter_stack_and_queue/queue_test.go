// File: queue_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestQueue(t *testing.T) {
	/* Инициализация очереди */
	// В Go list используется как очередь
	queue := list.New()

	/* Добавление элемента в очередь */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("Очередь queue = ")
	PrintList(queue)

	/* Доступ к элементу в начале очереди */
	peek := queue.Front()
	fmt.Println("Первый элемент peek =", peek.Value)

	/* Извлечение элемента из очереди */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("Извлеченный элемент pop = ", pop.Value, ", queue после извлечения = ")
	PrintList(queue)

	/* Получение длины очереди */
	size := queue.Len()
	fmt.Println("Длина очереди size =", size)

	/* Проверка, пуста ли очередь */
	isEmpty := queue.Len() == 0
	fmt.Println("Пуста ли очередь =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// Инициализировать очередь, используя общий интерфейс очереди
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// Добавление элемента в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Очередь queue = ")
	PrintSlice(queue.toSlice())

	// Доступ к элементу в начале очереди
	peek := queue.peek()
	fmt.Println("Первый элемент peek =", peek)

	// Извлечение элемента из очереди
	pop := queue.pop()
	fmt.Print("Извлеченный элемент pop = ", pop, ", queue после извлечения = ")
	PrintSlice(queue.toSlice())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверка на пустоту
	isEmpty := queue.isEmpty()
	fmt.Println("Пуста ли очередь =", isEmpty)

	/* Проверка кольцевого массива */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("После ", i, "-го раунда операций enqueue и dequeue queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// Инициализировать очередь
	queue := newLinkedListQueue()

	// Добавление элемента в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Очередь queue = ")
	PrintList(queue.toList())

	// Доступ к элементу в начале очереди
	peek := queue.peek()
	fmt.Println("Первый элемент peek =", peek)

	// Извлечение элемента из очереди
	pop := queue.pop()
	fmt.Print("Извлеченный элемент pop = ", pop, ", queue после извлечения = ")
	PrintList(queue.toList())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверка на пустоту
	isEmpty := queue.isEmpty()
	fmt.Println("Пуста ли очередь =", isEmpty)
}

// BenchmarkArrayQueue 8 ns/op in Mac M1 Pro
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// BenchmarkLinkedQueue 62.66 ns/op in Mac M1 Pro
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
