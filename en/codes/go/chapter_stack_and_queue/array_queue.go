// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Queue implemented with a circular array */
type arrayQueue struct {
	nums        []int // Array that stores the queue elements
	front       int   // Front pointer, pointing to the first element
	queSize     int   // Queue size
	queCapacity int   // Queue capacity (the maximum number of elements)
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

/* Enqueue */
func (q *arrayQueue) push(num int) {
	// The queue is full when queSize == queCapacity
	if q.queSize == q.queCapacity {
		return
	}
	// Calculate the rear pointer, which points one position past the last element
	// Use modulo to wrap rear to the beginning when it passes the end of the array
	rear := (q.front + q.queSize) % q.queCapacity
	// Add num to the rear
	q.nums[rear] = num
	q.queSize++
}

/* Dequeue */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Advance the front pointer by one position, wrapping to the beginning if it passes the end
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Access the front element */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Get a slice for printing */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
