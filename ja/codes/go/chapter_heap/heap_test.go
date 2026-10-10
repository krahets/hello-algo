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
	// heap.Interface の関数を呼び出して要素を追加する
	heap.Push(h, val)
	fmt.Printf("\n要素 %d をヒープに追加後 \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// heap.Interface の関数を呼び出して要素を削除する
	val := heap.Pop(h)
	fmt.Printf("\nヒープ先頭要素 %d を取り出した後 \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* ヒープを初期化 */
	// 最大ヒープを初期化
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 要素をヒープに追加 */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* ヒープ頂点の要素を取得 */
	top := maxHeap.Top()
	fmt.Printf("ヒープ先頭要素は %d\n", top)

	/* ヒープ頂点の要素を取り出す */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* ヒープのサイズを取得 */
	size := len(*maxHeap)
	fmt.Printf("ヒープの要素数は %d\n", size)

	/* ヒープが空かどうかを判定 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("ヒープが空か %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* ヒープを初期化 */
	// 最大ヒープを初期化
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("入力配列からヒープを構築した後\n")
	maxHeap.print()

	/* ヒープ頂点の要素を取得 */
	peek := maxHeap.peek()
	fmt.Printf("\nヒープ先頭要素は %d\n", peek)

	/* 要素をヒープに追加 */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n要素 %d をヒープに追加した後\n", val)
	maxHeap.print()

	/* ヒープ頂点の要素を取り出す */
	peek = maxHeap.pop()
	fmt.Printf("\nヒープ先頭要素 %d を取り出した後\n", peek)
	maxHeap.print()

	/* ヒープのサイズを取得 */
	size := maxHeap.size()
	fmt.Printf("\nヒープの要素数は %d\n", size)

	/* ヒープが空かどうかを判定 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nヒープが空か %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* ヒープを初期化 */
	// 最大ヒープを初期化
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("最大の " + strconv.Itoa(k) + " 個の要素は")
	PrintHeap(*res)
}
