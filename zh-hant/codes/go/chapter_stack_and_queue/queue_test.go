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
	// 在 Go 中，可用 list 套件的鏈結串列當作佇列
	queue := list.New()

	/* 將元素加入佇列 */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("佇列 queue = ")
	PrintList(queue)

	/* 取得隊首節點 */
	peek := queue.Front()
	fmt.Println("隊首元素 peek =", peek.Value)

	/* 從佇列取出元素 */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("出隊元素 pop = ", pop.Value, "，出隊後 queue = ")
	PrintList(queue)

	/* 取得佇列長度 */
	size := queue.Len()
	fmt.Println("佇列長度 size =", size)

	/* 判斷佇列是否為空 */
	isEmpty := queue.Len() == 0
	fmt.Println("佇列是否為空 =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// 使用佇列的共用介面初始化佇列
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// 將元素加入佇列
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("佇列 queue = ")
	PrintSlice(queue.toSlice())

	// 讀取隊首元素
	peek := queue.peek()
	fmt.Println("隊首元素 peek =", peek)

	// 從佇列取出元素
	pop := queue.pop()
	fmt.Print("出隊元素 pop = ", pop, "， 出隊後 queue = ")
	PrintSlice(queue.toSlice())

	// 取得佇列長度
	size := queue.size()
	fmt.Println("佇列長度 size =", size)

	// 判斷佇列是否為空
	isEmpty := queue.isEmpty()
	fmt.Println("佇列是否為空 =", isEmpty)

	/* 測試環狀陣列 */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第 ", i, " 輪入隊 + 出隊後 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// 初始化佇列
	queue := newLinkedListQueue()

	// 將元素加入佇列
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("佇列 queue = ")
	PrintList(queue.toList())

	// 讀取隊首元素
	peek := queue.peek()
	fmt.Println("隊首元素 peek =", peek)

	// 從佇列取出元素
	pop := queue.pop()
	fmt.Print("出隊元素 pop = ", pop, "， 出隊後 queue = ")
	PrintList(queue.toList())

	// 取得佇列長度
	size := queue.size()
	fmt.Println("佇列長度 size =", size)

	// 判斷佇列是否為空
	isEmpty := queue.isEmpty()
	fmt.Println("佇列是否為空 =", isEmpty)
}

// BenchmarkArrayQueue 在配備 M1 Pro 的 Mac 上測得 8 ns/op
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// 以 b.N 作為迴圈次數
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// BenchmarkLinkedQueue 在配備 M1 Pro 的 Mac 上測得 62.66 ns/op
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// 以 b.N 作為迴圈次數
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
