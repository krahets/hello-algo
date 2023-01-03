// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基于环形数组实现的队列 */
type arrayQueue struct {
	data     []int // 用于存储队列元素的数组
	capacity int   // 队列容量（即最多容量的元素个数）
	front    int   // 头指针，指向队首
	rear     int   // 尾指针，指向队尾 + 1
}

// newArrayQueue 基于环形数组实现的队列
func newArrayQueue(capacity int) *arrayQueue {
	return &arrayQueue{
		data:     make([]int, capacity),
		capacity: capacity,
		front:    0,
		rear:     0,
	}
}

// size 获取队列的长度
func (q *arrayQueue) size() int {
	size := (q.capacity + q.rear - q.front) % q.capacity
	return size
}

// isEmpty 判断队列是否为空
func (q *arrayQueue) isEmpty() bool {
	return q.rear-q.front == 0
}

// offer 入队
func (q *arrayQueue) offer(v int) {
	// 当 rear == capacity 表示队列已满
	if q.size() == q.capacity {
		return
	}
	// 尾结点后添加
	q.data[q.rear] = v
	// 尾指针向后移动一位，越过尾部后返回到数组头部
	q.rear = (q.rear + 1) % q.capacity
}

// poll 出队
func (q *arrayQueue) poll() any {
	if q.isEmpty() {
		return nil
	}
	v := q.data[q.front]
	// 队头指针向后移动一位，若越过尾部则返回到数组头部
	q.front = (q.front + 1) % q.capacity
	return v
}

// peek 访问队首元素
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	v := q.data[q.front]
	return v
}

// 获取 Slice 用于打印
func (q *arrayQueue) toSlice() []int {
	return q.data[q.front:q.rear]
}
