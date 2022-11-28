// File: deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

type Deque interface {
	// OfferFirst 元素入队
	OfferFirst(num int)
	// OfferLast 元素入队
	OfferLast(num int)

	// PeekFirst 访问首元素
	PeekFirst() int
	// PeekLast 访问尾元素
	PeekLast() int

	// PollFirst 元素出队
	PollFirst() int
	// PollLast 元素出队
	PollLast() int

	// Size 获取队列长度
	Size() int
	// IsEmpty 队列是否为空
	IsEmpty() bool
}
