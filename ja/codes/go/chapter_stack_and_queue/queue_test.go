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
	/* キューを初期化する */
	// Go では list をキューとして使う
	queue := list.New()

	/* 要素をエンキューする */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("キュー queue = ")
	PrintList(queue)

	/* キューの先頭要素にアクセス */
	peek := queue.Front()
	fmt.Println("キューの先頭要素 peek =", peek.Value)

	/* 要素をデキューする */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("デキューした要素 pop = ", pop.Value, "、デキュー後 queue = ")
	PrintList(queue)

	/* キューの長さを取得 */
	size := queue.Len()
	fmt.Println("キューの長さ size =", size)

	/* キューが空か判定 */
	isEmpty := queue.Len() == 0
	fmt.Println("キューは空か =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// キュー共通のインターフェースを使ってキューを初期化する
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("期待値:%v,実際の値:%v", nil, queue.pop())
	}

	// 要素をエンキューする
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintSlice(queue.toSlice())

	// キューの先頭要素にアクセス
	peek := queue.peek()
	fmt.Println("キューの先頭要素 peek =", peek)

	// 要素をデキューする
	pop := queue.pop()
	fmt.Print("デキューした要素 pop = ", pop, ", デキュー後 queue = ")
	PrintSlice(queue.toSlice())

	// キューの長さを取得する
	size := queue.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定する
	isEmpty := queue.isEmpty()
	fmt.Println("キューは空か =", isEmpty)

	/* 循環配列をテストする */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第", i, "回のエンキューとデキューの後 queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// キューを初期化する
	queue := newLinkedListQueue()

	// 要素をエンキューする
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintList(queue.toList())

	// キューの先頭要素にアクセス
	peek := queue.peek()
	fmt.Println("キューの先頭要素 peek =", peek)

	// 要素をデキューする
	pop := queue.pop()
	fmt.Print("デキューした要素 pop = ", pop, ", デキュー後 queue = ")
	PrintList(queue.toList())

	// キューの長さを取得する
	size := queue.size()
	fmt.Println("キューの長さ size =", size)

	// 空かどうかを判定する
	isEmpty := queue.isEmpty()
	fmt.Println("キューは空か =", isEmpty)
}

// Mac M1 Pro での BenchmarkArrayQueue は 8 ns/op
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// ループには b.N を使う
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// Mac M1 Pro での BenchmarkLinkedQueue は 62.66 ns/op
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// ループには b.N を使う
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
