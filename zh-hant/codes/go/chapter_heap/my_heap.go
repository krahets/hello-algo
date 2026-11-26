// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 採用切片取代陣列，無須自行處理擴充容量的問題
	data []any
}

/* 建構函式，建立空堆積 */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* 建構函式，根據切片建立堆積 */
func newMaxHeap(nums []any) *maxHeap {
	// 將串列元素依原順序全部加入堆積
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 從每個非葉節點向下調整堆積
		h.siftDown(i)
	}
	return h
}

/* 取得左子節點的索引 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 取得右子節點的索引 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 取得父節點的索引 */
func (h *maxHeap) parent(i int) int {
	// 向下取整的整數除法
	return (i - 1) / 2
}

/* 交換元素 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* 取得堆積大小 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* 判斷堆積是否為空 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* 讀取堆積頂端元素 */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 將元素加入堆積 */
func (h *maxHeap) push(val any) {
	// 新增節點
	h.data = append(h.data, val)
	// 由下往上調整堆積
	h.siftUp(len(h.data) - 1)
}

/* 從節點 i 開始向上調整堆積 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 取得節點 i 的父節點
		p := h.parent(i)
		// 若已越過根節點，或節點已符合堆積性質，就結束調整
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 交換兩個節點
		h.swap(i, p)
		// 繼續向上調整堆積
		i = p
	}
}

/* 從堆積取出元素 */
func (h *maxHeap) pop() any {
	// 檢查堆積是否為空
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// 交換根節點與最右側的葉節點（即首尾兩個元素）
	h.swap(0, h.size()-1)
	// 刪除節點
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 由上往下調整堆積
	h.siftDown(0)

	// 回傳堆積頂端元素
	return val
}

/* 從節點 i 開始向下調整堆積 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 找出節點 i、l、r 中值最大的節點，記為 max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
		if max == i {
			break
		}
		// 交換兩個節點
		h.swap(i, max)
		// 繼續向下調整堆積
		i = max
	}
}

/* 印出堆積（二元樹） */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
