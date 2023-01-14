// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 使用切片而非数组，这样无需考虑扩容问题
	data []any
}

/* 构造函数，建立空堆 */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* 构造函数，根据切片建堆 */
func newMaxHeap(nums []any) *maxHeap {
	// 所有元素入堆
	h := &maxHeap{data: nums}
	for i := len(h.data) - 1; i >= 0; i-- {
		// 堆化除叶结点以外的其他所有结点
		h.siftDown(i)
	}
	return h
}

/* 获取左子结点索引 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 获取右子结点索引 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 获取父结点索引 */
func (h *maxHeap) parent(i int) int {
	// 向下整除
	return (i - 1) / 2
}

/* 交换元素 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* 获取堆大小 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* 判断堆是否为空 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* 访问堆顶元素 */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 元素入堆 */
func (h *maxHeap) push(val any) {
	// 添加结点
	h.data = append(h.data, val)
	// 从底至顶堆化
	h.siftUp(len(h.data) - 1)
}

/* 从结点 i 开始，从底至顶堆化 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 获取结点 i 的父结点
		p := h.parent(i)
		// 当“越过根结点”或“结点无需修复”时，结束堆化
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 交换两结点
		h.swap(i, p)
		// 循环向上堆化
		i = p
	}
}

/* 元素出堆 */
func (h *maxHeap) poll() any {
	// 判空处理
	if h.isEmpty() {
		fmt.Println("error")
	}
	// 交换根结点与最右叶结点（即交换首元素与尾元素）
	h.swap(0, h.size()-1)
	// 删除结点
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 从顶至底堆化
	h.siftDown(0)

	// 返回堆顶元素
	return val
}

/* 从结点 i 开始，从顶至底堆化 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 判断结点 i, l, r 中值最大的结点，记为 max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 若结点 i 最大或索引 l, r 越界，则无需继续堆化，跳出
		if max == i {
			break
		}
		// 交换两结点
		h.swap(i, max)
		// 循环向下堆化
		i = max
	}
}

/* 打印堆（二叉树） */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
