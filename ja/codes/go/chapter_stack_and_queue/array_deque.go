// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 循環配列を使った両端キュー */
type arrayDeque struct {
	nums        []int // 両端キューの要素を格納する配列
	front       int   // 両端キューの先頭要素を指すインデックス
	queSize     int   // 両端キューの要素数
	queCapacity int   // 両端キューの容量（格納できる要素の最大数）
}

/* 両端キューを初期化する */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 両端キューの要素数を取得する */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 両端キューが空かどうかを判定する */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 循環配列のインデックスを求める */
func (q *arrayDeque) index(i int) int {
	// 剰余を使って配列の先頭と末尾をつなぐ
	// i が配列の末尾を越えたら先頭に戻る
	// i が配列の先頭より前に出たら末尾に回る
	return (i + q.queCapacity) % q.queCapacity
}

/* 先頭に追加する */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューが満杯です")
		return
	}
	// 先頭のインデックスを左に 1 つ移す
	// 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
	q.front = q.index(q.front - 1)
	// num を両端キューの先頭に追加する
	q.nums[q.front] = num
	q.queSize++
}

/* 末尾に追加する */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューが満杯です")
		return
	}
	// 両端キューの末尾要素の次の位置を示すインデックスを求める
	rear := q.index(q.front + q.queSize)
	// num を両端キューの末尾に追加する
	q.nums[rear] = num
	q.queSize++
}

/* 先頭から取り出す */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 先頭のインデックスを 1 つ進める
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 末尾から取り出す */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* 両端キューの先頭要素を参照する */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* 両端キューの末尾要素を参照する */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 末尾要素のインデックスを求める
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 表示用のスライスを取得する */
func (q *arrayDeque) toSlice() []int {
	// 両端キューの要素数に当たる範囲だけを変換する
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
