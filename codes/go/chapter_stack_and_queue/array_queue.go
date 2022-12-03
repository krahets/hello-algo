// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基于环形数组实现的队列 */
type ArrayQueue struct {
	data     []int // 用于存储队列元素的数组
	capacity int   // 队列容量（即最多容量的元素个数）
	front    int   // 头指针，指向队首
	rear     int   // 尾指针，指向队尾 + 1
}

// NewArrayQueue 基于环形数组实现的队列
func NewArrayQueue(capacity int) *ArrayQueue {
	return &ArrayQueue{
		data:     make([]int, capacity),
		capacity: capacity,
		front:    0,
		rear:     0,
	}
}

// Size 获取队列的长度
func (q *ArrayQueue) Size() int {
	size := (q.capacity + q.rear - q.front) % q.capacity
	return size
}

// IsEmpty 判断队列是否为空
func (q *ArrayQueue) IsEmpty() bool {
	return q.rear-q.front == 0
}

// Offer 入队
func (q *ArrayQueue) Offer(v int) {
	// 当 rear == capacity 表示队列已满
	if q.Size() == q.capacity {
		return
	}
	// 尾结点后添加
	q.data[q.rear] = v
	// 尾指针向后移动一位，越过尾部后返回到数组头部
	q.rear = (q.rear + 1) % q.capacity
}

// Poll 出队
func (q *ArrayQueue) Poll() any {
	if q.IsEmpty() {
		return nil
	}
	v := q.data[q.front]
	// 队头指针向后移动一位，若越过尾部则返回到数组头部
	q.front = (q.front + 1) % q.capacity
	return v
}

// Peek 访问队首元素
func (q *ArrayQueue) Peek() any {
	if q.IsEmpty() {
		return nil
	}
	v := q.data[q.front]
	return v
}

// 获取 Slice 用于打印
func (s *ArrayQueue) toSlice() []int {
	return s.data[s.front:s.rear]
}
