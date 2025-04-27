// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 基於環形陣列實現的雙向佇列 */
type arrayDeque struct {
	nums        []int // 用於儲存雙向佇列元素的陣列
	front       int   // 佇列首指標，指向佇列首元素
	queSize     int   // 雙向佇列長度
	queCapacity int   // 佇列容量（即最大容納元素數量）
}

/* 初始化佇列 */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 獲取雙向佇列的長度 */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 判斷雙向佇列是否為空 */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 計算環形陣列索引 */
func (q *arrayDeque) index(i int) int {
	// 透過取餘操作實現陣列首尾相連
	// 當 i 越過陣列尾部後，回到頭部
	// 當 i 越過陣列頭部後，回到尾部
	return (i + q.queCapacity) % q.queCapacity
}

/* 佇列首入列 */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("雙向佇列已滿")
		return
	}
	// 佇列首指標向左移動一位
	// 透過取餘操作實現 front 越過陣列頭部後回到尾部
	q.front = q.index(q.front - 1)
	// 將 num 新增至佇列首
	q.nums[q.front] = num
	q.queSize++
}

/* 佇列尾入列 */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("雙向佇列已滿")
		return
	}
	// 計算佇列尾指標，指向佇列尾索引 + 1
	rear := q.index(q.front + q.queSize)
	// 將 num 新增至佇列尾
	q.nums[rear] = num
	q.queSize++
}

/* 佇列首出列 */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 佇列首指標向後移動一位
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 佇列尾出列 */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* 訪問佇列首元素 */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 訪問佇列尾元素 */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 計算尾元素索引
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 獲取 Slice 用於列印 */
func (q *arrayDeque) toSlice() []int {
	// 僅轉換有效長度範圍內的串列元素
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
