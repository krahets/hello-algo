// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// 在 Go 中可以實作 heap.Interface 來建立整數最大堆積
// 實作 heap.Interface 時也要實作 sort.Interface
type intHeap []any

// Push 是 heap.Interface 的方法，負責將元素加入堆積
func (h *intHeap) Push(x any) {
	// Push 和 Pop 都使用指標接收者（pointer receiver）
	// 因為這兩個方法除了調整切片的內容，也會改變切片的長度。
	*h = append(*h, x.(int))
}

// Pop 是 heap.Interface 的方法，取出切片的最後一個元素（heap.Pop 已將頂端元素換到尾端）
func (h *intHeap) Pop() any {
	// 待取出的元素位於尾端
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len 是 sort.Interface 的方法
func (h *intHeap) Len() int {
	return len(*h)
}

// Less 是 sort.Interface 的方法
func (h *intHeap) Less(i, j int) bool {
	// 若要實作最小堆積，這裡應改用小於符號
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap 是 sort.Interface 的方法
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top 取得堆積頂端元素
func (h *intHeap) Top() any {
	return (*h)[0]
}
