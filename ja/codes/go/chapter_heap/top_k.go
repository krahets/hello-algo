// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push は heap.Interface のメソッドで、要素をヒープに追加する
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop は heap.Interface のメソッドで、ヒープの先頭要素を取り出す
func (h *minHeap) Pop() any {
	// ヒープから取り出す要素を末尾に置く
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top ヒープ先頭要素を取得
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
func topKHeap(nums []int, k int) *minHeap {
	// 最小ヒープを初期化
	h := &minHeap{}
	heap.Init(h)
	// 配列の先頭 k 個の要素をヒープに追加
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// k+1 番目の要素から開始し、ヒープ長を k に保つ
	for i := k; i < len(nums); i++ {
		// 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
