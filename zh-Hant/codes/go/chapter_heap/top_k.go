// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push heap.Interface 的方法，實現推入元素到堆積
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop heap.Interface 的方法，實現彈出堆積頂元素
func (h *minHeap) Pop() any {
	// 待出堆積元素存放在最後
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top 獲取堆積頂元素
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* 基於堆積查詢陣列中最大的 k 個元素 */
func topKHeap(nums []int, k int) *minHeap {
	// 初始化小頂堆積
	h := &minHeap{}
	heap.Init(h)
	// 將陣列的前 k 個元素入堆積
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// 從第 k+1 個元素開始，保持堆積的長度為 k
	for i := k; i < len(nums); i++ {
		// 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
