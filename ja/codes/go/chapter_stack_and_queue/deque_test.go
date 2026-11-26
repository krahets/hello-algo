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
	/* 両端キューを初期化する */
	// Go では list を両端キューとして使う
	deque := list.New()

	/* 要素を両端キューに追加する */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("両端キュー deque = ")
	PrintList(deque)

	/* 要素を参照する */
	front := deque.Front()
	fmt.Println("先頭要素 front =", front.Value)
	rear := deque.Back()
	fmt.Println("末尾要素 rear =", rear.Value)

	/* 両端キューから要素を取り出す */
	deque.Remove(front)
	fmt.Print("先頭から取り出した要素 front = ", front.Value, "、先頭から取り出した後の deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("末尾から取り出した要素 rear = ", rear.Value, "、末尾から取り出した後の deque = ")
	PrintList(deque)

	/* 両端キューの要素数を取得する */
	size := deque.Len()
	fmt.Println("両端キューの要素数 size =", size)

	/* 両端キューが空かどうかを判定する */
	isEmpty := deque.Len() == 0
	fmt.Println("両端キューは空か =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 両端キューを初期化する */
	deque := newArrayDeque(16)

	/* 要素を両端キューに追加する */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("両端キュー deque = ")
	PrintSlice(deque.toSlice())

	/* 要素を参照する */
	peekFirst := deque.peekFirst()
	fmt.Println("先頭要素 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("末尾要素 peekLast =", peekLast)

	/* 要素を両端キューに追加する */
	deque.pushLast(4)
	fmt.Print("末尾に 4 を追加した後の deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("先頭に 1 を追加した後の deque = ")
	PrintSlice(deque.toSlice())

	/* 両端キューから要素を取り出す */
	popFirst := deque.popFirst()
	fmt.Print("先頭から取り出した要素 popFirst = ", popFirst, "、先頭から取り出した後の deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("末尾から取り出した要素 popLast = ", popLast, "、末尾から取り出した後の deque = ")
	PrintSlice(deque.toSlice())

	/* 両端キューの要素数を取得する */
	size := deque.size()
	fmt.Println("両端キューの要素数 size =", size)

	/* 両端キューが空かどうかを判定する */
	isEmpty := deque.isEmpty()
	fmt.Println("両端キューは空か =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// 両端キューを初期化する
	deque := newLinkedListDeque()

	// 要素を両端キューに追加する
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("両端キュー deque = ")
	PrintList(deque.toList())

	// 両端キューの先頭要素を参照する
	front := deque.peekFirst()
	fmt.Println("先頭要素 front =", front)
	rear := deque.peekLast()
	fmt.Println("末尾要素 rear =", rear)

	// 両端キューから要素を取り出す
	popFirst := deque.popFirst()
	fmt.Print("先頭から取り出した要素 popFirst = ", popFirst, "、先頭から取り出した後の deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("末尾から取り出した要素 popLast = ", popLast, "、末尾から取り出した後の deque = ")
	PrintList(deque.toList())

	// 両端キューの要素数を取得する
	size := deque.size()
	fmt.Println("両端キューの要素数 size =", size)

	// 空かどうかを判定する
	isEmpty := deque.isEmpty()
	fmt.Println("両端キューは空か =", isEmpty)
}

// M1 Pro 搭載の Mac での BenchmarkLinkedListDeque の測定値は 67.92 ns/op
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// b.N 回繰り返す
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
