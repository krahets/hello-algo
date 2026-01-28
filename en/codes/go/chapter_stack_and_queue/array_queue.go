// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Queue based on circular array implementation */
type arrayQueue struct {
	nums        []int // Array for storing queue elements
	front       int   // Front pointer, points to the front of the queue element
	queSize     int   // Queue length
	queCapacity int   // Queue capacity (maximum number of elements)
}

/* Access front of the queue element */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Get the length of the queue */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* Check if the queue is empty */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* Enqueue */
func (q *arrayQueue) push(num int) {
	// When rear == queCapacity, queue is full
	if q.queSize == q.queCapacity {
		return
	}
	// Use modulo operation to wrap rear around to the head after passing the tail of the array
	// Add num to the rear of the queue
	rear := (q.front + q.queSize) % q.queCapacity
	// Front pointer moves one position backward
	q.nums[rear] = num
	q.queSize++
}

/* Dequeue */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Move front pointer backward by one position, if it passes the tail, return to array head
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Return list for printing */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Get Slice for printing */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
