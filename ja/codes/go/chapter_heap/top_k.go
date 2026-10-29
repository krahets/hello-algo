// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Push は heap.Interface のメソッドであり、ヒープへの要素の挿入を実装する
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Pop は heap.Interface のメソッドであり、ヒープの先頭要素の取り出しを実装する
func (h *minHeap) Pop() any {
	// 取り出す要素は末尾に格納されている
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top はヒープの先頭要素を取得する
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* ヒープを使って配列内の大きいほうから k 個の要素を求める */
func topKHeap(nums []int, k int) *minHeap {
	// 最小ヒープを初期化する
	h := &minHeap{}
	heap.Init(h)
	// 配列の先頭 k 個の要素をヒープに挿入する
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// k+1 番目の要素から始め、ヒープの長さを k に保つ
	for i := k; i < len(nums); i++ {
		// 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
