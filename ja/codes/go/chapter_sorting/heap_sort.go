// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
func siftDown(nums *[]int, n, i int) {
	for true {
		// ノード i, l, r のうち値が最大のノードを ma とする
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
		if ma == i {
			break
		}
		// 2 つのノードを交換
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// ループで上から下へヒープ化
		i = ma
	}
}

/* ヒープソート */
func heapSort(nums *[]int) {
	// ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// ヒープから最大要素を取り出し、n-1 回繰り返す
	for i := len(*nums) - 1; i > 0; i-- {
		// 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// 根ノードを起点に、上から下へヒープ化
		siftDown(nums, i, 0)
	}
}
