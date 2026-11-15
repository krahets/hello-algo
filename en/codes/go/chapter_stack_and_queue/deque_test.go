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
	/* Initialize the deque */
	// In Go, list can be used as a deque
	deque := list.New()

	/* Enqueue elements */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("Deque deque = ")
	PrintList(deque)

	/* Access an element */
	front := deque.Front()
	fmt.Println("Front element front =", front.Value)
	rear := deque.Back()
	fmt.Println("Rear element rear =", rear.Value)

	/* Dequeue an element */
	deque.Remove(front)
	fmt.Print("Element dequeued from the front, front = ", front.Value, ", after dequeuing from the front, deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("Element dequeued from the rear, rear = ", rear.Value, ", after dequeuing from the rear, deque = ")
	PrintList(deque)

	/* Get the deque size */
	size := deque.Len()
	fmt.Println("Deque size =", size)

	/* Check whether the deque is empty */
	isEmpty := deque.Len() == 0
	fmt.Println("Is the deque empty =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Initialize the deque */
	// Use the custom circular-array deque implementation
	deque := newArrayDeque(16)

	/* Enqueue elements */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("Deque deque = ")
	PrintSlice(deque.toSlice())

	/* Access an element */
	peekFirst := deque.peekFirst()
	fmt.Println("Front element peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("Rear element peekLast =", peekLast)

	/* Enqueue elements */
	deque.pushLast(4)
	fmt.Print("After enqueuing element 4 at the rear, deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("After enqueuing element 1 at the front, deque = ")
	PrintSlice(deque.toSlice())

	/* Dequeue an element */
	popFirst := deque.popFirst()
	fmt.Print("Element dequeued from the front, popFirst = ", popFirst, ", after dequeuing from the front, deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Element dequeued from the rear, popLast = ", popLast, ", after dequeuing from the rear, deque = ")
	PrintSlice(deque.toSlice())

	/* Get the deque size */
	size := deque.size()
	fmt.Println("Deque size =", size)

	/* Check whether the deque is empty */
	isEmpty := deque.isEmpty()
	fmt.Println("Is the deque empty =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Initialize the queue
	deque := newLinkedListDeque()

	// Enqueue elements
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("Deque deque = ")
	PrintList(deque.toList())

	// Access the front element
	front := deque.peekFirst()
	fmt.Println("Front element front =", front)
	rear := deque.peekLast()
	fmt.Println("Rear element rear =", rear)

	// Dequeue an element
	popFirst := deque.popFirst()
	fmt.Print("Element dequeued from the front, popFirst = ", popFirst, ", after dequeuing from the front, deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Element dequeued from the rear, popLast = ", popLast, ", after dequeuing from the rear, deque = ")
	PrintList(deque.toList())

	// Get the deque size
	size := deque.size()
	fmt.Println("Deque size =", size)

	// Check whether it is empty
	isEmpty := deque.isEmpty()
	fmt.Println("Is the deque empty =", isEmpty)
}

// BenchmarkLinkedListDeque: 67.92 ns/op on a Mac M1 Pro
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// Use b.N as the iteration count
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
