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
	/* キューを初期化 */
	// Go では、list をキューとして使う
	queue := list.New()

	/* 要素をエンキュー */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("キュー queue = ")
	PrintList(queue)

	/* キュー先頭の要素にアクセス */
	peek := queue.Front()
	fmt.Println("先頭要素 peek =", peek.Value)

	/* 要素をデキュー */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("取り出した要素 pop = ", pop.Value, "、取り出し後の queue = ")
	PrintList(queue)

	/* キューの長さを取得 */
	size := queue.Len()
	fmt.Println("キューの長さ size =", size)

	/* キューが空かどうかを判定 */
	isEmpty := queue.Len() == 0
	fmt.Println("キューが空か =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// キューを初期化し、キューの共通インターフェースを使う
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// 要素をエンキュー
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintSlice(queue.toSlice())

	// キュー先頭の要素にアクセス
	peek := queue.peek()
	fmt.Println("先頭要素 peek =", peek)

	// 要素をデキュー
	pop := queue.pop()
	fmt.Print("取り出した要素 pop = ", pop, ", 取り出し後 queue = ")
	PrintSlice(queue.toSlice())

	// キューの長さを取得
	size := queue.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定
	isEmpty := queue.isEmpty()
	fmt.Println("キューが空か =", isEmpty)

	/* 循環配列をテストする */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第", i, "回のエンキュー + デキュー後 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// キューを初期化する
	queue := newLinkedListQueue()

	// 要素をエンキュー
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintList(queue.toList())

	// キュー先頭の要素にアクセス
	peek := queue.peek()
	fmt.Println("先頭要素 peek =", peek)

	// 要素をデキュー
	pop := queue.pop()
	fmt.Print("取り出した要素 pop = ", pop, ", 取り出し後 queue = ")
	PrintList(queue.toList())

	// キューの長さを取得
	size := queue.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定
	isEmpty := queue.isEmpty()
	fmt.Println("キューが空か =", isEmpty)
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
