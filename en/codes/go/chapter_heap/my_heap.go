// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Use a slice instead of an array to avoid having to consider expansion issues
	data []any
}

/* Constructor, build an empty heap */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Constructor, build a heap based on slice */
func newMaxHeap(nums []any) *maxHeap {
	// Add all list elements into the heap
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Heapify all nodes except leaves
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
	// Integer division down
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

/* Determine if heap is empty */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Access heap top element */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Push the element into heap */
func (h *maxHeap) push(val any) {
	// Add node
	h.data = append(h.data, val)
	// Heapify from bottom to top
	h.siftUp(len(h.data) - 1)
}

/* Start heapifying node i, from bottom to top */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Get parent node of node i
		p := h.parent(i)
		// When "crossing the root node" or "node does not need repair", end heapification
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Swap two nodes
		h.swap(i, p)
		// Loop upwards heapification
		i = p
	}
}

/* Element exits heap */
func (h *maxHeap) pop() any {
	// Empty handling
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Swap the root node with the rightmost leaf node (swap the first element with the last element)
	h.swap(0, h.size()-1)
	// Remove node
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Heapify from top to bottom
	h.siftDown(0)

	// Return heap top element
	return val
}

/* Start heapifying node i, from top to bottom */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Determine the node with the maximum value among nodes i, l, r, denoted as max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
		if max == i {
			break
		}
		// Swap two nodes
		h.swap(i, max)
		// Loop downwards heapification
		i = max
	}
}

/* Print heap (binary tree) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
