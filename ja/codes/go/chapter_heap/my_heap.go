// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 配列ではなくスライスを使うことで、拡張を考慮せずに済む
	data []any
}

/* コンストラクタ。空のヒープを作成する */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* コンストラクタ。スライスからヒープを構築する */
func newMaxHeap(nums []any) *maxHeap {
	// リスト要素をそのままヒープに追加
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 葉ノード以外のすべてのノードをヒープ化
		h.siftDown(i)
	}
	return h
}

/* 左子ノードのインデックスを取得 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 右子ノードのインデックスを取得 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 親ノードのインデックスを取得 */
func (h *maxHeap) parent(i int) int {
	// 切り捨て除算
	return (i - 1) / 2
}

/* 要素を交換 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* ヒープのサイズを取得 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* ヒープが空かどうかを判定 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* ヒープ先頭要素にアクセス */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 要素をヒープに追加 */
func (h *maxHeap) push(val any) {
	// ノードを追加
	h.data = append(h.data, val)
	// 下から上へヒープ化
	h.siftUp(len(h.data) - 1)
}

/* ノード i から始めて、下から上へヒープ化 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// ノード i の親ノードを取得
		p := h.parent(i)
		// 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 2 つのノードを交換
		h.swap(i, p)
		// ループで下から上へヒープ化
		i = p
	}
}

/* 要素をヒープから取り出す */
func (h *maxHeap) pop() any {
	// 空判定の処理
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
	h.swap(0, h.size()-1)
	// ノードを削除
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 上から下へヒープ化
	h.siftDown(0)

	// ヒープ先頭要素を返す
	return val
}

/* ノード i から始めて、上から下へヒープ化 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// ノード i, l, r のうち値が最大のノードを max とする
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
		if max == i {
			break
		}
		// 2 つのノードを交換
		h.swap(i, max)
		// ループで上から下へヒープ化
		i = max
	}
}

/* ヒープ（二分木）を出力 */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
