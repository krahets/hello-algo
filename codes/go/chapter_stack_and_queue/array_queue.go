// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基于环形数组实现的队列 */
type arrayQueue struct {
	nums        []int // 用于存储队列元素的数组
	front       int   // 队首指针，指向队首元素
	queSize     int   // 队列长度
	queCapacity int   // 队列容量（即最大容纳元素数量）
}

/* 初始化队列 */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 获取队列的长度 */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* 判断队列是否为空 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* 入队 */
func (q *arrayQueue) push(num int) {
	// 当 rear == queCapacity 表示队列已满
	if q.queSize == q.queCapacity {
		return
	}
	// 计算队尾指针，指向队尾索引 + 1
	// 通过取余操作实现 rear 越过数组尾部后回到头部
	rear := (q.front + q.queSize) % q.queCapacity
	// 将 num 添加至队尾
	q.nums[rear] = num
	q.queSize++
}

/* 出队 */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 队首指针向后移动一位，若越过尾部，则返回到数组头部
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* 访问队首元素 */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 获取 Slice 用于打印 */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
