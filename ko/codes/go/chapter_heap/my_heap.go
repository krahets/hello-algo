// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// 용량 확장을 따로 고려할 필요가 없도록 배열 대신 슬라이스 사용
	data []any
}

/* 빈 힙을 만드는 생성자 */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* 슬라이스로 힙을 만드는 생성자 */
func newMaxHeap(nums []any) *maxHeap {
	// 리스트의 원소를 그대로 힙에 추가
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// 리프를 제외한 모든 노드에서 힙 복구
		h.siftDown(i)
	}
	return h
}

/* 왼쪽 자식 노드의 인덱스 구하기 */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* 오른쪽 자식 노드의 인덱스 구하기 */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* 부모 노드의 인덱스 구하기 */
func (h *maxHeap) parent(i int) int {
	// 나눗셈 결과를 내림
	return (i - 1) / 2
}

/* 원소 교환 */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* 힙 크기 구하기 */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* 힙이 비었는지 확인 */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* 힙의 루트 원소 조회 */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* 힙에 원소 삽입 */
func (h *maxHeap) push(val any) {
	// 노드 추가
	h.data = append(h.data, val)
	// 아래에서 위로 힙 복구
	h.siftUp(len(h.data) - 1)
}

/* 노드 i부터 아래에서 위로 힙 복구 */
func (h *maxHeap) siftUp(i int) {
	for true {
		// 노드 i의 부모 노드 구하기
		p := h.parent(i)
		// 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// 두 노드 교환
		h.swap(i, p)
		// 위로 올라가며 힙 복구 반복
		i = p
	}
}

/* 힙에서 원소 꺼내기 */
func (h *maxHeap) pop() any {
	// 빈 힙 처리
	if h.isEmpty() {
		fmt.Println("오류")
		return nil
	}
	// 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
	h.swap(0, h.size()-1)
	// 노드 삭제
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// 위에서 아래로 힙 복구
	h.siftDown(0)

	// 힙의 루트 원소 반환
	return val
}

/* 노드 i부터 위에서 아래로 힙 복구 */
func (h *maxHeap) siftDown(i int) {
	for true {
		// 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 max에 저장
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
		if max == i {
			break
		}
		// 두 노드 교환
		h.swap(i, max)
		// 아래로 내려가며 힙 복구 반복
		i = max
	}
}

/* 힙 출력(이진 트리) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
