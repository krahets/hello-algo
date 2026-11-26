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
	// 呼叫 heap.Interface 的方法以加入元素
	heap.Push(h, val)
	fmt.Printf("\n將元素 %d 加入堆積後 \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// 呼叫 heap.Interface 的方法以移除元素
	val := heap.Pop(h)
	fmt.Printf("\n取出堆積頂端元素 %d 後 \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* 初始化堆積 */
	// 初始化最大堆積
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 將元素加入堆積 */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* 取得堆積頂端元素 */
	top := maxHeap.Top()
	fmt.Printf("堆積頂端元素為 %d\n", top)

	/* 取出堆積頂端元素 */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* 取得堆積大小 */
	size := len(*maxHeap)
	fmt.Printf("堆積中的元素個數為 %d\n", size)

	/* 判斷堆積是否為空 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("堆積是否為空 %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* 初始化堆積 */
	// 初始化最大堆積
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("用輸入陣列建立堆積後\n")
	maxHeap.print()

	/* 取得堆積頂端元素 */
	peek := maxHeap.peek()
	fmt.Printf("\n堆積頂端元素為 %d\n", peek)

	/* 將元素加入堆積 */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n將元素 %d 加入堆積後\n", val)
	maxHeap.print()

	/* 取出堆積頂端元素 */
	peek = maxHeap.pop()
	fmt.Printf("\n取出堆積頂端元素 %d 後\n", peek)
	maxHeap.print()

	/* 取得堆積大小 */
	size := maxHeap.size()
	fmt.Printf("\n堆積中的元素個數為 %d\n", size)

	/* 判斷堆積是否為空 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\n堆積是否為空 %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("最大的 " + strconv.Itoa(k) + " 個元素為")
	PrintHeap(*res)
}
