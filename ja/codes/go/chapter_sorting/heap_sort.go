// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 長さ n のヒープで、ノード i から下向きにヒープ化 */
func siftDown(nums *[]int, n, i int) {
	for true {
		// ノード i, l, r のうち値が最大のものを ma とする
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// i の値が最大か、左右の子のインデックス l, r がともに範囲外なら、ヒープ化を終了
		if ma == i {
			break
		}
		// 2 つのノードを交換
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// 下向きのヒープ化を繰り返す
		i = ma
	}
}

/* ヒープソート */
func heapSort(nums *[]int) {
	// ヒープの構築：葉以外のすべてのノードをヒープ化
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// ヒープから最大要素を取り出す操作を n-1 回繰り返す
	for i := len(*nums) - 1; i > 0; i-- {
		// 根と右端の葉を交換（先頭要素と末尾要素の交換）
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// 根から下向きにヒープ化
		siftDown(nums, i, 0)
	}
}
