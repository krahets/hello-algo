// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基於環形陣列實現的佇列 */
type arrayQueue struct {
	nums        []int // 用於儲存佇列元素的陣列
	front       int   // 佇列首指標，指向佇列首元素
	queSize     int   // 佇列長度
	queCapacity int   // 佇列容量（即最大容納元素數量）
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

/* 獲取佇列的長度 */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* 判斷佇列是否為空 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* 入列 */
func (q *arrayQueue) push(num int) {
	// 當 rear == queCapacity 表示佇列已滿
	if q.queSize == q.queCapacity {
		return
	}
	// 計算佇列尾指標，指向佇列尾索引 + 1
	// 透過取餘操作實現 rear 越過陣列尾部後回到頭部
	rear := (q.front + q.queSize) % q.queCapacity
	// 將 num 新增至佇列尾
	q.nums[rear] = num
	q.queSize++
}

/* 出列 */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* 訪問佇列首元素 */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 獲取 Slice 用於列印 */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
