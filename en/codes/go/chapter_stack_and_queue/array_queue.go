// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Queue class based on circular array */
type arrayQueue struct {
	nums        []int // Array for storing queue elements
	front       int   // Front pointer, pointing to the front element
	queSize     int   // Queue length
	queCapacity int   // Queue capacity (i.e., maximum number of elements it can hold)
}

/* Initialize queue */
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

/* Determine if the queue is empty */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* Enqueue */
func (q *arrayQueue) push(num int) {
	// When rear == queCapacity indicates that the queue is full
	if q.queSize == q.queCapacity {
		return
	}
	// Calculate rear pointer, pointing to rear index + 1
	// Use modulo operation to wrap the rear pointer from the end of the array back to the start
	rear := (q.front + q.queSize) % q.queCapacity
	// Add num to the rear
	q.nums[rear] = num
	q.queSize++
}

/* Dequeue */
func (q *arrayQueue) pop() any {
	num := q.peek()
	// Move front pointer one position backward, returning to the head of the array if it exceeds the tail
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Access front element */
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
