// File: queue.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

type Queue interface {
	// Offer 元素入队
	Offer(num any)
	// Peek 访问首元素
	Peek() any
	// Poll 元素出队
	Poll() any
	// Size 获取队列长度
	Size() int
	// IsEmpty 队列是否为空
	IsEmpty() bool
	// toString 队列输出为字符串
	toString() string
}
