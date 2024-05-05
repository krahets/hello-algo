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
	// Call heap.Interface functions to add elements
	heap.Push(h, val)
	fmt.Printf("\nElement %d after being pushed into the heap \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Call heap.Interface functions to remove elements
	val := heap.Pop(h)
	fmt.Printf("\nTop element %d after being popped from the heap \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize max-heap
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Push the element into heap */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Access heap top element */
	top := maxHeap.Top()
	fmt.Printf("Top element is %d\n", top)

	/* Pop the element at the heap top */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Get heap size */
	size := len(*maxHeap)
	fmt.Printf("Number of elements in the heap is %d\n", size)

	/* Determine if heap is empty */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Is the heap empty %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize max-heap
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("After inputting array and building heap\n")
	maxHeap.print()

	/* Access heap top element */
	peek := maxHeap.peek()
	fmt.Printf("\nTop element of the heap is %d\n", peek)

	/* Push the element into heap */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nAfter element %d is added to the heap\n", val)
	maxHeap.print()

	/* Pop the element at the heap top */
	peek = maxHeap.pop()
	fmt.Printf("\nAfter the top element %d is removed from the heap\n", peek)
	maxHeap.print()

	/* Get heap size */
	size := maxHeap.size()
	fmt.Printf("\nNumber of elements in the heap is %d\n", size)

	/* Determine if heap is empty */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nIs the heap empty %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Initialize the heap */
	// Initialize max-heap
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("The largest " + strconv.Itoa(k) + " elements are")
	PrintHeap(*res)
}
