// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Double-ended queue based on circular array implementation */
type arrayDeque struct {
	nums        []int // Array for storing double-ended queue elements
	front       int   // Front pointer, points to the front of the queue element
	queSize     int   // Double-ended queue length
	queCapacity int   // Queue capacity (maximum number of elements)
}

/* Access front of the queue element */
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

/* Check if the double-ended queue is empty */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Calculate circular array index */
func (q *arrayDeque) index(i int) int {
	// Use modulo operation to wrap the array head and tail together
	// When i passes the tail of the array, return to the head
	// When i passes the head of the array, return to the tail
	return (i + q.queCapacity) % q.queCapacity
}

/* Front of the queue enqueue */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Double-ended queue is full")
		return
	}
	// Use modulo operation to wrap front around to the tail after passing the head of the array
	// Add num to the front of the queue
	q.front = q.index(q.front - 1)
	// Add num to front of queue
	q.nums[q.front] = num
	q.queSize++
}

/* Rear of the queue enqueue */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Double-ended queue is full")
		return
	}
	// Use modulo operation to wrap rear around to the head after passing the tail of the array
	rear := q.index(q.front + q.queSize)
	// Front pointer moves one position backward
	q.nums[rear] = num
	q.queSize++
}

/* Rear of the queue dequeue */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Move front pointer backward by one position
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Access rear of the queue element */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Return list for printing */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Driver Code */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Initialize double-ended queue
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Get Slice for printing */
func (q *arrayDeque) toSlice() []int {
	// Elements enqueue
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
