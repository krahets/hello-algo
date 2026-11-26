// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 以環狀陣列實作佇列 */
type arrayQueue struct {
	nums        []int // 存放佇列元素的陣列
	front       int   // 隊首索引，記錄隊首元素在陣列中的位置
	queSize     int   // 佇列長度
	queCapacity int   // 佇列容量（最多能容納的元素個數）
}

/* 初始化佇列 */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 取得佇列長度 */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* 判斷佇列是否為空 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* 入隊 */
func (q *arrayQueue) push(num int) {
	// queSize == queCapacity 時表示佇列已滿
	if q.queSize == q.queCapacity {
		return
	}
	// 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
	// 取餘數，讓 rear 超過陣列末端時繞回開頭
	rear := (q.front + q.queSize) % q.queCapacity
	// 將 num 加到隊尾
	q.nums[rear] = num
	q.queSize++
}

/* 出隊 */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 將隊首索引往後移一格，若超過陣列末端就繞回開頭
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* 讀取隊首元素 */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 回傳切片以便輸出 */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
