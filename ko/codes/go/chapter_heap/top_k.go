// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push는 힙에 원소를 삽입하는 heap.Interface 메서드
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop은 슬라이스의 마지막 원소를 꺼내는 heap.Interface 메서드(heap.Pop이 이미 루트를 마지막 자리로 옮김)
func (h *minHeap) Pop() any {
	// 꺼낼 원소는 맨 끝에 위치
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top은 힙의 루트 원소를 조회
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
func topKHeap(nums []int, k int) *minHeap {
	// 최소 힙 초기화
	h := &minHeap{}
	heap.Init(h)
	// 배열의 처음 k개 원소를 힙에 삽입
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// k+1번째 원소부터 힙의 크기를 k로 유지
	for i := k; i < len(nums); i++ {
		// 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
