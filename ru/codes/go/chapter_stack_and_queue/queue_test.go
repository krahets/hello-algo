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
	// В Go list используется как очередь
	queue := list.New()

	/* Поместить элемент в очередь */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("очередь queue =")
	PrintList(queue)

	/* Получить элемент в начале очереди */
	peek := queue.Front()
	fmt.Println("элемент в голове очереди peek =", peek.Value)

	/* Извлечь элемент из очереди */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("Элемент, извлеченный из очереди, pop =", pop.Value, ", queue после извлечения =")
	PrintList(queue)

	/* Получить длину очереди */
	size := queue.Len()
	fmt.Println("Длина очереди size =", size)

	/* Проверить, пуста ли очередь */
	isEmpty := queue.Len() == 0
	fmt.Println("очередьпуст ли =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// Инициализировать очередь, используя общий интерфейс очереди
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// Поместить элемент в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("очередь queue =")
	PrintSlice(queue.toSlice())

	// Получить элемент в начале очереди
	peek := queue.peek()
	fmt.Println("элемент в голове очереди peek =", peek)

	// Извлечь элемент из очереди
	pop := queue.pop()
	fmt.Print("Элемент, извлеченный из очереди, pop =", pop, ", queue после извлечения =")
	PrintSlice(queue.toSlice())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверить, пуста ли структура
	isEmpty := queue.isEmpty()
	fmt.Println("Пуста ли очередь =", isEmpty)

	/* Проверить кольцевой массив */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("После", i, "-й итерации enqueue + dequeue queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// Инициализировать очередь
	queue := newLinkedListQueue()

	// Поместить элемент в очередь
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("очередь queue =")
	PrintList(queue.toList())

	// Получить элемент в начале очереди
	peek := queue.peek()
	fmt.Println("элемент в голове очереди peek =", peek)

	// Извлечь элемент из очереди
	pop := queue.pop()
	fmt.Print("Элемент, извлеченный из очереди, pop =", pop, ", queue после извлечения =")
	PrintList(queue.toList())

	// Получить длину очереди
	size := queue.size()
	fmt.Println("Длина очереди size =", size)

	// Проверить, пуста ли структура
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
