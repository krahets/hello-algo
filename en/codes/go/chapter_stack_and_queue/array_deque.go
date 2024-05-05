// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Double-ended queue class based on circular array */
type arrayDeque struct {
	nums        []int // Array used to store elements of the double-ended queue
	front       int   // Front pointer, pointing to the front element
	queSize     int   // Length of the double-ended queue
	queCapacity int   // Queue capacity (i.e., maximum number of elements it can hold)
}

/* Initialize queue */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Get the length of the double-ended queue */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* Determine if the double-ended queue is empty */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Calculate circular array index */
func (q *arrayDeque) index(i int) int {
	// Implement circular array by modulo operation
	// When i exceeds the tail of the array, return to the head
	// When i exceeds the head of the array, return to the tail
	return (i + q.queCapacity) % q.queCapacity
}

/* Front enqueue */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Double-ended queue is full")
		return
	}
	// Move the front pointer one position to the left
	// Implement front crossing the head of the array to return to the tail by modulo operation
	q.front = q.index(q.front - 1)
	// Add num to the front
	q.nums[q.front] = num
	q.queSize++
}

/* Rear enqueue */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Double-ended queue is full")
		return
	}
	// Calculate rear pointer, pointing to rear index + 1
	rear := q.index(q.front + q.queSize)
	// Add num to the rear
	q.nums[rear] = num
	q.queSize++
}

/* Front dequeue */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	// Move front pointer one position backward
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Rear dequeue */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	q.queSize--
	return num
}

/* Access front element */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Access rear element */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Calculate rear element index
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Get Slice for printing */
func (q *arrayDeque) toSlice() []int {
	// Only convert elements within valid length range
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
