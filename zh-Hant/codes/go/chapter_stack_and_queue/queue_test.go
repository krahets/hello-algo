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
	/* 初始化佇列 */
	// 在 Go 中，將 list 作為佇列來使用
	queue := list.New()

	/* 元素入列 */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("佇列 queue = ")
	PrintList(queue)

	/* 訪問佇列首元素 */
	peek := queue.Front()
	fmt.Println("佇列首元素 peek =", peek.Value)

	/* 元素出列 */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("出列元素 pop = ", pop.Value, "，出列後 queue = ")
	PrintList(queue)

	/* 獲取佇列的長度 */
	size := queue.Len()
	fmt.Println("佇列長度 size =", size)

	/* 判斷佇列是否為空 */
	isEmpty := queue.Len() == 0
	fmt.Println("佇列是否為空 =", isEmpty)
}

func TestArrayQueue(t *testing.T) {
	// 初始化佇列，使用佇列的通用介面
	capacity := 10
	queue := newArrayQueue(capacity)

	// 元素入列
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("佇列 queue = ")
	PrintSlice(queue.toSlice())

	// 訪問佇列首元素
	peek := queue.peek()
	fmt.Println("佇列首元素 peek =", peek)

	// 元素出列
	pop := queue.pop()
	fmt.Print("出列元素 pop = ", pop, ", 出列後 queue = ")
	PrintSlice(queue.toSlice())

	// 獲取隊的長度
	size := queue.size()
	fmt.Println("隊的長度 size =", size)

	// 判斷是否為空
	isEmpty := queue.isEmpty()
	fmt.Println("隊是否為空 =", isEmpty)

	/* 測試環形陣列 */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第", i, "輪入列 + 出列後 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// 初始化隊
	queue := newLinkedListQueue()

	// 元素入列
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("佇列 queue = ")
	PrintList(queue.toList())

	// 訪問佇列首元素
	peek := queue.peek()
	fmt.Println("佇列首元素 peek =", peek)

	// 元素出列
	pop := queue.pop()
	fmt.Print("出列元素 pop = ", pop, ", 出列後 queue = ")
	PrintList(queue.toList())

	// 獲取隊的長度
	size := queue.size()
	fmt.Println("隊的長度 size =", size)

	// 判斷是否為空
	isEmpty := queue.isEmpty()
	fmt.Println("隊是否為空 =", isEmpty)
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
