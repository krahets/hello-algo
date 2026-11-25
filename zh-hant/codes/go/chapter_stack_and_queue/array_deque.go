// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 以環狀陣列實作雙端佇列 */
type arrayDeque struct {
	nums        []int // 存放雙端佇列元素的陣列
	front       int   // 隊首索引，記錄隊首元素在陣列中的位置
	queSize     int   // 雙端佇列長度
	queCapacity int   // 佇列容量（最多能容納的元素個數）
}

/* 初始化雙端佇列 */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 取得雙端佇列長度 */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 判斷雙端佇列是否為空 */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 計算環狀陣列的索引 */
func (q *arrayDeque) index(i int) int {
	// 取餘數，讓陣列的首尾相接
	// 當 i 超過陣列末端時，繞回開頭
	// 當 i 越過陣列開頭時，繞回末端
	return (i + q.queCapacity) % q.queCapacity
}

/* 從隊首加入元素 */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("雙端佇列已滿")
		return
	}
	// 將隊首索引往左移一格
	// 取餘數，讓 front 越過陣列開頭時繞回末端
	q.front = q.index(q.front - 1)
	// 將 num 加到隊首
	q.nums[q.front] = num
	q.queSize++
}

/* 從隊尾加入元素 */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("雙端佇列已滿")
		return
	}
	// 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
	rear := q.index(q.front + q.queSize)
	// 將 num 加到隊尾
	q.nums[rear] = num
	q.queSize++
}

/* 從隊首取出元素 */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 將隊首索引往後移一格
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 從隊尾取出元素 */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* 讀取隊首元素 */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 讀取隊尾元素 */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 計算隊尾元素的索引
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 回傳切片以便輸出 */
func (q *arrayDeque) toSlice() []int {
	// 只轉換雙端佇列中實際存放的元素
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
