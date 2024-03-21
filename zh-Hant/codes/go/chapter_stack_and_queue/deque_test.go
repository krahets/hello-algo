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
	/* 初始化雙向佇列 */
	// 在 Go 中，將 list 作為雙向佇列使用
	deque := list.New()

	/* 元素入列 */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("雙向佇列 deque = ")
	PrintList(deque)

	/* 訪問元素 */
	front := deque.Front()
	fmt.Println("佇列首元素 front =", front.Value)
	rear := deque.Back()
	fmt.Println("佇列尾元素 rear =", rear.Value)

	/* 元素出列 */
	deque.Remove(front)
	fmt.Print("佇列首出列元素 front = ", front.Value, "，佇列首出列後 deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("佇列尾出列元素 rear = ", rear.Value, "，佇列尾出列後 deque = ")
	PrintList(deque)

	/* 獲取雙向佇列的長度 */
	size := deque.Len()
	fmt.Println("雙向佇列長度 size =", size)

	/* 判斷雙向佇列是否為空 */
	isEmpty := deque.Len() == 0
	fmt.Println("雙向佇列是否為空 =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 初始化雙向佇列 */
	// 在 Go 中，將 list 作為雙向佇列使用
	deque := newArrayDeque(16)

	/* 元素入列 */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("雙向佇列 deque = ")
	PrintSlice(deque.toSlice())

	/* 訪問元素 */
	peekFirst := deque.peekFirst()
	fmt.Println("佇列首元素 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("佇列尾元素 peekLast =", peekLast)

	/* 元素入列 */
	deque.pushLast(4)
	fmt.Print("元素 4 佇列尾入列後 deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("元素 1 佇列首入列後 deque = ")
	PrintSlice(deque.toSlice())

	/* 元素出列 */
	popFirst := deque.popFirst()
	fmt.Print("佇列首出列元素 popFirst = ", popFirst, "，佇列首出列後 deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("佇列尾出列元素 popLast = ", popLast, "，佇列尾出列後 deque = ")
	PrintSlice(deque.toSlice())

	/* 獲取雙向佇列的長度 */
	size := deque.size()
	fmt.Println("雙向佇列長度 size =", size)

	/* 判斷雙向佇列是否為空 */
	isEmpty := deque.isEmpty()
	fmt.Println("雙向佇列是否為空 =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// 初始化佇列
	deque := newLinkedListDeque()

	// 元素入列
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("佇列 deque = ")
	PrintList(deque.toList())

	// 訪問佇列首元素
	front := deque.peekFirst()
	fmt.Println("佇列首元素 front =", front)
	rear := deque.peekLast()
	fmt.Println("佇列尾元素 rear =", rear)

	// 元素出列
	popFirst := deque.popFirst()
	fmt.Print("佇列首出列元素 popFirst = ", popFirst, "，佇列首出列後 deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("佇列尾出列元素 popLast = ", popLast, "，佇列尾出列後 deque = ")
	PrintList(deque.toList())

	// 獲取隊的長度
	size := deque.size()
	fmt.Println("隊的長度 size =", size)

	// 判斷是否為空
	isEmpty := deque.isEmpty()
	fmt.Println("隊是否為空 =", isEmpty)
}

// BenchmarkLinkedListDeque 67.92 ns/op in Mac M1 Pro
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
