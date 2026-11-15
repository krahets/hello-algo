// File: heap_test.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"container/heap"
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func testPush(h *intHeap, val int) {
	// heap.Interface の関数を呼び出し、要素を追加する
	heap.Push(h, val)
	fmt.Printf("\n要素 %d をヒープに挿入した後 \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// heap.Interface の関数を呼び出し、要素を取り除く
	val := heap.Pop(h)
	fmt.Printf("\nヒープの先頭要素 %d を取り出した後 \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* ヒープを初期化する */
	// 最大ヒープを初期化する
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* ヒープに要素を挿入する */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* ヒープの先頭要素を取得する */
	top := maxHeap.Top()
	fmt.Printf("ヒープの先頭要素は %d\n", top)

	/* ヒープの先頭要素を取り出す */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* ヒープのサイズを取得する */
	size := len(*maxHeap)
	fmt.Printf("ヒープの要素数は %d\n", size)

	/* ヒープが空か判定 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("ヒープは空か %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* ヒープを初期化する */
	// 最大ヒープを初期化する
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("配列を入力してヒープを構築した後\n")
	maxHeap.print()

	/* ヒープの先頭要素を取得する */
	peek := maxHeap.peek()
	fmt.Printf("\nヒープの先頭要素は %d\n", peek)

	/* ヒープに要素を挿入する */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n要素 %d をヒープに挿入した後\n", val)
	maxHeap.print()

	/* ヒープの先頭要素を取り出す */
	peek = maxHeap.pop()
	fmt.Printf("\nヒープの先頭要素 %d を取り出した後\n", peek)
	maxHeap.print()

	/* ヒープのサイズを取得する */
	size := maxHeap.size()
	fmt.Printf("\nヒープの要素数は %d\n", size)

	/* ヒープが空か判定 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nヒープは空か %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* ヒープを初期化する */
	// 最大ヒープを初期化する
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("大きいほうから " + strconv.Itoa(k) + " 個の要素は")
	PrintHeap(*res)
}
