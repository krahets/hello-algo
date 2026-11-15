// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go에서는 heap.Interface를 구현하여 정수 최대 힙을 만들 수 있다
// heap.Interface를 구현하려면 sort.Interface도 구현해야 한다
type intHeap []any

// Push: heap.Interface의 함수로, 힙에 원소를 삽입한다
func (h *intHeap) Push(x any) {
	// Push와 Pop은 포인터 리시버(pointer receiver)를 매개변수로 사용한다
	// 슬라이스의 내용뿐 아니라 길이도 변경하기 때문이다.
	*h = append(*h, x.(int))
}

// Pop: heap.Interface의 함수로, 힙의 루트 원소를 꺼낸다
func (h *intHeap) Pop() any {
	// 꺼낼 원소는 맨 마지막에 저장되어 있다
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len: sort.Interface의 함수
func (h *intHeap) Len() int {
	return len(*h)
}

// Less: sort.Interface의 함수
func (h *intHeap) Less(i, j int) bool {
	// 최소 힙을 구현하려면 부등호를 <로 바꾸어야 한다
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap: sort.Interface의 함수
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top: 힙의 루트 원소를 반환한다
func (h *intHeap) Top() any {
	return (*h)[0]
}
