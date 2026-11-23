// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 배열 대신 슬라이스를 사용하면 용량 확장을 고려할 필요가 없다
	data []any
}

/* 생성자: 빈 힙 생성 */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* 생성자: 슬라이스를 바탕으로 힙 구성 */
func newMaxHeap(nums []any) *maxHeap {
	// 리스트 원소를 그대로 힙에 추가한다
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
		h.siftDown(i)
	}
	return h
}

/* 왼쪽 자식 노드의 인덱스 반환 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 오른쪽 자식 노드의 인덱스 반환 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 부모 노드의 인덱스 반환 */
func (h *maxHeap) parent(i int) int {
	// 나눗셈의 결과를 내림한다
	return (i - 1) / 2
}

/* 원소 교환 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* 힙 크기 반환 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* 힙이 비어 있는지 판단 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* 힙의 루트 원소 접근 */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 힙에 원소 삽입 */
func (h *maxHeap) push(val any) {
	// 노드 추가
	h.data = append(h.data, val)
	// 아래에서 위로 힙을 재정렬한다
	h.siftUp(len(h.data) - 1)
}

/* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 노드 i의 부모 노드를 구한다
		p := h.parent(i)
		// 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 두 노드를 교환한다
		h.swap(i, p)
		// 위쪽으로 힙 재정렬을 반복한다
		i = p
	}
}

/* 힙에서 원소 꺼내기 */
func (h *maxHeap) pop() any {
	// 비어 있는 경우를 처리한다
	if h.isEmpty() {
		fmt.Println("오류")
		return nil
	}
	// 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
	h.swap(0, h.size()-1)
	// 노드 삭제
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 위에서 아래로 힙을 재정렬한다
	h.siftDown(0)

	// 힙의 루트 원소를 반환한다
	return val
}

/* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 노드 i, l, r 중 값이 가장 큰 노드를 찾아 max로 표시한다
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
		if max == i {
			break
		}
		// 두 노드를 교환한다
		h.swap(i, max)
		// 아래쪽으로 힙 재정렬을 반복한다
		i = max
	}
}

/* 힙 출력(이진 트리) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
