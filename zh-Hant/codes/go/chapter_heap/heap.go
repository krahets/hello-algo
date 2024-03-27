// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go 語言中可以透過實現 heap.Interface 來構建整數大頂堆積
// 實現 heap.Interface 需要同時實現 sort.Interface
type intHeap []any

// Push heap.Interface 的函式，實現推入元素到堆積
func (h *intHeap) Push(x any) {
	// Push 和 Pop 使用 pointer receiver 作為參數
	// 因為它們不僅會對切片的內容進行調整，還會修改切片的長度。
	*h = append(*h, x.(int))
}

// Pop heap.Interface 的函式，實現彈出堆積頂元素
func (h *intHeap) Pop() any {
	// 待出堆積元素存放在最後
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len sort.Interface 的函式
func (h *intHeap) Len() int {
	return len(*h)
}

// Less sort.Interface 的函式
func (h *intHeap) Less(i, j int) bool {
	// 如果實現小頂堆積，則需要調整為小於號
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap sort.Interface 的函式
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top 獲取堆積頂元素
func (h *intHeap) Top() any {
	return (*h)[0]
}
