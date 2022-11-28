// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"fmt"
	"strings"
)

// ArrayQueue 基于环形数组实现的队列, 不支持扩容
type ArrayQueue struct {
	data     []any // 用于存储队列元素的数组
	capacity int   // 队列容量（即最多容量的元素个数）
	head     int   // 头指针，指向队首
	tail     int   // 尾指针，指向队尾 + 1
}

// NewArrayQueue 基于环形数组实现的队列
func NewArrayQueue(capacity int) *ArrayQueue {
	return &ArrayQueue{
		data:     make([]any, capacity),
		capacity: capacity,
		head:     0,
		tail:     0,
	}
}

// Size 获取队列的长度
func (q *ArrayQueue) Size() int {
	size := (q.capacity + q.tail - q.head) % q.capacity
	return size
}

// IsEmpty 判断队列是否为空
func (q *ArrayQueue) IsEmpty() bool {
	return q.tail-q.head == 0
}

// Offer 入队
func (q *ArrayQueue) Offer(v any) {
	// 当 tail == capacity 表示队列已满
	if q.Size() == q.capacity {
		return
	}
	// 尾结点后添加
	q.data[q.tail] = v
	// 尾指针向后移动一位，越过尾部后返回到数组头部
	q.tail = (q.tail + 1) % q.capacity
}

// Poll 出队
func (q *ArrayQueue) Poll() any {
	if q.IsEmpty() {
		return nil
	}
	v := q.data[q.head]
	// 队头指针向后移动，越过尾部后返回到数组头部
	q.head = (q.head + 1) % q.capacity
	return v
}

// Peek 访问队首元素
func (q *ArrayQueue) Peek() any {
	if q.IsEmpty() {
		return nil
	}
	v := q.data[q.head]
	return v
}

func (q *ArrayQueue) Print() {
	fmt.Println(q.toString())
}

// toString 通过字符串的方式输出
func (q *ArrayQueue) toString() string {
	// 为空时
	if q.IsEmpty() {
		return "empty items"
	}
	var builder strings.Builder
	size := q.Size()
	str := fmt.Sprintf("%+v", q.data[q.head])
	for i := 1; i < size; i++ {
		builder.WriteString(str + " -> ")
		str = fmt.Sprintf("%+v", q.data[(i+q.head)%q.capacity])
	}
	builder.WriteString(str)
	return builder.String()
}
