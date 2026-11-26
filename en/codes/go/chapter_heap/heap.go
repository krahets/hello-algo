// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// In Go, implement heap.Interface to build an integer max-heap
// Implementing heap.Interface also requires implementing sort.Interface
type intHeap []any

// Push implements heap.Interface and adds an element to the heap
func (h *intHeap) Push(x any) {
	// Push and Pop use pointer receivers
	// because they change both the contents of the slice and its length.
	*h = append(*h, x.(int))
}

// Pop implements heap.Interface and removes the last element of the slice (heap.Pop has already moved the root there)
func (h *intHeap) Pop() any {
	// The element to pop is at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len implements sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Less implements sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// Use the less-than operator for a min-heap
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap implements sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top returns the root element
func (h *intHeap) Top() any {
	return (*h)[0]
}
