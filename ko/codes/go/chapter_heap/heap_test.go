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
	// heap.Interface의 함수를 호출하여 원소를 추가한다
	heap.Push(h, val)
	fmt.Printf("\n원소 %d 삽입 후의 힙\n", val)
	PrintHeap(*h)
}

func testPop(h *intHeap) {
	// heap.Interface의 함수를 호출하여 원소를 제거한다
	val := heap.Pop(h)
	fmt.Printf("\n루트 원소 %d 삭제 후의 힙\n", val)
	PrintHeap(*h)
}

func TestHeap(t *testing.T) {
	/* 힙 초기화 */
	// 최대 힙 초기화
	maxHeap := &intHeap{}
	heap.Init(maxHeap)
	/* 힙에 원소 삽입 */
	testPush(maxHeap, 1)
	testPush(maxHeap, 3)
	testPush(maxHeap, 2)
	testPush(maxHeap, 5)
	testPush(maxHeap, 4)

	/* 힙의 루트 원소 반환 */
	top := maxHeap.Top()
	fmt.Printf("힙의 루트 원소: %d\n", top)

	/* 힙의 루트 원소 꺼내기 */
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)
	testPop(maxHeap)

	/* 힙 크기 반환 */
	size := len(*maxHeap)
	fmt.Printf("힙의 원소 개수: %d\n", size)

	/* 힙이 비어 있는지 판단 */
	isEmpty := len(*maxHeap) == 0
	fmt.Printf("힙이 비어 있는가: %t\n", isEmpty)
}

func TestMyHeap(t *testing.T) {
	/* 힙 초기화 */
	// 최대 힙 초기화
	maxHeap := newMaxHeap([]any{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2})
	fmt.Printf("배열을 입력하여 힙을 구성한 후\n")
	maxHeap.print()

	/* 힙의 루트 원소 반환 */
	peek := maxHeap.peek()
	fmt.Printf("\n힙의 루트 원소: %d\n", peek)

	/* 힙에 원소 삽입 */
	val := 7
	maxHeap.push(val)
	fmt.Printf("\n원소를 힙에 삽입한 후(원소: %d)\n", val)
	maxHeap.print()

	/* 힙의 루트 원소 꺼내기 */
	peek = maxHeap.pop()
	fmt.Printf("\n힙의 루트 원소를 꺼낸 후(원소: %d)\n", peek)
	maxHeap.print()

	/* 힙 크기 반환 */
	size := maxHeap.size()
	fmt.Printf("\n힙의 원소 개수: %d\n", size)

	/* 힙이 비어 있는지 판단 */
	isEmpty := maxHeap.isEmpty()
	fmt.Printf("\n힙이 비어 있는가: %t\n", isEmpty)
}

func TestTopKHeap(t *testing.T) {
	/* 힙 초기화 */
	// 최대 힙 초기화
	nums := []int{1, 7, 6, 3, 2}
	k := 3
	res := topKHeap(nums, k)
	fmt.Printf("가장 큰 " + strconv.Itoa(k) + " 개 원소:")
	PrintHeap(*res)
}
