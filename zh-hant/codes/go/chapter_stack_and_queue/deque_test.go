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
	/* 初始化雙端佇列 */
	// 在 Go 中，可用 list 套件的鏈結串列當作雙端佇列
	deque := list.New()

	/* 將元素加入雙端佇列 */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("雙端佇列 deque = ")
	PrintList(deque)

	/* 讀取隊首與隊尾元素 */
	front := deque.Front()
	fmt.Println("隊首元素 front =", front.Value)
	rear := deque.Back()
	fmt.Println("隊尾元素 rear =", rear.Value)

	/* 從雙端佇列取出元素 */
	deque.Remove(front)
	fmt.Print("從隊首取出的元素 front = ", front.Value, "，從隊首取出後 deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("從隊尾取出的元素 rear = ", rear.Value, "，從隊尾取出後 deque = ")
	PrintList(deque)

	/* 取得雙端佇列長度 */
	size := deque.Len()
	fmt.Println("雙端佇列長度 size =", size)

	/* 判斷雙端佇列是否為空 */
	isEmpty := deque.Len() == 0
	fmt.Println("雙端佇列是否為空 =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 初始化雙端佇列 */
	deque := newArrayDeque(16)

	/* 將元素加入雙端佇列 */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("雙端佇列 deque = ")
	PrintSlice(deque.toSlice())

	/* 讀取隊首與隊尾元素 */
	peekFirst := deque.peekFirst()
	fmt.Println("隊首元素 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("隊尾元素 peekLast =", peekLast)

	/* 將元素加入雙端佇列 */
	deque.pushLast(4)
	fmt.Print("將元素 4 加到隊尾後 deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("將元素 1 加到隊首後 deque = ")
	PrintSlice(deque.toSlice())

	/* 從雙端佇列取出元素 */
	popFirst := deque.popFirst()
	fmt.Print("從隊首取出的元素 popFirst = ", popFirst, "，從隊首取出後 deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("從隊尾取出的元素 popLast = ", popLast, "，從隊尾取出後 deque = ")
	PrintSlice(deque.toSlice())

	/* 取得雙端佇列長度 */
	size := deque.size()
	fmt.Println("雙端佇列長度 size =", size)

	/* 判斷雙端佇列是否為空 */
	isEmpty := deque.isEmpty()
	fmt.Println("雙端佇列是否為空 =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// 初始化雙端佇列
	deque := newLinkedListDeque()

	// 將元素加入雙端佇列
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("雙端佇列 deque = ")
	PrintList(deque.toList())

	// 讀取隊首元素
	front := deque.peekFirst()
	fmt.Println("隊首元素 front =", front)
	rear := deque.peekLast()
	fmt.Println("隊尾元素 rear =", rear)

	// 從雙端佇列取出元素
	popFirst := deque.popFirst()
	fmt.Print("從隊首取出的元素 popFirst = ", popFirst, "，從隊首取出後 deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("從隊尾取出的元素 popLast = ", popLast, "，從隊尾取出後 deque = ")
	PrintList(deque.toList())

	// 取得雙端佇列長度
	size := deque.size()
	fmt.Println("雙端佇列長度 size =", size)

	// 判斷雙端佇列是否為空
	isEmpty := deque.isEmpty()
	fmt.Println("雙端佇列是否為空 =", isEmpty)
}

// BenchmarkLinkedListDeque 在配備 M1 Pro 的 Mac 上測得 67.92 ns/op
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// 以 b.N 作為迴圈次數
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
