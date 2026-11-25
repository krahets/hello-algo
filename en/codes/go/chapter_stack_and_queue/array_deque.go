// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Deque backed by a circular array */
type arrayDeque struct {
	nums        []int // Array that stores the deque elements
	front       int   // Index of the front element
	queSize     int   // Deque size
	queCapacity int   // Deque capacity (the maximum number of elements it can hold)
}

/* Initialize the deque */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Get the deque size */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* Check whether the deque is empty */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Compute the circular array index */
func (q *arrayDeque) index(i int) int {
	// Use the remainder to wrap indices around the array
	// When i goes past the end, wrap it back to the start
	// When i goes before the start, wrap it around to the end
	return (i + q.queCapacity) % q.queCapacity
}

/* Add an element at the front */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Deque is full")
		return
	}
	// Move the front index one slot to the left
	// Use the remainder to wrap front to the end if it goes before the start
	q.front = q.index(q.front - 1)
	// Add num at the front
	q.nums[q.front] = num
	q.queSize++
}

/* Add an element at the rear */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Deque is full")
		return
	}
	// Compute the index one slot past the rear element
	rear := q.index(q.front + q.queSize)
	// Add num at the rear
	q.nums[rear] = num
	q.queSize++
}

/* Remove and return the front element */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Advance the front index by one
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Remove and return the rear element */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Peek at the front element */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Peek at the rear element */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Compute the index of the rear element
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Return a slice for printing */
func (q *arrayDeque) toSlice() []int {
	// Copy only the elements currently in the deque
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
