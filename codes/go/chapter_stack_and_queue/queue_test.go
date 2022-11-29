// File: queue_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "testing"

func TestArrayQueue(t *testing.T) {

	// 初始化队列，使用队列的通用接口
	var queue Queue
	capacity := 10
	queue = NewArrayQueue(capacity)

	// 元素入队
	queue.Offer(1)
	queue.Offer(2)
	queue.Offer(3)
	queue.Offer(4)
	queue.Offer(5)
	t.Log("队列 queue = ", queue.toString())

	// 访问队首元素
	peek := queue.Peek()
	t.Log("队首元素 peek = ", peek)

	// 元素出队
	pop := queue.Poll()
	t.Log("出队元素 pop  = ", pop, ", 出队后 queue =", queue.toString())

	// 获取队的长度
	size := queue.Size()
	t.Log("队的长度 size = ", size)

	// 判断是否为空
	isEmpty := queue.IsEmpty()
	t.Log("队是否为空 = ", isEmpty)
}

func TestLinkedListQueue(t *testing.T) {
	// 初始化队
	var queue Queue
	queue = NewLinkedListQueue()

	// 元素入队
	queue.Offer(1)
	queue.Offer(2)
	queue.Offer(3)
	queue.Offer(4)
	queue.Offer(5)
	t.Log("队列 queue = ", queue.toString())

	// 访问队首元素
	peek := queue.Peek()
	t.Log("队首元素 peek = ", peek)

	// 元素出队
	pop := queue.Poll()
	t.Log("出队元素 pop  = ", pop, ", 出队后 queue =", queue.toString())

	// 获取队的长度
	size := queue.Size()
	t.Log("队的长度 size = ", size)

	// 判断是否为空
	isEmpty := queue.IsEmpty()
	t.Log("队是否为空 = ", isEmpty)
}

// BenchmarkArrayQueue 8 ns/op in Mac M1 Pro
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	stack := NewArrayQueue(capacity)
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.Offer(777)
	}
	for i := 0; i < b.N; i++ {
		stack.Poll()
	}
}

// BenchmarkLinkedQueue 62.66 ns/op in Mac M1 Pro
func BenchmarkLinkedQueue(b *testing.B) {
	stack := NewLinkedListQueue()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.Offer(777)
	}
	for i := 0; i < b.N; i++ {
		stack.Poll()
	}
}
