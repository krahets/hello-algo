// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push implements heap.Interface by appending an element for the heap package
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop implements heap.Interface by removing the last element, where heap.Pop has moved the top element
func (h *minHeap) Pop() any {
	// The element to remove is stored at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top returns the top element of the heap
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Use a heap to find the k largest elements in an array */
func topKHeap(nums []int, k int) *minHeap {
	// Initialize a min heap
	h := &minHeap{}
	heap.Init(h)
	// Push the first k array elements onto the heap
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Starting with element k+1, keep the heap size at k
	for i := k; i < len(nums); i++ {
		// If the current element is larger than the heap top, pop the top element and push the current element
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
