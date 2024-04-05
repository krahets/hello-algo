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
	// 呼叫 heap.Interface 的函式，來新增元素
	heap.Push(h, val)
	fmt.Printf("\n元素 %d 入堆積後 \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// 呼叫 heap.Interface 的函式，來移除元素
	val := heap.Pop(h)
	fmt.Printf("\n堆積頂元素 %d 出堆積後 \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* 初始化堆積 */
	// 初始化大頂堆積
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 元素入堆積 */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* 獲取堆積頂元素 */
	top := maxHeap.Top()
	fmt.Printf("堆積頂元素為 %d\n", top)

	/* 堆積頂元素出堆積 */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* 獲取堆積大小 */
	size := len(*maxHeap)
	fmt.Printf("堆積元素數量為 %d\n", size)

	/* 判斷堆積是否為空 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("堆積是否為空 %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* 初始化堆積 */
	// 初始化大頂堆積
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("輸入陣列並建堆積後\n")
	maxHeap.print()

	/* 獲取堆積頂元素 */
	peek := maxHeap.peek()
	fmt.Printf("\n堆積頂元素為 %d\n", peek)

	/* 元素入堆積 */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n元素 %d 入堆積後\n", val)
	maxHeap.print()

	/* 堆積頂元素出堆積 */
	peek = maxHeap.pop()
	fmt.Printf("\n堆積頂元素 %d 出堆積後\n", peek)
	maxHeap.print()

	/* 獲取堆積大小 */
	size := maxHeap.size()
	fmt.Printf("\n堆積元素數量為 %d\n", size)

	/* 判斷堆積是否為空 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\n堆積是否為空 %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* 初始化堆積 */
	// 初始化大頂堆積
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("最大的 " + strconv.Itoa(k) + " 個元素為")
	PrintHeap(*res)
}
