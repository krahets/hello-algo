// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 원형 배열로 구현한 덱 */
type arrayDeque struct {
	nums        []int // 덱의 원소를 저장하는 배열
	front       int   // 맨 앞 원소를 가리키는 앞쪽 포인터
	queSize     int   // 덱의 길이
	queCapacity int   // 덱의 용량(저장할 수 있는 최대 원소 수)
}

/* 덱 초기화 */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 덱의 길이 조회 */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 덱이 비어 있는지 확인 */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 원형 배열의 인덱스 계산 */
func (q *arrayDeque) index(i int) int {
	// 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
	// i가 배열의 끝을 넘으면 처음으로 돌아간다
	// i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
	return (i + q.queCapacity) % q.queCapacity
}

/* 맨 앞에 삽입 */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("덱이 가득 찼다")
		return
	}
	// 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
	// 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
	q.front = q.index(q.front - 1)
	// 맨 앞에 num을 추가한다
	q.nums[q.front] = num
	q.queSize++
}

/* 맨 뒤에 삽입 */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("덱이 가득 찼다")
		return
	}
	// 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
	rear := q.index(q.front + q.queSize)
	// 맨 뒤에 num을 추가한다
	q.nums[rear] = num
	q.queSize++
}

/* 맨 앞에서 꺼내기 */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 앞쪽 포인터를 한 칸 전진시킨다
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 맨 뒤에서 꺼내기 */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* 맨 앞 원소 조회 */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 맨 뒤 원소 조회 */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 맨 뒤 원소의 인덱스 계산
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 출력에 사용할 슬라이스 반환 */
func (q *arrayDeque) toSlice() []int {
	// 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
