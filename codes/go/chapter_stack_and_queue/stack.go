// File: stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

type Stack interface {
	// Push 元素入栈
	Push(num int)
	// Peek 访问栈顶元素
	Peek() int
	// Pop 元素出栈
	Pop() int
	// Size 栈的长度
	Size() int
	// IsEmpty 栈是否为空
	IsEmpty() bool
}
