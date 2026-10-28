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
	/* 스택 초기화 */
	// Go에서는 Slice를 스택으로 사용하는 것을 권장한다
	var stack []int

	/* 스택에 원소 삽입 */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("스택 stack = ")
	PrintSlice(stack)

	/* 스택 맨 위 원소 접근 */
	peek := stack[len(stack)-1]
	fmt.Println("스택 맨 위 원소 peek =", peek)

	/* 스택에서 원소 꺼내기 */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("스택에서 꺼낸 원소 pop = ", pop, ", 스택에서 꺼낸 후 stack = ")
	PrintSlice(stack)

	/* 스택의 길이 반환 */
	size := len(stack)
	fmt.Println("스택의 길이 size =", size)

	/* 비어 있는지 판단 */
	isEmpty := len(stack) == 0
	fmt.Println("스택이 비어 있는가 =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// 스택을 초기화하고 인터페이스로 받는다
	stack := newArrayStack()

	// 스택에 원소 삽입
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("스택 stack = ")
	PrintSlice(stack.toSlice())

	// 스택 맨 위 원소 접근
	peek := stack.peek()
	fmt.Println("스택 맨 위 원소 peek =", peek)

	// 스택에서 원소 꺼내기
	pop := stack.pop()
	fmt.Print("스택에서 꺼낸 원소 pop = ", pop, ", 꺼낸 뒤 stack = ")
	PrintSlice(stack.toSlice())

	// 스택의 길이 반환
	size := stack.size()
	fmt.Println("스택의 길이 size =", size)

	// 비어 있는지 판단
	isEmpty := stack.isEmpty()
	fmt.Println("스택이 비어 있는가 =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// 스택 초기화
	stack := newLinkedListStack()
	// 스택에 원소 삽입
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("스택 stack = ")
	PrintList(stack.toList())

	// 스택 맨 위 원소 접근
	peek := stack.peek()
	fmt.Println("스택 맨 위 원소 peek =", peek)

	// 스택에서 원소 꺼내기
	pop := stack.pop()
	fmt.Print("스택에서 꺼낸 원소 pop = ", pop, ", 꺼낸 뒤 stack = ")
	PrintList(stack.toList())

	// 스택의 길이 반환
	size := stack.size()
	fmt.Println("스택의 길이 size =", size)

	// 비어 있는지 판단
	isEmpty := stack.isEmpty()
	fmt.Println("스택이 비어 있는가 =", isEmpty)
}

// BenchmarkArrayStack: Mac M1 Pro에서 8 ns/op
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// b.N을 반복 횟수로 사용한다
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// BenchmarkLinkedListStack: Mac M1 Pro에서 65.02 ns/op
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// b.N을 반복 횟수로 사용한다
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
