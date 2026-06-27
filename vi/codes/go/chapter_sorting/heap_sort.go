// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Heap length is n, start heapifying node i, from top to bottom */
func siftDown(nums *[]int, n, i int) {
	for true {
		// If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// Swap two nodes
		if ma == i {
			break
		}
		// Swap two nodes
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// Loop downwards heapification
		i = ma
	}
}

/* Heap sort */
func heapSort(nums *[]int) {
	// Build heap operation: heapify all nodes except leaves
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// Extract the largest element from the heap and repeat for n-1 rounds
	for i := len(*nums) - 1; i > 0; i-- {
		// Delete node
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// Start heapifying the root node, from top to bottom
		siftDown(nums, i, 0)
	}
}
