// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push implements heap.Interface and adds an element to the heap
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop implements heap.Interface and removes the last element of the slice (heap.Pop has already moved the root there)
func (h *minHeap) Pop() any {
	// The element to pop is at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top returns the root element
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Find the k largest elements in the array using a heap */
func topKHeap(nums []int, k int) *minHeap {
	// Initialize a min-heap
	h := &minHeap{}
	heap.Init(h)
	// Push the first k array elements onto the heap
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Starting with element k+1, keep the heap size at k
	for i := k; i < len(nums); i++ {
		// If the current element exceeds the root, pop the root and push the current element
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
