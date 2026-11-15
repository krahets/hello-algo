// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go では heap.Interface を実装して整数の最大ヒープを構築できる
// heap.Interface の実装には sort.Interface も実装する必要がある
type intHeap []any

// Push は heap.Interface の関数であり、ヒープへの要素の挿入を実装する
func (h *intHeap) Push(x any) {
	// Push と Pop は引数としてポインタレシーバを使う
	// スライスの内容を変更するだけでなく、スライスの長さも変更するためである。
	*h = append(*h, x.(int))
}

// Pop は heap.Interface の関数であり、ヒープの先頭要素の取り出しを実装する
func (h *intHeap) Pop() any {
	// 取り出す要素は末尾に格納されている
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len は sort.Interface の関数
func (h *intHeap) Len() int {
	return len(*h)
}

// Less は sort.Interface の関数
func (h *intHeap) Less(i, j int) bool {
	// 最小ヒープを実装する場合、不等号を小なりに変更する必要がある
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap は sort.Interface の関数
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top はヒープの先頭要素を取得する
func (h *intHeap) Top() any {
	return (*h)[0]
}
