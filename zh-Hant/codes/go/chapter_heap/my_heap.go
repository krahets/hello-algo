// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 使用切片而非陣列，這樣無須考慮擴容問題
	data []any
}

/* 建構子，建立空堆積 */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* 建構子，根據切片建堆積 */
func newMaxHeap(nums []any) *maxHeap {
	// 將串列元素原封不動新增進堆積
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 堆積化除葉節點以外的其他所有節點
		h.siftDown(i)
	}
	return h
}

/* 獲取左子節點的索引 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 獲取右子節點的索引 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 獲取父節點的索引 */
func (h *maxHeap) parent(i int) int {
	// 向下整除
	return (i - 1) / 2
}

/* 交換元素 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* 獲取堆積大小 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* 判斷堆積是否為空 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* 訪問堆積頂元素 */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 元素入堆積 */
func (h *maxHeap) push(val any) {
	// 新增節點
	h.data = append(h.data, val)
	// 從底至頂堆積化
	h.siftUp(len(h.data) - 1)
}

/* 從節點 i 開始，從底至頂堆積化 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 獲取節點 i 的父節點
		p := h.parent(i)
		// 當“越過根節點”或“節點無須修復”時，結束堆積化
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 交換兩節點
		h.swap(i, p)
		// 迴圈向上堆積化
		i = p
	}
}

/* 元素出堆積 */
func (h *maxHeap) pop() any {
	// 判空處理
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// 交換根節點與最右葉節點（交換首元素與尾元素）
	h.swap(0, h.size()-1)
	// 刪除節點
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 從頂至底堆積化
	h.siftDown(0)

	// 返回堆積頂元素
	return val
}

/* 從節點 i 開始，從頂至底堆積化 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 判斷節點 i, l, r 中值最大的節點，記為 max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
		if max == i {
			break
		}
		// 交換兩節點
		h.swap(i, max)
		// 迴圈向下堆積化
		i = max
	}
}

/* 列印堆積（二元樹） */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
