// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Sift down from node i in a heap of size n */
func siftDown(nums *[]int, n, i int) {
	for true {
		// Find the node with the largest value among i, l, and r, and store its index in ma
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// Stop if node i is largest or both child indices l and r are out of bounds
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
	// Build the heap by sifting down from every non-leaf node
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// Extract the largest element from the heap, repeating for n-1 rounds
	for i := len(*nums) - 1; i > 0; i-- {
		// Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// Sift down starting at the root
		siftDown(nums, i, 0)
	}
}
