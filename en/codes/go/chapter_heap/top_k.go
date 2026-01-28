// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push method of heap.Interface, implements pushing element to heap
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop method of heap.Interface, implements popping heap top element
func (h *minHeap) Pop() any {
	// Element to be popped is stored at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top gets heap top element
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Find the largest k elements in array based on heap */
func topKHeap(nums []int, k int) *minHeap {
	// Python's heapq module implements min heap by default
	h := &minHeap{}
	heap.Init(h)
	// Enter the first k elements of array into heap
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Starting from the (k+1)th element, maintain heap length as k
	for i := k; i < len(nums); i++ {
		// If current element is greater than top element, top element exits heap, current element enters heap
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
