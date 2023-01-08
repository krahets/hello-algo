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
	/* 初始化队列 */
	// 在 Go 中，将 list 作为队列来使用
	queue := list.New()

	/* 元素入队 */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("队列 queue = ")
	PrintList(queue)

	/* 访问队首元素 */
	peek := queue.Front()
	fmt.Println("队首元素 peek =", peek.Value)

	/* 元素出队 */
	poll := queue.Front()
	queue.Remove(poll)
	fmt.Print("出队元素 poll = ", poll.Value, "，出队后 queue = ")
	PrintList(queue)

	/* 获取队列的长度 */
	size := queue.Len()
	fmt.Println("队列长度 size =", size)

	/* 判断队列是否为空 */
	isEmpty := queue.Len() == 0
	fmt.Println("队列是否为空 =", isEmpty)
}

func TestArrayQueue(t *testing.T) {
	// 初始化队列，使用队列的通用接口
	capacity := 10
	queue := newArrayQueue(capacity)

	// 元素入队
	queue.offer(1)
	queue.offer(3)
	queue.offer(2)
	queue.offer(5)
	queue.offer(4)
	fmt.Print("队列 queue = ")
	PrintSlice(queue.toSlice())

	// 访问队首元素
	peek := queue.peek()
	fmt.Println("队首元素 peek =", peek)

	// 元素出队
	poll := queue.poll()
	fmt.Print("出队元素 poll = ", poll, ", 出队后 queue = ")
	PrintSlice(queue.toSlice())

	// 获取队的长度
	size := queue.size()
	fmt.Println("队的长度 size =", size)

	// 判断是否为空
	isEmpty := queue.isEmpty()
	fmt.Println("队是否为空 =", isEmpty)
}

func TestLinkedListQueue(t *testing.T) {
	// 初始化队
	queue := newLinkedListQueue()

	// 元素入队
	queue.offer(1)
	queue.offer(3)
	queue.offer(2)
	queue.offer(5)
	queue.offer(4)
	fmt.Print("队列 queue = ")
	PrintList(queue.toList())

	// 访问队首元素
	peek := queue.peek()
	fmt.Println("队首元素 peek =", peek)

	// 元素出队
	poll := queue.poll()
	fmt.Print("出队元素 poll = ", poll, ", 出队后 queue = ")
	PrintList(queue.toList())

	// 获取队的长度
	size := queue.size()
	fmt.Println("队的长度 size =", size)

	// 判断是否为空
	isEmpty := queue.isEmpty()
	fmt.Println("队是否为空 =", isEmpty)
}

// BenchmarkArrayQueue 8 ns/op in Mac M1 Pro
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	stack := newArrayQueue(capacity)
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.offer(777)
	}
	for i := 0; i < b.N; i++ {
		stack.poll()
	}
}

// BenchmarkLinkedQueue 62.66 ns/op in Mac M1 Pro
func BenchmarkLinkedQueue(b *testing.B) {
	stack := newLinkedListQueue()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.offer(777)
	}
	for i := 0; i < b.N; i++ {
		stack.poll()
	}
}
