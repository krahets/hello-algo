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
	/* 初始化堆疊 */
	// 在 Go 中，推薦將 Slice 當作堆疊來使用
	var stack []int

	/* 元素入堆疊 */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("堆疊 stack = ")
	PrintSlice(stack)

	/* 訪問堆疊頂元素 */
	peek := stack[len(stack)-1]
	fmt.Println("堆疊頂元素 peek =", peek)

	/* 元素出堆疊 */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("出堆疊元素 pop = ", pop, "，出堆疊後 stack = ")
	PrintSlice(stack)

	/* 獲取堆疊的長度 */
	size := len(stack)
	fmt.Println("堆疊的長度 size =", size)

	/* 判斷是否為空 */
	isEmpty := len(stack) == 0
	fmt.Println("堆疊是否為空 =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// 初始化堆疊, 使用介面承接
	stack := newArrayStack()

	// 元素入堆疊
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("堆疊 stack = ")
	PrintSlice(stack.toSlice())

	// 訪問堆疊頂元素
	peek := stack.peek()
	fmt.Println("堆疊頂元素 peek =", peek)

	// 元素出堆疊
	pop := stack.pop()
	fmt.Print("出堆疊元素 pop = ", pop, ", 出堆疊後 stack = ")
	PrintSlice(stack.toSlice())

	// 獲取堆疊的長度
	size := stack.size()
	fmt.Println("堆疊的長度 size =", size)

	// 判斷是否為空
	isEmpty := stack.isEmpty()
	fmt.Println("堆疊是否為空 =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// 初始化堆疊
	stack := newLinkedListStack()
	// 元素入堆疊
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("堆疊 stack = ")
	PrintList(stack.toList())

	// 訪問堆疊頂元素
	peek := stack.peek()
	fmt.Println("堆疊頂元素 peek =", peek)

	// 元素出堆疊
	pop := stack.pop()
	fmt.Print("出堆疊元素 pop = ", pop, ", 出堆疊後 stack = ")
	PrintList(stack.toList())

	// 獲取堆疊的長度
	size := stack.size()
	fmt.Println("堆疊的長度 size =", size)

	// 判斷是否為空
	isEmpty := stack.isEmpty()
	fmt.Println("堆疊是否為空 =", isEmpty)
}

// BenchmarkArrayStack 8 ns/op in Mac M1 Pro
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// BenchmarkLinkedListStack 65.02 ns/op in Mac M1 Pro
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
