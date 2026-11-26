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

	/* 要素をキューに追加する */
	queue.PushBack(1)
	queue.PushBack(3)
	queue.PushBack(2)
	queue.PushBack(5)
	queue.PushBack(4)
	fmt.Print("キュー queue = ")
	PrintList(queue)

	/* キューの先頭要素を参照する */
	peek := queue.Front()
	fmt.Println("先頭要素 peek =", peek.Value)

	/* キューから要素を取り出す */
	pop := queue.Front()
	queue.Remove(pop)
	fmt.Print("デキューした要素 pop = ", pop.Value, "、デキュー後の queue = ")
	PrintList(queue)

	/* キューの要素数を取得する */
	size := queue.Len()
	fmt.Println("キューの要素数 size =", size)

	/* キューが空かどうかを判定する */
	isEmpty := queue.Len() == 0
	fmt.Println("キューは空か =", isEmpty)
}

func TestArrayQueue(t *testing.T) {

	// キューを初期化し、共通のインターフェースを使って操作する
	capacity := 10
	queue := newArrayQueue(capacity)
	if queue.pop() != nil {
		t.Errorf("want:%v,got:%v", nil, queue.pop())
	}

	// 要素をキューに追加する
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintSlice(queue.toSlice())

	// キューの先頭要素を参照する
	peek := queue.peek()
	fmt.Println("先頭要素 peek =", peek)

	// キューから要素を取り出す
	pop := queue.pop()
	fmt.Print("デキューした要素 pop = ", pop, "、 デキュー後の queue = ")
	PrintSlice(queue.toSlice())

	// キューの要素数を取得する
	size := queue.size()
	fmt.Println("キューの要素数 size =", size)

	// 空かどうかを判定する
	isEmpty := queue.isEmpty()
	fmt.Println("キューは空か =", isEmpty)

	/* 循環配列の動作を確認する */
	for i := 0; i < 10; i++ {
		queue.push(i)
		queue.pop()
		fmt.Print("第 ", i, " 回のエンキューとデキューを終えた後の queue =")
		PrintSlice(queue.toSlice())
	}
}

func TestLinkedListQueue(t *testing.T) {
	// キューを初期化する
	queue := newLinkedListQueue()

	// 要素をキューに追加する
	queue.push(1)
	queue.push(3)
	queue.push(2)
	queue.push(5)
	queue.push(4)
	fmt.Print("キュー queue = ")
	PrintList(queue.toList())

	// キューの先頭要素を参照する
	peek := queue.peek()
	fmt.Println("先頭要素 peek =", peek)

	// キューから要素を取り出す
	pop := queue.pop()
	fmt.Print("デキューした要素 pop = ", pop, "、 デキュー後の queue = ")
	PrintList(queue.toList())

	// キューの要素数を取得する
	size := queue.size()
	fmt.Println("キューの要素数 size =", size)

	// 空かどうかを判定する
	isEmpty := queue.isEmpty()
	fmt.Println("キューは空か =", isEmpty)
}

// M1 Pro 搭載の Mac での BenchmarkArrayQueue の測定値は 8 ns/op
func BenchmarkArrayQueue(b *testing.B) {
	capacity := 1000
	queue := newArrayQueue(capacity)
	// b.N 回繰り返す
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}

// M1 Pro 搭載の Mac での BenchmarkLinkedQueue の測定値は 62.66 ns/op
func BenchmarkLinkedQueue(b *testing.B) {
	queue := newLinkedListQueue()
	// b.N 回繰り返す
	for i := 0; i < b.N; i++ {
		queue.push(777)
	}
	for i := 0; i < b.N; i++ {
		queue.pop()
	}
}
