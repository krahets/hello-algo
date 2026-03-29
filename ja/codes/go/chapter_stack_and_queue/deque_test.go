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
	/* 両端キューを初期化 */
	// Go では、list を両端キューとして使う
	deque := list.New()

	/* 要素をエンキュー */
	deque.PushBack(2)
	deque.PushBack(5)
	deque.PushBack(4)
	deque.PushFront(3)
	deque.PushFront(1)
	fmt.Print("両端キュー deque = ")
	PrintList(deque)

	/* 要素にアクセス */
	front := deque.Front()
	fmt.Println("先頭要素 front =", front.Value)
	rear := deque.Back()
	fmt.Println("末尾要素 rear =", rear.Value)

	/* 要素をデキュー */
	deque.Remove(front)
	fmt.Print("先頭から取り出した要素 front = ", front.Value, "、取り出し後の deque = ")
	PrintList(deque)
	deque.Remove(rear)
	fmt.Print("末尾から取り出した要素 rear = ", rear.Value, "、取り出し後の deque = ")
	PrintList(deque)

	/* 両端キューの長さを取得 */
	size := deque.Len()
	fmt.Println("両端キューの長さ size =", size)

	/* 両端キューが空かどうかを判定 */
	isEmpty := deque.Len() == 0
	fmt.Println("両端キューが空か =", isEmpty)
}

func TestArrayDeque(t *testing.T) {
	/* 両端キューを初期化 */
	// Go では、list を両端キューとして使う
	deque := newArrayDeque(16)

	/* 要素をエンキュー */
	deque.pushLast(3)
	deque.pushLast(2)
	deque.pushLast(5)
	fmt.Print("両端キュー deque = ")
	PrintSlice(deque.toSlice())

	/* 要素にアクセス */
	peekFirst := deque.peekFirst()
	fmt.Println("先頭要素 peekFirst =", peekFirst)
	peekLast := deque.peekLast()
	fmt.Println("末尾要素 peekLast =", peekLast)

	/* 要素をエンキュー */
	deque.pushLast(4)
	fmt.Print("要素 4 を末尾に追加した後 deque = ")
	PrintSlice(deque.toSlice())
	deque.pushFirst(1)
	fmt.Print("要素 1 を先頭に追加した後 deque = ")
	PrintSlice(deque.toSlice())

	/* 要素をデキュー */
	popFirst := deque.popFirst()
	fmt.Print("先頭から取り出した要素 popFirst = ", popFirst, "、取り出し後の deque = ")
	PrintSlice(deque.toSlice())
	popLast := deque.popLast()
	fmt.Print("末尾から取り出した要素 popLast = ", popLast, "、取り出し後の deque = ")
	PrintSlice(deque.toSlice())

	/* 両端キューの長さを取得 */
	size := deque.size()
	fmt.Println("両端キューの長さ size =", size)

	/* 両端キューが空かどうかを判定 */
	isEmpty := deque.isEmpty()
	fmt.Println("両端キューが空か =", isEmpty)
}

func TestLinkedListDeque(t *testing.T) {
	// キューを初期化
	deque := newLinkedListDeque()

	// 要素をエンキュー
	deque.pushLast(2)
	deque.pushLast(5)
	deque.pushLast(4)
	deque.pushFirst(3)
	deque.pushFirst(1)
	fmt.Print("キュー deque = ")
	PrintList(deque.toList())

	// キュー先頭の要素にアクセス
	front := deque.peekFirst()
	fmt.Println("先頭要素 front =", front)
	rear := deque.peekLast()
	fmt.Println("末尾要素 rear =", rear)

	// 要素をデキュー
	popFirst := deque.popFirst()
	fmt.Print("先頭から取り出した要素 popFirst = ", popFirst, "、取り出し後の deque = ")
	PrintList(deque.toList())
	popLast := deque.popLast()
	fmt.Print("末尾から取り出した要素 popLast = ", popLast, "、取り出し後の deque = ")
	PrintList(deque.toList())

	// キューの長さを取得
	size := deque.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定
	isEmpty := deque.isEmpty()
	fmt.Println("キューが空か =", isEmpty)
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
