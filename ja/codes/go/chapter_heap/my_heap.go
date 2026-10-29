// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 配列ではなくスライスを使うため、容量の拡張を考慮する必要がない
	data []any
}

/* コンストラクタ：空のヒープを構築する */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* コンストラクタ：スライスからヒープを構築する */
func newMaxHeap(nums []any) *maxHeap {
	// リストの要素をそのままヒープに追加する
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 葉ノード以外の全ノードをヒープ化する
		h.siftDown(i)
	}
	return h
}

/* 左の子のインデックスを取得 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 右の子のインデックスを取得 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 親のインデックスを取得 */
func (h *maxHeap) parent(i int) int {
	// 切り捨て除算
	return (i - 1) / 2
}

/* 要素を交換する */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* ヒープのサイズを取得する */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* ヒープが空か判定 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* ヒープの先頭要素にアクセスする */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* ヒープに要素を挿入する */
func (h *maxHeap) push(val any) {
	// ノードを追加する
	h.data = append(h.data, val)
	// 下から上へヒープ化する
	h.siftUp(len(h.data) - 1)
}

/* ノード i から上向きにヒープ化する */
func (h *maxHeap) siftUp(i int) {
	for true {
		// ノード i の親ノードを取得する
		p := h.parent(i)
		// 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 2 つのノードを交換する
		h.swap(i, p)
		// 上向きのヒープ化を繰り返す
		i = p
	}
}

/* ヒープから要素を取り出す */
func (h *maxHeap) pop() any {
	// 空かどうかを確認する
	if h.isEmpty() {
		fmt.Println("エラー")
		return nil
	}
	// 根と最右の葉を交換（先頭要素と末尾要素を交換）
	h.swap(0, h.size()-1)
	// ノードを削除する
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 上から下へヒープ化する
	h.siftDown(0)

	// ヒープの先頭要素を返す
	return val
}

/* ノード i から下向きにヒープ化する */
func (h *maxHeap) siftDown(i int) {
	for true {
		// ノード i, l, r のうち値が最大のノードを求め、max とする
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
		if max == i {
			break
		}
		// 2 つのノードを交換する
		h.swap(i, max)
		// 下向きのヒープ化を繰り返す
		i = max
	}
}

/* ヒープ（二分木）を表示する */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
