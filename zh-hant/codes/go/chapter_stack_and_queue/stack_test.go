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
	// 在 Go 中，建議用切片（slice）當作堆疊
	var stack []int

	/* 將元素推入堆疊 */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("堆疊 stack = ")
	PrintSlice(stack)

	/* 讀取堆疊頂端的元素 */
	peek := stack[len(stack)-1]
	fmt.Println("堆疊頂端元素 peek =", peek)

	/* 從堆疊彈出元素 */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("彈出的元素 pop = ", pop, "，彈出後 stack = ")
	PrintSlice(stack)

	/* 取得堆疊長度 */
	size := len(stack)
	fmt.Println("堆疊長度 size =", size)

	/* 判斷堆疊是否為空 */
	isEmpty := len(stack) == 0
	fmt.Println("堆疊是否為空 =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// 初始化堆疊
	stack := newArrayStack()

	// 將元素推入堆疊
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("堆疊 stack = ")
	PrintSlice(stack.toSlice())

	// 讀取堆疊頂端的元素
	peek := stack.peek()
	fmt.Println("堆疊頂端元素 peek =", peek)

	// 從堆疊彈出元素
	pop := stack.pop()
	fmt.Print("彈出的元素 pop = ", pop, "， 彈出後 stack = ")
	PrintSlice(stack.toSlice())

	// 取得堆疊長度
	size := stack.size()
	fmt.Println("堆疊長度 size =", size)

	// 判斷堆疊是否為空
	isEmpty := stack.isEmpty()
	fmt.Println("堆疊是否為空 =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// 初始化堆疊
	stack := newLinkedListStack()
	// 將元素推入堆疊
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("堆疊 stack = ")
	PrintList(stack.toList())

	// 讀取堆疊頂端的元素
	peek := stack.peek()
	fmt.Println("堆疊頂端元素 peek =", peek)

	// 從堆疊彈出元素
	pop := stack.pop()
	fmt.Print("彈出的元素 pop = ", pop, "， 彈出後 stack = ")
	PrintList(stack.toList())

	// 取得堆疊長度
	size := stack.size()
	fmt.Println("堆疊長度 size =", size)

	// 判斷堆疊是否為空
	isEmpty := stack.isEmpty()
	fmt.Println("堆疊是否為空 =", isEmpty)
}

// BenchmarkArrayStack 在配備 M1 Pro 的 Mac 上測得 8 ns/op
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// 以 b.N 作為迴圈次數
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// BenchmarkLinkedListStack 在配備 M1 Pro 的 Mac 上測得 65.02 ns/op
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// 以 b.N 作為迴圈次數
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
