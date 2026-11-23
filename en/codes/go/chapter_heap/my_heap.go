// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Use a slice instead of an array so append can handle capacity growth
	data []any
}

/* Constructor: create an empty heap */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Constructor: build a heap from a slice */
func newMaxHeap(nums []any) *maxHeap {
	// Place the list elements in the heap without changing their order
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Sift down from every non-leaf node
		h.siftDown(i)
	}
	return h
}

/* Get the left child index */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* Get the right child index */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* Get the parent index */
func (h *maxHeap) parent(i int) int {
	// Integer division (truncates toward zero in Go)
	return (i - 1) / 2
}

/* Swap elements */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* Get the heap size */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Check whether the heap is empty */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Access the top element of the heap */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Push an element onto the heap */
func (h *maxHeap) push(val any) {
	// Add a node
	h.data = append(h.data, val)
	// Sift up
	h.siftUp(len(h.data) - 1)
}

/* Sift up starting from node i */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Get the parent of node i
		p := h.parent(i)
		// Stop sifting when the root has been passed or the node needs no repair
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Swap the two nodes
		h.swap(i, p)
		// Continue sifting up
		i = p
	}
}

/* Pop an element from the heap */
func (h *maxHeap) pop() any {
	// Handle an empty heap
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Swap the root with the rightmost leaf on the last level (swap the first and last elements)
	h.swap(0, h.size()-1)
	// Remove a node
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Sift down
	h.siftDown(0)

	// Return the top element of the heap
	return val
}

/* Sift down starting from node i */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Find the node with the largest value among i, l, and r, and store its index in max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Stop if node i is largest or both child indices l and r are out of bounds
		if max == i {
			break
		}
		// Swap the two nodes
		h.swap(i, max)
		// Continue sifting down
		i = max
	}
}

/* Print the heap (binary tree) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
