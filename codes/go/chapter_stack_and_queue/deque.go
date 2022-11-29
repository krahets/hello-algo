// File: deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

type Deque interface {
	// OfferFirst 元素入队
	OfferFirst(num any)
	// OfferLast 元素入队
	OfferLast(num any)
	// PeekFirst 访问首元素
	PeekFirst() any
	// PeekLast 访问尾元素
	PeekLast() any
	// PollFirst 元素出队
	PollFirst() any
	// PollLast 元素出队
	PollLast() any
	// Size 获取队列长度
	Size() int
	// IsEmpty 队列是否为空
	IsEmpty() bool
	// toString 队列输出为字符串
	toString() string
}
