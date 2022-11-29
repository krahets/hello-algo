// File: stack_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "testing"

func TestArrayStack(t *testing.T) {
	// 初始化栈, 使用接口承接
	var stack Stack
	stack = NewArrayStack()

	// 元素入栈
	stack.Push(1)
	stack.Push(2)
	stack.Push(3)
	stack.Push(4)
	stack.Push(5)
	t.Log("栈 stack = ", stack.toString())

	// 访问栈顶元素
	peek := stack.Peek()
	t.Log("栈顶元素 peek = ", peek)

	// 元素出栈
	pop := stack.Pop()
	t.Log("出栈元素 pop  = ", pop, ", 出栈后 stack =", stack.toString())

	// 获取栈的长度
	size := stack.Size()
	t.Log("栈的长度 size = ", size)

	// 判断是否为空
	isEmpty := stack.IsEmpty()
	t.Log("栈是否为空 = ", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// 初始化栈
	var stack Stack
	stack = NewLinkedListStack()
	// 元素入栈
	stack.Push(1)
	stack.Push(2)
	stack.Push(3)
	stack.Push(4)
	stack.Push(5)
	t.Log("栈 stack = ", stack.toString())

	// 访问栈顶元素
	peek := stack.Peek()
	t.Log("栈顶元素 peek = ", peek)

	// 元素出栈
	pop := stack.Pop()
	t.Log("出栈元素 pop  = ", pop, ", 出栈后 stack =", stack.toString())

	// 获取栈的长度
	size := stack.Size()
	t.Log("栈的长度 size = ", size)

	// 判断是否为空
	isEmpty := stack.IsEmpty()
	t.Log("栈是否为空 = ", isEmpty)
}

// BenchmarkArrayStack 8 ns/op in Mac M1 Pro
func BenchmarkArrayStack(b *testing.B) {
	stack := NewArrayStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.Push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.Pop()
	}
}

// BenchmarkLinkedListStack 65.02 ns/op in Mac M1 Pro
func BenchmarkLinkedListStack(b *testing.B) {
	stack := NewLinkedListStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.Push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.Pop()
	}
}
