// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 配列の代わりにスライスを使えば、容量の拡張を自分で扱う必要がない
	data []any
}

/* 空のヒープを作るコンストラクタ */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* スライスからヒープを構築するコンストラクタ */
func newMaxHeap(nums []any) *maxHeap {
	// リストの要素をそのままヒープに追加する
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 葉以外のすべてのノードをヒープ化する
		h.siftDown(i)
	}
	return h
}

/* 左の子のインデックスを取得する */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 右の子のインデックスを取得する */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 親のインデックスを取得する */
func (h *maxHeap) parent(i int) int {
	// 商を 0 方向に丸める
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

/* ヒープが空か判定する */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* ヒープの根の要素を参照する */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 要素をヒープに挿入する */
func (h *maxHeap) push(val any) {
	// ノードを追加する
	h.data = append(h.data, val)
	// 上に向かってヒープ化する
	h.siftUp(len(h.data) - 1)
}

/* ノード i から上に向かってヒープ化する */
func (h *maxHeap) siftUp(i int) {
	for true {
		// ノード i の親を取得する
		p := h.parent(i)
		// 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 2 つのノードを交換する
		h.swap(i, p)
		// 上へのヒープ化を繰り返す
		i = p
	}
}

/* 根の要素をヒープから取り出す */
func (h *maxHeap) pop() any {
	// 空の場合の処理
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// 根と最も右の葉（先頭要素と末尾要素）を交換する
	h.swap(0, h.size()-1)
	// ノードを削除する
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 下に向かってヒープ化する
	h.siftDown(0)

	// 根の要素を返す
	return val
}

/* ノード i から下に向かってヒープ化する */
func (h *maxHeap) siftDown(i int) {
	for true {
		// ノード i、l、r のうち値が最大のものを max とする
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
		if max == i {
			break
		}
		// 2 つのノードを交換する
		h.swap(i, max)
		// 下へのヒープ化を繰り返す
		i = max
	}
}

/* ヒープを二分木として表示する */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
