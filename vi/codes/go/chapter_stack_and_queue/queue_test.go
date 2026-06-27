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
	/* Access front of the queue element */
	// In Go, use list as queue
	queue := list.New()

	/* Elements enqueue */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("Queue queue = ")
	PrintList(queue)

	/* Return list for printing */
	peek := queue.Front()
	fmt.Println("Front element peek =", peek.Value)

	/* Element dequeue */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("Dequeue element pop = ", pop.Value, ", after dequeue, queue = ")
	PrintList(queue)

	/* Get the length of the queue */
	size := queue.Len()
	fmt.Println("Queue length size =", size)

	/* Check if the queue is empty */
	isEmpty := queue.Len() == 0
	fmt.Println("Is queue empty =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// Initialize queue using queue's common interface
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// Elements enqueue
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Queue queue = ")
	PrintSlice(queue.toSlice())

	// Return list for printing
	peek := queue.peek()
	fmt.Println("Front element peek =", peek)

	// Element dequeue
	pop := queue.pop()
	fmt.Print("Dequeue element pop = ", pop, ", after dequeue, queue = ")
	PrintSlice(queue.toSlice())

	// Get queue length
	size := queue.size()
	fmt.Println("Queue length size =", size)

	// Check if empty
	isEmpty := queue.isEmpty()
	fmt.Println("Is queue empty =", isEmpty)

	/* Test circular array */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("Round ", i, " enqueue + dequeue, queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// Initialize queue
	queue := newLinkedListQueue()

	// Elements enqueue
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Queue queue = ")
	PrintList(queue.toList())

	// Return list for printing
	peek := queue.peek()
	fmt.Println("Front element peek =", peek)

	// Element dequeue
	pop := queue.pop()
	fmt.Print("Dequeue element pop = ", pop, ", after dequeue, queue = ")
	PrintList(queue.toList())

	// Get queue length
	size := queue.size()
	fmt.Println("Queue length size =", size)

	// Check if empty
	isEmpty := queue.isEmpty()
	fmt.Println("Is queue empty =", isEmpty)
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
