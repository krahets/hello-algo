// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Sift down from node i in a heap of size n */
func siftDown(nums *[]int, n, i int) {
	for true {
		// Let ma be the index of the largest of nodes i, l, and r
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// Stop if i is the largest or both child indices l and r are out of bounds
		if ma == i {
			break
		}
		// Swap the two nodes
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// Continue sifting down
		i = ma
	}
}

/* Heap sort */
func heapSort(nums *[]int) {
	// Build the heap by sifting down from each non-leaf node
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// Extract the maximum from the heap in each of n-1 rounds
	for i := len(*nums) - 1; i > 0; i-- {
		// Swap the root and rightmost leaf (the first and last elements)
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// Sift down from the root
		siftDown(nums, i, 0)
	}
}
