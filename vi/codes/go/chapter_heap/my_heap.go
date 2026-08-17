// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Use slice instead of array to avoid expansion issues
	data []any
}

/* Constructor, build empty heap */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Constructor, build heap from slice */
func newMaxHeap(nums []any) *maxHeap {
	// Add list elements to heap as is
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Heapify all nodes except leaf nodes
		h.siftDown(i)
	}
	return h
}

/* Get index of left child node */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* Get index of right child node */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* Get index of parent node */
func (h *maxHeap) parent(i int) int {
	// Floor division
	return (i - 1) / 2
}

/* Swap elements */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* Get heap size */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Check if heap is empty */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Access top element */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Element enters heap */
func (h *maxHeap) push(val any) {
	// Add node
	h.data = append(h.data, val)
	// Heapify from bottom to top
	h.siftUp(len(h.data) - 1)
}

/* Starting from node i, heapify from bottom to top */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Get parent node of node i
		p := h.parent(i)
		// When "crossing root node" or "node needs no repair", end heapify
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Swap two nodes
		h.swap(i, p)
		// Loop upward heapify
		i = p
	}
}

/* Element exits heap */
func (h *maxHeap) pop() any {
	// Handle empty case
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Delete node
	h.swap(0, h.size()-1)
	// Remove node
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Return top element
	h.siftDown(0)

	// Return heap top element
	return val
}

/* Starting from node i, heapify from top to bottom */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Find node with maximum value among nodes i, l, r, denoted as max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Swap two nodes
		if max == i {
			break
		}
		// Swap two nodes
		h.swap(i, max)
		// Loop downwards heapification
		i = max
	}
}

/* Driver Code */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
