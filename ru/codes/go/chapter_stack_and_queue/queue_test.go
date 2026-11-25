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
	/* Инициализировать очередь */
	// В Go в качестве очереди используется список из пакета list
	queue := list.New()

	/* Добавить элементы в очередь */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("Очередь queue = ")
	PrintList(queue)

	/* Посмотреть первый элемент очереди */
	peek := queue.Front()
	fmt.Println("Первый элемент очереди peek =", peek.Value)

	/* Извлечь элемент из очереди */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("Извлечённый элемент pop = ", pop.Value, ", после извлечения queue = ")
	PrintList(queue)

	/* Получить длину очереди */
	size := queue.Len()
	fmt.Println("Длина очереди size =", size)

	/* Проверить, пуста ли очередь */
	isEmpty := queue.Len() == 0
	fmt.Println("Очередь пуста =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// Инициализировать очередь и использовать общие для очередей операции
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// Добавить элементы в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Очередь queue = ")
	PrintSlice(queue.toSlice())

	// Посмотреть первый элемент очереди
	peek := queue.peek()
	fmt.Println("Первый элемент очереди peek =", peek)

	// Извлечь элемент из очереди
	pop := queue.pop()
	fmt.Print("Извлечённый элемент pop = ", pop, ", после извлечения queue = ")
	PrintSlice(queue.toSlice())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверить, пуста ли очередь
	isEmpty := queue.isEmpty()
	fmt.Println("Очередь пуста =", isEmpty)

	/* Проверить работу кольцевого массива */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("В цикле ", i, " после добавления и извлечения элемента queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// Инициализировать очередь
	queue := newLinkedListQueue()

	// Добавить элементы в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Очередь queue = ")
	PrintList(queue.toList())

	// Посмотреть первый элемент очереди
	peek := queue.peek()
	fmt.Println("Первый элемент очереди peek =", peek)

	// Извлечь элемент из очереди
	pop := queue.pop()
	fmt.Print("Извлечённый элемент pop = ", pop, ", после извлечения queue = ")
	PrintList(queue.toList())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверить, пуста ли очередь
	isEmpty := queue.isEmpty()
	fmt.Println("Очередь пуста =", isEmpty)
}

// Результат BenchmarkArrayQueue на Mac с M1 Pro — 8 ns/op
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// Число итераций цикла задаёт b.N
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// Результат BenchmarkLinkedQueue на Mac с M1 Pro — 62.66 ns/op
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// Число итераций цикла задаёт b.N
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
