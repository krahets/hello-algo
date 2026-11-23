// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Deque implemented with a circular array */
type arrayDeque struct {
	nums        []int // Array that stores the deque elements
	front       int   // Front pointer, pointing to the first element
	queSize     int   // Deque size
	queCapacity int   // Queue capacity (the maximum number of elements)
}

/* Initialize the queue */
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

/* Calculate an index in the circular array */
func (q *arrayDeque) index(i int) int {
	// Use modulo to connect the end of the array to its beginning
	// When i passes the end of the array, wrap around to the beginning
	// When i passes the beginning of the array, wrap around to the end
	return (i + q.queCapacity) % q.queCapacity
}

/* Enqueue at the front */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Deque is full")
		return
	}
	// Move the front pointer one position to the left
	// Use modulo to wrap front to the end when it passes the beginning of the array
	q.front = q.index(q.front - 1)
	// Add num to the front
	q.nums[q.front] = num
	q.queSize++
}

/* Enqueue at the rear */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Deque is full")
		return
	}
	// Calculate the rear pointer, which points one position past the last element
	rear := q.index(q.front + q.queSize)
	// Add num to the rear
	q.nums[rear] = num
	q.queSize++
}

/* Dequeue from the front */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Advance the front pointer by one position
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Dequeue from the rear */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Access the front element */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Access the rear element */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Calculate the index of the last element
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Get a slice for printing */
func (q *arrayDeque) toSlice() []int {
	// Convert only the list elements within the occupied range
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
