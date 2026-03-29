// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 循環配列ベースのキュー */
type arrayQueue struct {
	nums        []int // キュー要素を格納する配列
	front       int   // 先頭ポインタ。先頭要素を指す
	queSize     int   // キューの長さ
	queCapacity int   // キュー容量（格納できる要素数の上限）
}

/* キューを初期化 */
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

/* キューが空かどうかを判定 */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* エンキュー */
func (q *arrayQueue) push(num int) {
	// rear == queCapacity のときキューは満杯
	if q.queSize == q.queCapacity {
		return
	}
	// 末尾ポインタを計算し、末尾インデックス + 1 を指す
	// 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
	rear := (q.front + q.queSize) % q.queCapacity
	// num をキュー末尾に追加
	q.nums[rear] = num
	q.queSize++
}

/* デキュー */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* キュー先頭の要素にアクセス */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 表示用に Slice を取得 */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
