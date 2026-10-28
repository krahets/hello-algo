// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push: heap.Interface의 메서드로, 힙에 원소를 삽입한다
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop: heap.Interface의 메서드로, 힙의 루트 원소를 꺼낸다
func (h *minHeap) Pop() any {
	// 꺼낼 원소는 맨 마지막에 저장되어 있다
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top: 힙의 루트 원소를 반환한다
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
func topKHeap(nums []int, k int) *minHeap {
	// 최소 힙 초기화
	h := &minHeap{}
	heap.Init(h)
	// 배열의 앞쪽 k개 원소를 힙에 삽입한다
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// k+1번째 원소부터 힙의 길이를 k로 유지한다
	for i := k; i < len(nums); i++ {
		// 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
