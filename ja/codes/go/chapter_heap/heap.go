// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go では heap.Interface を実装して整数の最大ヒープを構築できる
// heap.Interface の実装には sort.Interface の実装も必要
type intHeap []any

// Push は heap.Interface の関数で、要素をヒープに挿入する
func (h *intHeap) Push(x any) {
	// Push と Pop はポインタレシーバを使う
	// スライスの要素だけでなく長さも変更するため
	*h = append(*h, x.(int))
}

// Pop は heap.Interface の関数で、スライスの末尾要素を取り出す（heap.Pop が根の要素を末尾に移動済み）
func (h *intHeap) Pop() any {
	// 取り出す要素は末尾にある
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
	// 最小ヒープを実装する場合は小なり記号に変更する
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap は sort.Interface の関数
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top はヒープの根の要素を取得する
func (h *intHeap) Top() any {
	return (*h)[0]
}
