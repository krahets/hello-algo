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
	// Go에서는 슬라이스를 스택으로 사용하는 것이 좋다
	var stack []int

	/* 스택에 원소 삽입 */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("스택 stack = ")
	PrintSlice(stack)

	/* 스택 맨 위의 원소 조회 */
	peek := stack[len(stack)-1]
	fmt.Println("맨 위 원소 peek =", peek)

	/* 스택에서 원소 꺼내기 */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("꺼낸 원소 pop = ", pop, ", 꺼낸 후 stack = ")
	PrintSlice(stack)

	/* 스택의 길이 조회 */
	size := len(stack)
	fmt.Println("스택의 길이 size =", size)

	/* 비어 있는지 확인 */
	isEmpty := len(stack) == 0
	fmt.Println("스택이 비어 있는가 =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// 스택 초기화
	stack := newArrayStack()

	// 스택에 원소 삽입
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("스택 stack = ")
	PrintSlice(stack.toSlice())

	// 스택 맨 위의 원소 조회
	peek := stack.peek()
	fmt.Println("맨 위 원소 peek =", peek)

	// 스택에서 원소 꺼내기
	pop := stack.pop()
	fmt.Print("꺼낸 원소 pop = ", pop, ", 꺼낸 후 stack = ")
	PrintSlice(stack.toSlice())

	// 스택의 길이 조회
	size := stack.size()
	fmt.Println("스택의 길이 size =", size)

	// 비어 있는지 확인
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

	// 스택 맨 위의 원소 조회
	peek := stack.peek()
	fmt.Println("맨 위 원소 peek =", peek)

	// 스택에서 원소 꺼내기
	pop := stack.pop()
	fmt.Print("꺼낸 원소 pop = ", pop, ", 꺼낸 후 stack = ")
	PrintList(stack.toList())

	// 스택의 길이 조회
	size := stack.size()
	fmt.Println("스택의 길이 size =", size)

	// 비어 있는지 확인
	isEmpty := stack.isEmpty()
	fmt.Println("스택이 비어 있는가 =", isEmpty)
}

// M1 Pro를 탑재한 Mac에서 측정한 BenchmarkArrayStack의 연산 시간은 8 ns/op이다
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// 반복 횟수로 b.N을 사용한다
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// M1 Pro를 탑재한 Mac에서 측정한 BenchmarkLinkedListStack의 연산 시간은 65.02 ns/op이다
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// 반복 횟수로 b.N을 사용한다
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
