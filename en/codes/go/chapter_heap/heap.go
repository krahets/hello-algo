// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// In Go, implement heap.Interface to build an integer max heap
// Implementing heap.Interface also requires implementing sort.Interface
type intHeap []any

// Push implements heap.Interface by appending an element for the heap package
func (h *intHeap) Push(x any) {
	// Push and Pop use pointer receivers
	// because they modify the slice length as well as its contents.
	*h = append(*h, x.(int))
}

// Pop implements heap.Interface by removing the last element, where heap.Pop has moved the top element
func (h *intHeap) Pop() any {
	// The element to remove is stored at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len implements the sort.Interface length method
func (h *intHeap) Len() int {
	return len(*h)
}

// Less implements the sort.Interface comparison method
func (h *intHeap) Less(i, j int) bool {
	// For a min heap, change the comparison to less than
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap implements the sort.Interface swap method
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top returns the top element of the heap
func (h *intHeap) Top() any {
	return (*h)[0]
}
