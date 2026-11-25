// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push 是 heap.Interface 的方法，負責將元素加入堆積
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop 是 heap.Interface 的方法，取出切片的最後一個元素（heap.Pop 已將頂端元素換到尾端）
func (h *minHeap) Pop() any {
	// 待取出的元素位於尾端
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top 取得堆積頂端元素
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* 以堆積找出陣列中最大的 k 個元素 */
func topKHeap(nums []int, k int) *minHeap {
	// 初始化最小堆積
	h := &minHeap{}
	heap.Init(h)
	// 將陣列的前 k 個元素加入堆積
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// 從第 k+1 個元素開始，讓堆積大小維持在 k
	for i := k; i < len(nums); i++ {
		// 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
