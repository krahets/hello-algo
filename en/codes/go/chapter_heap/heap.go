// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// In Go, building a max-heap can be done by implementing the heap.Interface
// Implementing heap.Interface requires implementing sort.Interface as well
type intHeap []any

// Push function for heap.Interface, to push elements into the heap
func (h *intHeap) Push(x any) {
	// Push and Pop use pointer receivers as parameters
	// Because they not only adjust the contents of the slice but also modify its length
	*h = append(*h, x.(int))
}

// Pop function for heap.Interface, to pop the top element of the heap
func (h *intHeap) Pop() any {
	// Element to be popped is placed at the end
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len function for sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Less function for sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// If implementing a min-heap, adjust to use less than sign
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap function for sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top retrieves the top element of the heap
func (h *intHeap) Top() any {
	return (*h)[0]
}
