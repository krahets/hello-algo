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
	/* Initialize the queue */
	// In Go, use list as a queue
	queue := list.New()

	/* Enqueue elements */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("Queue queue = ")
	PrintList(queue)

	/* Access the front element */
	peek := queue.Front()
	fmt.Println("Front element peek =", peek.Value)

	/* Dequeue an element */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("Dequeued element pop = ", pop.Value, ", after dequeuing, queue = ")
	PrintList(queue)

	/* Get the queue size */
	size := queue.Len()
	fmt.Println("Queue size =", size)

	/* Check whether the queue is empty */
	isEmpty := queue.Len() == 0
	fmt.Println("Is the queue empty =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// Initialize the queue and use its standard queue operations
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// Enqueue elements
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Queue queue = ")
	PrintSlice(queue.toSlice())

	// Access the front element
	peek := queue.peek()
	fmt.Println("Front element peek =", peek)

	// Dequeue an element
	pop := queue.pop()
	fmt.Print("Dequeued element pop = ", pop, ", after dequeuing, queue = ")
	PrintSlice(queue.toSlice())

	// Get the queue size
	size := queue.size()
	fmt.Println("Queue size =", size)

	// Check whether it is empty
	isEmpty := queue.isEmpty()
	fmt.Println("Is the queue empty =", isEmpty)

	/* Test the circular array */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("Round #", i, ": after enqueue + dequeue, queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// Initialize the queue
	queue := newLinkedListQueue()

	// Enqueue elements
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("Queue queue = ")
	PrintList(queue.toList())

	// Access the front element
	peek := queue.peek()
	fmt.Println("Front element peek =", peek)

	// Dequeue an element
	pop := queue.pop()
	fmt.Print("Dequeued element pop = ", pop, ", after dequeuing, queue = ")
	PrintList(queue.toList())

	// Get the queue size
	size := queue.size()
	fmt.Println("Queue size =", size)

	// Check whether it is empty
	isEmpty := queue.isEmpty()
	fmt.Println("Is the queue empty =", isEmpty)
}

// BenchmarkArrayQueue: 8 ns/op on a Mac M1 Pro
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// Use b.N as the iteration count
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// BenchmarkLinkedQueue: 62.66 ns/op on a Mac M1 Pro
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// Use b.N as the iteration count
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
