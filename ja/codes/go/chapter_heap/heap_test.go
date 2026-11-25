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
	// heap.Interface の関数を呼んで要素を追加する
	heap.Push(h, val)
	fmt.Printf("\n要素 %d の挿入後：\n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// heap.Interface の関数を呼んで要素を削除する
	val := heap.Pop(h)
	fmt.Printf("\n根の要素 %d を取り出した後：\n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* ヒープを初期化する */
	// 最大ヒープを初期化する
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 要素をヒープに挿入する */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* ヒープの根の要素を取得する */
	top := maxHeap.Top()
	fmt.Printf("ヒープの根の要素：%d\n", top)

	/* 根の要素を取り出す */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* ヒープのサイズを取得する */
	size := len(*maxHeap)
	fmt.Printf("ヒープの要素数：%d\n", size)

	/* ヒープが空か判定する */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("ヒープは空か：%t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* ヒープを初期化する */
	// 最大ヒープを初期化する
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("入力配列から構築したヒープ：\n")
	maxHeap.print()

	/* ヒープの根の要素を取得する */
	peek := maxHeap.peek()
	fmt.Printf("\nヒープの根の要素：%d\n", peek)

	/* 要素をヒープに挿入する */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n要素 %d の挿入後：\n", val)
	maxHeap.print()

	/* 根の要素を取り出す */
	peek = maxHeap.pop()
	fmt.Printf("\n根の要素 %d を取り出した後：\n", peek)
	maxHeap.print()

	/* ヒープのサイズを取得する */
	size := maxHeap.size()
	fmt.Printf("\nヒープの要素数：%d\n", size)

	/* ヒープが空か判定する */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\nヒープは空か：%t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("上位 " + strconv.Itoa(k) + " 個の要素：")
	PrintHeap(*res)
}
