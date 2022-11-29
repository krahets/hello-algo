// File: deque_test.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "testing"

func TestLinkedListDeque(t *testing.T) {
	// 初始化队列
	var deque Deque
	deque = NewLinkedListDeque()

	// 元素入队
	deque.OfferLast(2)
	deque.OfferLast(5)
	deque.OfferLast(4)
	deque.OfferFirst(3)
	deque.OfferFirst(1)
	t.Log("队列 deque = ", deque.toString())

	// 访问队首元素
	peekFirst := deque.PeekFirst()
	t.Log("队首元素 peek = ", peekFirst)
	peekLast := deque.PeekLast()
	t.Log("队尾元素 peek = ", peekLast)

	// 元素出队
	pollFirst := deque.PollFirst()
	t.Log("队首出队元素 pollFirst = ", pollFirst, "，队首出队后 deque = ", deque.toString())
	pollLast := deque.PollLast()
	t.Log("队尾出队元素 pollLast  = ", pollLast, "，队尾出队后 deque = ", deque.toString())

	// 获取队的长度
	size := deque.Size()
	t.Log("队的长度 size = ", size)

	// 判断是否为空
	isEmpty := deque.IsEmpty()
	t.Log("队是否为空 = ", isEmpty)
}

// BenchmarkArrayQueue 67.92 ns/op in Mac M1 Pro
func BenchmarkLinkedListDeque(b *testing.B) {
	stack := NewLinkedListDeque()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.OfferLast(777)
	}
	for i := 0; i < b.N; i++ {
		stack.PollFirst()
	}
}
