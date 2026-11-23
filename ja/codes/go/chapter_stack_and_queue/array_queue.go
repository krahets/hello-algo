// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 循環配列で実装したキュー */
type arrayQueue struct {
	nums        []int // キューの要素を格納する配列
	front       int   // キューの先頭要素を指す先頭ポインタ
	queSize     int   // キューの長さ
	queCapacity int   // キューの容量（格納できる要素数の上限）
}

/* キューを初期化する */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* キューの長さを取得 */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* キューが空か判定 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* エンキュー */
func (q *arrayQueue) push(num int) {
	// rear == queCapacity のとき、キューは満杯である
	if q.queSize == q.queCapacity {
		return
	}
	// 末尾のインデックス + 1 を指す末尾ポインタを計算する
	// 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
	rear := (q.front + q.queSize) % q.queCapacity
	// num をキューの末尾に追加する
	q.nums[rear] = num
	q.queSize++
}

/* デキュー */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* キューの先頭要素にアクセス */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 表示用の Slice を取得する */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
