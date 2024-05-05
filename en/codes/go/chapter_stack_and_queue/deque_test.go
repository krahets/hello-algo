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
	/* Initialize double-ended queue */
	// In Go, use list as a double-ended queue
	deque := list.New()

	/* Element enqueue */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("Double-ended queue deque =")
	PrintList(deque)

	/* Access element */
	front := deque.Front()
	fmt.Println("Front element front =", front.Value)
	rear := deque.Back()
	fmt.Println("Rear element rear =", rear.Value)

	/* Element dequeue */
	deque.Remove(front)
	fmt.Print("Front dequeue element front = ", front.Value, ", after dequeue deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("Rear dequeue element rear = ", rear.Value, ", after dequeue deque = ")
	PrintList(deque)

	/* Get the length of the double-ended queue */
	size := deque.Len()
	fmt.Println("Double-ended queue length size =", size)

	/* Determine if the double-ended queue is empty */
	isEmpty := deque.Len() == 0
	fmt.Println("Is the double-ended queue empty =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Initialize double-ended queue */
	// In Go, use list as a double-ended queue
	deque := newArrayDeque(16)

	/* Element enqueue */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("Double-ended queue deque =")
	PrintSlice(deque.toSlice())

	/* Access element */
	peekFirst := deque.peekFirst()
	fmt.Println("Front element peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("Rear element peekLast =", peekLast)

	/* Element enqueue */
	deque.pushLast(4)
	fmt.Print("Element 4 enqueued at the tail, deque =")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("Element 1 enqueued at the head, deque =")
	PrintSlice(deque.toSlice())

	/* Element dequeue */
	popFirst := deque.popFirst()
	fmt.Print("Front dequeue element popFirst = ", popFirst, ", after dequeue deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Rear dequeue element popLast = ", popLast, ", after dequeue deque = ")
	PrintSlice(deque.toSlice())

	/* Get the length of the double-ended queue */
	size := deque.size()
	fmt.Println("Double-ended queue length size =", size)

	/* Determine if the double-ended queue is empty */
	isEmpty := deque.isEmpty()
	fmt.Println("Is the double-ended queue empty =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Initialize queue
	deque := newLinkedListDeque()

	// Element enqueue
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("Queue deque = ")
	PrintList(deque.toList())

	// Access front element
	front := deque.peekFirst()
	fmt.Println("Front element front =", front)
	rear := deque.peekLast()
	fmt.Println("Rear element rear =", rear)

	// Element dequeue
	popFirst := deque.popFirst()
	fmt.Print("Front dequeue element popFirst = ", popFirst, ", after dequeue deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Rear dequeue element popLast = ", popLast, ", after dequeue deque = ")
	PrintList(deque.toList())

	// Get the length of the queue
	size := deque.size()
	fmt.Println("Queue length size =", size)

	// Determine if it's empty
	isEmpty := deque.isEmpty()
	fmt.Println("Is the queue empty =", isEmpty)
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
