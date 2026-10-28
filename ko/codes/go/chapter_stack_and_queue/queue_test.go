// File: queue_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestQueue(t *testing.T) {
	/* 큐 초기화 */
	// Go에서는 list를 큐로 사용한다
	queue := list.New()

	/* 큐에 원소 삽입 */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("큐 queue = ")
	PrintList(queue)

	/* 맨 앞 원소 접근 */
	peek := queue.Front()
	fmt.Println("맨 앞 원소 peek =", peek.Value)

	/* 큐에서 원소 꺼내기 */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("큐에서 꺼낸 원소 pop = ", pop.Value, ", 큐에서 꺼낸 후 queue = ")
	PrintList(queue)

	/* 큐의 길이 반환 */
	size := queue.Len()
	fmt.Println("큐 길이 size =", size)

	/* 큐가 비어 있는지 판단 */
	isEmpty := queue.Len() == 0
	fmt.Println("큐가 비어 있는가 =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// 큐를 초기화하고 큐의 공통 인터페이스를 사용한다
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("기대값:%v,실제값:%v", nil, queue.pop())
	}

	// 큐에 원소 삽입
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("큐 queue = ")
	PrintSlice(queue.toSlice())

	// 맨 앞 원소 접근
	peek := queue.peek()
	fmt.Println("맨 앞 원소 peek =", peek)

	// 큐에서 원소 꺼내기
	pop := queue.pop()
	fmt.Print("큐에서 꺼낸 원소 pop = ", pop, ", 꺼낸 뒤 queue = ")
	PrintSlice(queue.toSlice())

	// 큐의 길이 반환
	size := queue.size()
	fmt.Println("큐 길이 size =", size)

	// 비어 있는지 판단
	isEmpty := queue.isEmpty()
	fmt.Println("큐가 비어 있는가 =", isEmpty)

	/* 원형 배열 테스트 */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("반복", i, "회에서 삽입 + 꺼내기를 수행한 후 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// 큐 초기화
	queue := newLinkedListQueue()

	// 큐에 원소 삽입
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("큐 queue = ")
	PrintList(queue.toList())

	// 맨 앞 원소 접근
	peek := queue.peek()
	fmt.Println("맨 앞 원소 peek =", peek)

	// 큐에서 원소 꺼내기
	pop := queue.pop()
	fmt.Print("큐에서 꺼낸 원소 pop = ", pop, ", 꺼낸 뒤 queue = ")
	PrintList(queue.toList())

	// 큐의 길이 반환
	size := queue.size()
	fmt.Println("큐 길이 size =", size)

	// 비어 있는지 판단
	isEmpty := queue.isEmpty()
	fmt.Println("큐가 비어 있는가 =", isEmpty)
}

// BenchmarkArrayQueue: Mac M1 Pro에서 8 ns/op
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// b.N을 반복 횟수로 사용한다
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// BenchmarkLinkedQueue: Mac M1 Pro에서 62.66 ns/op
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// b.N을 반복 횟수로 사용한다
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
