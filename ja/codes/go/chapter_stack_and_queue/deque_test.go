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

	/* 要素をエンキューする */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("両端キュー deque = ")
	PrintList(deque)

	/* 要素にアクセスする */
	front := deque.Front()
	fmt.Println("キューの先頭要素 front =", front.Value)
	rear := deque.Back()
	fmt.Println("キューの末尾要素 rear =", rear.Value)

	/* 要素をデキューする */
	deque.Remove(front)
	fmt.Print("先頭からデキューした要素 front = ", front.Value, "、先頭からデキューした後 deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("末尾からデキューした要素 rear = ", rear.Value, "、末尾からデキューした後 deque = ")
	PrintList(deque)

	/* 両端キューの長さを取得する */
	size := deque.Len()
	fmt.Println("両端キューの長さ size =", size)

	/* 両端キューが空かどうかを判定する */
	isEmpty := deque.Len() == 0
	fmt.Println("両端キューは空か =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 両端キューを初期化する */
	// Go では list を両端キューとして使う
	deque := newArrayDeque(16)

	/* 要素をエンキューする */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("両端キュー deque = ")
	PrintSlice(deque.toSlice())

	/* 要素にアクセスする */
	peekFirst := deque.peekFirst()
	fmt.Println("キューの先頭要素 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("キューの末尾要素 peekLast =", peekLast)

	/* 要素をエンキューする */
	deque.pushLast(4)
	fmt.Print("要素 4 を末尾にエンキューした後 deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("要素 1 を先頭にエンキューした後 deque = ")
	PrintSlice(deque.toSlice())

	/* 要素をデキューする */
	popFirst := deque.popFirst()
	fmt.Print("先頭からデキューした要素 popFirst = ", popFirst, "、先頭からデキューした後 deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("末尾からデキューした要素 popLast = ", popLast, "、末尾からデキューした後 deque = ")
	PrintSlice(deque.toSlice())

	/* 両端キューの長さを取得する */
	size := deque.size()
	fmt.Println("両端キューの長さ size =", size)

	/* 両端キューが空かどうかを判定する */
	isEmpty := deque.isEmpty()
	fmt.Println("両端キューは空か =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// キューを初期化する
	deque := newLinkedListDeque()

	// 要素をエンキューする
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("キュー deque = ")
	PrintList(deque.toList())

	// キューの先頭要素にアクセス
	front := deque.peekFirst()
	fmt.Println("キューの先頭要素 front =", front)
	rear := deque.peekLast()
	fmt.Println("キューの末尾要素 rear =", rear)

	// 要素をデキューする
	popFirst := deque.popFirst()
	fmt.Print("先頭からデキューした要素 popFirst = ", popFirst, "、先頭からデキューした後 deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("末尾からデキューした要素 popLast = ", popLast, "、末尾からデキューした後 deque = ")
	PrintList(deque.toList())

	// キューの長さを取得する
	size := deque.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定する
	isEmpty := deque.isEmpty()
	fmt.Println("キューは空か =", isEmpty)
}

// Mac M1 Pro での BenchmarkLinkedListDeque は 67.92 ns/op
func BenchmarkLinkedListDeque(b *testing.B) {
	deque := newLinkedListDeque()
	// ループには b.N を使う
	for i := 0; i < b.N; i++ {
		deque.pushLast(777)
	}
	for i := 0; i < b.N; i++ {
		deque.popFirst()
	}
}
