// File: queue.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

type Queue interface {
	// Offer 元素入队
	Offer(num int)
	// Peek 访问首元素
	Peek() int
	// Poll 元素出队
	Poll() int
	// Size 获取队列长度
	Size() int
	// IsEmpty 队列是否为空
	IsEmpty() bool
}
