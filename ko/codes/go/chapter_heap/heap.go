// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// Go에서는 heap.Interface를 구현해 정수 최대 힙을 만들 수 있음
// heap.Interface를 구현하려면 sort.Interface도 구현해야 함
type intHeap []any

// Push는 힙에 원소를 삽입하는 heap.Interface 함수
func (h *intHeap) Push(x any) {
	// Push와 Pop은 포인터 리시버를 사용
	// 슬라이스의 내용뿐만 아니라 길이도 바꾸기 때문
	*h = append(*h, x.(int))
}

// Pop은 슬라이스의 마지막 원소를 꺼내는 heap.Interface 함수(heap.Pop이 이미 루트를 마지막 자리로 옮김)
func (h *intHeap) Pop() any {
	// 꺼낼 원소는 맨 끝에 위치
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Len은 sort.Interface 함수
func (h *intHeap) Len() int {
	return len(*h)
}

// Less는 sort.Interface 함수
func (h *intHeap) Less(i, j int) bool {
	// 최소 힙을 구현하려면 부등호를 작은 쪽을 고르는 방향으로 변경
	return (*h)[i].(int) > (*h)[j].(int)
}

// Swap은 sort.Interface 함수
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top은 힙의 루트 원소를 조회
func (h *intHeap) Top() any {
	return (*h)[0]
}
