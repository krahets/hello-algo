// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 循環配列を使ったキュー */
type arrayQueue struct {
	nums        []int // キューの要素を格納する配列
	front       int   // キューの先頭要素を指すインデックス
	queSize     int   // キューの要素数
	queCapacity int   // キューの容量（格納できる要素の最大数）
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

/* キューの要素数を取得する */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* キューが空かどうかを判定する */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* エンキューする */
func (q *arrayQueue) push(num int) {
	// queSize == queCapacity のとき、キューは満杯である
	if q.queSize == q.queCapacity {
		return
	}
	// キューの末尾要素の次の位置を示すインデックスを求める
	// 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
	rear := (q.front + q.queSize) % q.queCapacity
	// num をキューの末尾に追加する
	q.nums[rear] = num
	q.queSize++
}

/* デキューする */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* キューの先頭要素を参照する */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 表示用のスライスを取得する */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
