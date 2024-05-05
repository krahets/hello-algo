// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push method for heap.Interface, to push elements into the heap
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop method for heap.Interface, to pop the top element of the heap
func (h *minHeap) Pop() any {
	// Element to be popped is placed at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top retrieves the top element of the heap
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Using heap to find the largest k elements in an array */
func topKHeap(nums []int, k int) *minHeap {
	// Initialize min-heap
	h := &minHeap{}
	heap.Init(h)
	// Enter the first k elements of the array into the heap
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// From the k+1th element, keep the heap length as k
	for i := k; i < len(nums); i++ {
		// If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
