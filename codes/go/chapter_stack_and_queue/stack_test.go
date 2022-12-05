// File: stack_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestStack(t *testing.T) {
	/* 初始化栈 */
	// 在 Go 中，推荐将 Slice 当作栈来使用
	var stack []int

	/* 元素入栈 */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("栈 = ")
	PrintSlice(stack)

	/* 访问栈顶元素 */
	peek := stack[len(stack)-1]
	fmt.Println("栈顶元素 peek =", peek)

	/* 元素出栈 */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("出栈元素 pop = ", pop, "，出栈后 stack = ")
	PrintSlice(stack)

	/* 获取栈的长度 */
	size := len(stack)
	fmt.Println("栈的长度 size =", size)

	/* 判断是否为空 */
	isEmpty := len(stack) == 0
	fmt.Println("栈是否为空 =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// 初始化栈, 使用接口承接
	stack := NewArrayStack()

	// 元素入栈
	stack.Push(1)
	stack.Push(3)
	stack.Push(2)
	stack.Push(5)
	stack.Push(4)
	fmt.Print("栈 stack = ")
	PrintSlice(stack.toSlice())

	// 访问栈顶元素
	peek := stack.Peek()
	fmt.Println("栈顶元素 peek =", peek)

	// 元素出栈
	pop := stack.Pop()
	fmt.Print("出栈元素 pop = ", pop, ", 出栈后 stack = ")
	PrintSlice(stack.toSlice())

	// 获取栈的长度
	size := stack.Size()
	fmt.Println("栈的长度 size =", size)

	// 判断是否为空
	isEmpty := stack.IsEmpty()
	fmt.Println("栈是否为空 =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// 初始化栈
	stack := NewLinkedListStack()
	// 元素入栈
	stack.Push(1)
	stack.Push(3)
	stack.Push(2)
	stack.Push(5)
	stack.Push(4)
	fmt.Print("栈 stack = ")
	PrintList(stack.toList())

	// 访问栈顶元素
	peek := stack.Peek()
	fmt.Println("栈顶元素 peek =", peek)

	// 元素出栈
	pop := stack.Pop()
	fmt.Print("出栈元素 pop = ", pop, ", 出栈后 stack = ")
	PrintList(stack.toList())

	// 获取栈的长度
	size := stack.Size()
	fmt.Println("栈的长度 size =", size)

	// 判断是否为空
	isEmpty := stack.IsEmpty()
	fmt.Println("栈是否为空 =", isEmpty)
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
