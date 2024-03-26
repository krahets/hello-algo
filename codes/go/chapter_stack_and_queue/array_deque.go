// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 基于环形数组实现的双向队列 */
type arrayDeque struct {
	nums        []int // 用于存储双向队列元素的数组
	front       int   // 队首指针，指向队首元素
	queSize     int   // 双向队列长度
	queCapacity int   // 队列容量（即最大容纳元素数量）
}

/* 初始化队列 */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 获取双向队列的长度 */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 判断双向队列是否为空 */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 计算环形数组索引 */
func (q *arrayDeque) index(i int) int {
	// 通过取余操作实现数组首尾相连
	// 当 i 越过数组尾部后，回到头部
	// 当 i 越过数组头部后，回到尾部
	return (i + q.queCapacity) % q.queCapacity
}

/* 队首入队 */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("双向队列已满")
		return
	}
	// 队首指针向左移动一位
	// 通过取余操作实现 front 越过数组头部后回到尾部
	q.front = q.index(q.front - 1)
	// 将 num 添加至队首
	q.nums[q.front] = num
	q.queSize++
}

/* 队尾入队 */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("双向队列已满")
		return
	}
	// 计算队尾指针，指向队尾索引 + 1
	rear := q.index(q.front + q.queSize)
	// 将 num 添加至队尾
	q.nums[rear] = num
	q.queSize++
}

/* 队首出队 */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	// 队首指针向后移动一位
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 队尾出队 */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	q.queSize--
	return num
}

/* 访问队首元素 */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 访问队尾元素 */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 计算尾元素索引
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 获取 Slice 用于打印 */
func (q *arrayDeque) toSlice() []int {
	// 仅转换有效长度范围内的列表元素
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
