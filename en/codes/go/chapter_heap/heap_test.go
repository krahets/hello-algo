// File: heap_test.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"container/heap"
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func testPush(h *intHeap, val int) {
	// Call heap.Push, which uses heap.Interface to add an element
	heap.Push(h, val)
	fmt.Printf("\nAfter pushing %d onto the heap: \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Call heap.Pop, which uses heap.Interface to remove the top element
	val := heap.Pop(h)
	fmt.Printf("\nAfter popping the top element %d from the heap: \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize a max heap
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Push an element onto the heap */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Get the top element of the heap */
	top := maxHeap.Top()
	fmt.Printf("Top element of the heap: %d\n", top)

	/* Pop the top element from the heap */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Get the heap size */
	size := len(*maxHeap)
	fmt.Printf("Number of elements in the heap: %d\n", size)

	/* Check whether the heap is empty */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Is the heap empty? %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize a max heap
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("After building a heap from the input array:\n")
	maxHeap.print()

	/* Get the top element of the heap */
	peek := maxHeap.peek()
	fmt.Printf("\nTop element: %d\n", peek)

	/* Push an element onto the heap */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nAfter pushing %d onto the heap:\n", val)
	maxHeap.print()

	/* Pop the top element from the heap */
	peek = maxHeap.pop()
	fmt.Printf("\nAfter popping the top element %d:\n", peek)
	maxHeap.print()

	/* Get the heap size */
	size := maxHeap.size()
	fmt.Printf("\nNumber of elements in the heap: %d\n", size)

	/* Check whether the heap is empty */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nIs the heap empty? %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Initialize the heap */
	// Prepare the input for heap-based top-k selection
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("The largest " + strconv.Itoa(k) + " elements are:")
	PrintHeap(*res)
}
