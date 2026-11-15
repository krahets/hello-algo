// File: deque_test.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestDeque(t *testing.T) {
	/* 덱 초기화 */
	// Go에서는 list를 덱으로 사용한다
	deque := list.New()

	/* 큐에 원소 삽입 */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("덱 deque = ")
	PrintList(deque)

	/* 원소 접근 */
	front := deque.Front()
	fmt.Println("맨 앞 원소 front =", front.Value)
	rear := deque.Back()
	fmt.Println("맨 뒤 원소 rear =", rear.Value)

	/* 큐에서 원소 꺼내기 */
	deque.Remove(front)
	fmt.Print("맨 앞에서 꺼낸 원소 front = ", front.Value, ", 맨 앞에서 꺼낸 후 deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("맨 뒤에서 꺼낸 원소 rear = ", rear.Value, ", 맨 뒤에서 꺼낸 후 deque = ")
	PrintList(deque)

	/* 덱의 길이 반환 */
	size := deque.Len()
	fmt.Println("덱 길이 size =", size)

	/* 덱이 비어 있는지 판단 */
	isEmpty := deque.Len() == 0
	fmt.Println("덱이 비어 있는가 =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 덱 초기화 */
	// Go에서는 list를 덱으로 사용한다
	deque := newArrayDeque(16)

	/* 큐에 원소 삽입 */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("덱 deque = ")
	PrintSlice(deque.toSlice())

	/* 원소 접근 */
	peekFirst := deque.peekFirst()
	fmt.Println("맨 앞 원소 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("맨 뒤 원소 peekLast =", peekLast)

	/* 큐에 원소 삽입 */
	deque.pushLast(4)
	fmt.Print("원소 4를 맨 뒤에 삽입한 후 deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("원소 1을 맨 앞에 삽입한 후 deque = ")
	PrintSlice(deque.toSlice())

	/* 큐에서 원소 꺼내기 */
	popFirst := deque.popFirst()
	fmt.Print("맨 앞에서 꺼낸 원소 popFirst = ", popFirst, ", 맨 앞에서 꺼낸 후 deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("맨 뒤에서 꺼낸 원소 popLast = ", popLast, ", 맨 뒤에서 꺼낸 후 deque = ")
	PrintSlice(deque.toSlice())

	/* 덱의 길이 반환 */
	size := deque.size()
	fmt.Println("덱 길이 size =", size)

	/* 덱이 비어 있는지 판단 */
	isEmpty := deque.isEmpty()
	fmt.Println("덱이 비어 있는가 =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// 큐 초기화
	deque := newLinkedListDeque()

	// 큐에 원소 삽입
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("큐 deque = ")
	PrintList(deque.toList())

	// 맨 앞 원소 접근
	front := deque.peekFirst()
	fmt.Println("맨 앞 원소 front =", front)
	rear := deque.peekLast()
	fmt.Println("맨 뒤 원소 rear =", rear)

	// 큐에서 원소 꺼내기
	popFirst := deque.popFirst()
	fmt.Print("맨 앞에서 꺼낸 원소 popFirst = ", popFirst, ", 맨 앞에서 꺼낸 후 deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("맨 뒤에서 꺼낸 원소 popLast = ", popLast, ", 맨 뒤에서 꺼낸 후 deque = ")
	PrintList(deque.toList())

	// 큐의 길이 반환
	size := deque.size()
	fmt.Println("큐 길이 size =", size)

	// 비어 있는지 판단
	isEmpty := deque.isEmpty()
	fmt.Println("큐가 비어 있는가 =", isEmpty)
}

// BenchmarkLinkedListDeque: Mac M1 Pro에서 67.92 ns/op
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// b.N을 반복 횟수로 사용한다
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
