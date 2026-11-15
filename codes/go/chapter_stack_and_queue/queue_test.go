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
	// [region]{init_queue}
	/* 初始化队列 */
	// 在 Go 中，将 list 作为队列来使用
	queue := list.New()
	// [endregion]{init_queue}

	// [region]{push}
	/* 元素入队 */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	// [endregion]{push}
	fmt.Print("队列 queue = ")
	PrintList(queue)

	// [region]{peek}
	/* 访问队首元素 */
	peek := queue.Front()
	// [endregion]{peek}
	fmt.Println("队首元素 peek =", peek.Value)

	// [region]{pop}
	/* 元素出队 */
	pop := queue.Front()
	queue.Remove(pop)
	// [endregion]{pop}
	fmt.Print("出队元素 pop = ", pop.Value, "，出队后 queue = ")
	PrintList(queue)

	// [region]{size}
	/* 获取队列的长度 */
	size := queue.Len()
	// [endregion]{size}
	fmt.Println("队列长度 size =", size)

	// [region]{is_empty}
	/* 判断队列是否为空 */
	isEmpty := queue.Len() == 0
	// [endregion]{is_empty}
	fmt.Println("队列是否为空 =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// 初始化队列，使用队列的通用接口
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// 元素入队
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("队列 queue = ")
	PrintSlice(queue.toSlice())

	// 访问队首元素
	peek := queue.peek()
	fmt.Println("队首元素 peek =", peek)

	// 元素出队
	pop := queue.pop()
	fmt.Print("出队元素 pop = ", pop, ", 出队后 queue = ")
	PrintSlice(queue.toSlice())

	// 获取队的长度
	size := queue.size()
	fmt.Println("队的长度 size =", size)

	// 判断是否为空
	isEmpty := queue.isEmpty()
	fmt.Println("队是否为空 =", isEmpty)

	/* 测试环形数组 */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第", i, "轮入队 + 出队后 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// 初始化队
	queue := newLinkedListQueue()

	// 元素入队
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("队列 queue = ")
	PrintList(queue.toList())

	// 访问队首元素
	peek := queue.peek()
	fmt.Println("队首元素 peek =", peek)

	// 元素出队
	pop := queue.pop()
	fmt.Print("出队元素 pop = ", pop, ", 出队后 queue = ")
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
	queue := newArrayQueue(capacity)
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// BenchmarkLinkedQueue 62.66 ns/op in Mac M1 Pro
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
