// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Use a slice instead of an array so it can grow as needed
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
	// Copy the list elements into the heap in their original order
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Heapify all non-leaf nodes
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
	// Floor division
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

/* Peek at the root */
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

/* Sift up from node i */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Get the parent of node i
		p := h.parent(i)
		// Stop sifting at the root or when the node already satisfies the heap property
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
	// Swap the root and the rightmost leaf (the first and last elements)
	h.swap(0, h.size()-1)
	// Remove the node
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Sift down
	h.siftDown(0)

	// Return the root element
	return val
}

/* Sift down from node i */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Store the index of the largest of nodes i, l, and r in max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Stop if i is already largest or both child indices l and r are out of bounds
		if max == i {
			break
		}
		// Swap the two nodes
		h.swap(i, max)
		// Continue sifting down
		i = max
	}
}

/* Print the heap as a binary tree */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
