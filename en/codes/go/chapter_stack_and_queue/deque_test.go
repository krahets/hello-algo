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
	// Use Go's list.List as a deque
	deque := list.New()

	/* Add elements to the deque */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("deque = ")
	PrintList(deque)

	/* Peek at the front and rear elements */
	front := deque.Front()
	fmt.Println("Front element (front) =", front.Value)
	rear := deque.Back()
	fmt.Println("Rear element (rear) =", rear.Value)

	/* Remove elements from both ends */
	deque.Remove(front)
	fmt.Print("Removed from the front (front) = ", front.Value, ", deque after removal = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("Removed from the rear (rear) = ", rear.Value, ", deque after removal = ")
	PrintList(deque)

	/* Get the deque size */
	size := deque.Len()
	fmt.Println("Deque size =", size)

	/* Check whether the deque is empty */
	isEmpty := deque.Len() == 0
	fmt.Println("Deque is empty =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* Initialize the deque */
	deque := newArrayDeque(16)

	/* Add elements to the deque */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("deque = ")
	PrintSlice(deque.toSlice())

	/* Peek at the front and rear elements */
	peekFirst := deque.peekFirst()
	fmt.Println("Front element (peekFirst) =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("Rear element (peekLast) =", peekLast)

	/* Add elements to the deque */
	deque.pushLast(4)
	fmt.Print("After adding 4 at the rear, deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("After adding 1 at the front, deque = ")
	PrintSlice(deque.toSlice())

	/* Remove elements from both ends */
	popFirst := deque.popFirst()
	fmt.Print("Removed from the front (popFirst) = ", popFirst, ", deque after removal = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("Removed from the rear (popLast) = ", popLast, ", deque after removal = ")
	PrintSlice(deque.toSlice())

	/* Get the deque size */
	size := deque.size()
	fmt.Println("Deque size =", size)

	/* Check whether the deque is empty */
	isEmpty := deque.isEmpty()
	fmt.Println("Deque is empty =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// Initialize the deque
	deque := newLinkedListDeque()

	// Add elements to the deque
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("deque = ")
	PrintList(deque.toList())

	// Peek at the front element
	front := deque.peekFirst()
	fmt.Println("Front element (front) =", front)
	rear := deque.peekLast()
	fmt.Println("Rear element (rear) =", rear)

	// Remove elements from both ends
	popFirst := deque.popFirst()
	fmt.Print("Removed from the front (popFirst) = ", popFirst, ", deque after removal = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("Removed from the rear (popLast) = ", popLast, ", deque after removal = ")
	PrintList(deque.toList())

	// Get the deque size
	size := deque.size()
	fmt.Println("Deque size =", size)

	// Check whether the deque is empty
	isEmpty := deque.isEmpty()
	fmt.Println("Deque is empty =", isEmpty)
}

// BenchmarkLinkedListDeque took 67.92 ns/op on a Mac with an M1 Pro
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
