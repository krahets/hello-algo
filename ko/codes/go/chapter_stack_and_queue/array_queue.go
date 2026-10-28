// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 원형 배열로 구현한 큐 */
type arrayQueue struct {
	nums        []int // 큐의 원소를 저장하는 배열
	front       int   // 맨 앞 원소를 가리키는 맨 앞 포인터
	queSize     int   // 큐 길이
	queCapacity int   // 큐 용량(저장할 수 있는 최대 원소 개수)
}

/* 큐 초기화 */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 큐의 길이 반환 */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* 큐가 비어 있는지 판단 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* 큐에 삽입 */
func (q *arrayQueue) push(num int) {
	// rear == queCapacity이면 큐가 가득 찼음을 나타낸다
	if q.queSize == q.queCapacity {
		return
	}
	// 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
	// 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
	rear := (q.front + q.queSize) % q.queCapacity
	// num을 맨 뒤에 추가한다
	q.nums[rear] = num
	q.queSize++
}

/* 큐에서 꺼내기 */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* 맨 앞 원소 접근 */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 출력에 사용할 Slice 반환 */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
