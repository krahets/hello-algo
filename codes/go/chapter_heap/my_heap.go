// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 使用切片而非数组，这样无须考虑扩容问题
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
	// 将列表元素原封不动添加进堆
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 堆化除叶节点以外的其他所有节点
		h.siftDown(i)
	}
	return h
}

/* 获取左子节点的索引 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 获取右子节点的索引 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 获取父节点的索引 */
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
	// 添加节点
	h.data = append(h.data, val)
	// 从底至顶堆化
	h.siftUp(len(h.data) - 1)
}

/* 从节点 i 开始，从底至顶堆化 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 获取节点 i 的父节点
		p := h.parent(i)
		// 当“越过根节点”或“节点无须修复”时，结束堆化
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 交换两节点
		h.swap(i, p)
		// 循环向上堆化
		i = p
	}
}

/* 元素出堆 */
func (h *maxHeap) pop() any {
	// 判空处理
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// 交换根节点与最右叶节点（交换首元素与尾元素）
	h.swap(0, h.size()-1)
	// 删除节点
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 从顶至底堆化
	h.siftDown(0)

	// 返回堆顶元素
	return val
}

/* 从节点 i 开始，从顶至底堆化 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 判断节点 i, l, r 中值最大的节点，记为 max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
		if max == i {
			break
		}
		// 交换两节点
		h.swap(i, max)
		// 循环向下堆化
		i = max
	}
}

/* 打印堆（二叉树） */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
