// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Queue backed by a circular array */
type arrayQueue struct {
	nums        []int // Array that stores the queue elements
	front       int   // Index of the front element
	queSize     int   // Queue size
	queCapacity int   // Queue capacity (the maximum number of elements it can hold)
}

/* Initialize the queue */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Get the queue size */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* Check whether the queue is empty */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* Enqueue an element */
func (q *arrayQueue) push(num int) {
	// The queue is full when queSize == queCapacity
	if q.queSize == q.queCapacity {
		return
	}
	// Compute the index one slot past the rear element
	// Use the remainder to wrap rear back to the start of the array
	rear := (q.front + q.queSize) % q.queCapacity
	// Add num at the rear
	q.nums[rear] = num
	q.queSize++
}

/* Remove and return the front element */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Advance the front index by one, wrapping to the start if it passes the end
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Peek at the front element */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Return a slice for printing */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
