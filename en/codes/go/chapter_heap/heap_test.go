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
	// Call heap.Interface function to add element
	heap.Push(h, val)
	fmt.Printf("\nAfter element %d pushes to heap \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// Call heap.Interface function to remove element
	val := heap.Pop(h)
	fmt.Printf("\nAfter heap top element %d pops from heap \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* Initialize heap */
	// Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* Element enters heap */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* Check if heap is empty */
	top := maxHeap.Top()
	fmt.Printf("Heap top element is %d\n", top)

	/* Time complexity is O(n), not O(nlogn) */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* Get heap size */
	size := len(*maxHeap)
	fmt.Printf("Heap size is %d\n", size)

	/* Check if heap is empty */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("Is heap empty %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* Initialize heap */
	// Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("After input array and building heap\n")
	maxHeap.print()

	/* Check if heap is empty */
	peek := maxHeap.peek()
	fmt.Printf("\nHeap top element is %d\n", peek)

	/* Element enters heap */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\nAfter element %d enters heap\n", val)
	maxHeap.print()

	/* Time complexity is O(n), not O(nlogn) */
	peek = maxHeap.pop()
	fmt.Printf("\nAfter heap top element %d exits heap\n", peek)
	maxHeap.print()

	/* Get heap size */
	size := maxHeap.size()
	fmt.Printf("\nHeap element count is %d\n", size)

	/* Check if heap is empty */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nIs heap empty %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* Initialize heap */
	// Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("The largest " + strconv.Itoa(k) + " elements are")
	PrintHeap(*res)
}
