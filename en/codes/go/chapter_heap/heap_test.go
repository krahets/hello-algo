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
	// Call the heap.Interface function to add an element
	heap.Push(h, val)
	fmt.Printf("\nHeap after pushing %d: \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Call the heap.Interface function to remove an element
	val := heap.Pop(h)
	fmt.Printf("\nHeap after popping the root (%d): \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize a max-heap
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Push an element onto the heap */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Get the root element */
	top := maxHeap.Top()
	fmt.Printf("Root element: %d\n", top)

	/* Pop the root */
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
	// Initialize a max-heap
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("Heap built from the input array:\n")
	maxHeap.print()

	/* Get the root element */
	peek := maxHeap.peek()
	fmt.Printf("\nRoot element: %d\n", peek)

	/* Push an element onto the heap */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nHeap after pushing %d:\n", val)
	maxHeap.print()

	/* Pop the root */
	peek = maxHeap.pop()
	fmt.Printf("\nHeap after popping the root (%d):\n", peek)
	maxHeap.print()

	/* Get the heap size */
	size := maxHeap.size()
	fmt.Printf("\nNumber of elements in the heap: %d\n", size)

	/* Check whether the heap is empty */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nIs the heap empty? %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("The top " + strconv.Itoa(k) + " elements are:")
	PrintHeap(*res)
}
