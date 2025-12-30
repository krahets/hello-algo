// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// In Go, integer max heap can be built by implementing heap.Interface
// Implementing heap.Interface requires also implementing sort.Interface
type intHeap []any

// Push function of heap.Interface, implements pushing element to heap
func (h *intHeap) Push(x any) {
	// Push and Pop use pointer receiver as parameter
	// Because they not only adjust the slice content, but also modify the slice length.
	*h = append(*h, x.(int))
}

// Pop function of heap.Interface, implements popping heap top element
func (h *intHeap) Pop() any {
	// Element to be popped is stored at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len function of sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Less function of sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// If implementing min heap, need to change to less than sign
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap function of sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top gets heap top element
func (h *intHeap) Top() any {
	return (*h)[0]
}
