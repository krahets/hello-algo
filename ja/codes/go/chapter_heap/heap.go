// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go では heap.Interface を実装することで整数の最大ヒープを構築できる
// heap.Interface を実装するには、同時に sort.Interface も実装する必要がある
type intHeap []any

// Push は heap.Interface の関数で、要素をヒープに追加する
func (h *intHeap) Push(x any) {
	// Push と Pop は pointer receiver を使う
	// これらはスライスの内容を調整するだけでなく、スライスの長さも変更するためである。
	*h = append(*h, x.(int))
}

// Pop は heap.Interface の関数で、ヒープの先頭要素を取り出す
func (h *intHeap) Pop() any {
	// ヒープから取り出す要素を末尾に置く
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
	// 最小ヒープを実装する場合は、不等号を < に調整する
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap は sort.Interface の関数
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top ヒープ先頭要素を取得
func (h *intHeap) Top() any {
	return (*h)[0]
}
