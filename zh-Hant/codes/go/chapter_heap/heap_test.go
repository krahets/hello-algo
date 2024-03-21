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
	// 调用 heap.Interface 的函数，来添加元素
	heap.Push(h, val)
	fmt.Printf("\n元素 %d 入堆后 \n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// 调用 heap.Interface 的函数，来移除元素
	val := heap.Pop(h)
	fmt.Printf("\n堆顶元素 %d 出堆后 \n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* 初始化堆 */
	// 初始化大顶堆
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 元素入堆 */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* 获取堆顶元素 */
	top := maxHeap.Top()
	fmt.Printf("堆顶元素为 %d\n", top)

	/* 堆顶元素出堆 */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* 获取堆大小 */
	size := len(*maxHeap)
	fmt.Printf("堆元素数量为 %d\n", size)

	/* 判断堆是否为空 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("堆是否为空 %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* 初始化堆 */
	// 初始化大顶堆
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("输入数组并建堆后\n")
	maxHeap.print()

	/* 获取堆顶元素 */
	peek := maxHeap.peek()
	fmt.Printf("\n堆顶元素为 %d\n", peek)

	/* 元素入堆 */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n元素 %d 入堆后\n", val)
	maxHeap.print()

	/* 堆顶元素出堆 */
	peek = maxHeap.pop()
	fmt.Printf("\n堆顶元素 %d 出堆后\n", peek)
	maxHeap.print()

	/* 获取堆大小 */
	size := maxHeap.size()
	fmt.Printf("\n堆元素数量为 %d\n", size)

	/* 判断堆是否为空 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\n堆是否为空 %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* 初始化堆 */
	// 初始化大顶堆
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("最大的 " + strconv.Itoa(k) + " 个元素为")
	PrintHeap(*res)
}
