// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 循環配列で実装した両端キュー */
type arrayDeque struct {
	nums        []int // 両端キューの要素を格納する配列
	front       int   // キューの先頭要素を指す先頭ポインタ
	queSize     int   // 両端キューの長さ
	queCapacity int   // キューの容量（格納できる要素数の上限）
}

/* キューを初期化する */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 両端キューの長さを取得する */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 両端キューが空かどうかを判定する */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 循環配列のインデックスを計算する */
func (q *arrayDeque) index(i int) int {
	// 剰余演算を使い、配列の先頭と末尾をつなぐ
	// i が配列の末尾を越えたら、先頭に戻る
	// i が配列の先頭を越えたら、末尾に戻る
	return (i + q.queCapacity) % q.queCapacity
}

/* 先頭にエンキューする */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューが満杯です")
		return
	}
	// 先頭ポインタを左に 1 つ移動する
	// 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
	q.front = q.index(q.front - 1)
	// num をキューの先頭に追加する
	q.nums[q.front] = num
	q.queSize++
}

/* 末尾にエンキューする */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューが満杯です")
		return
	}
	// 末尾のインデックス + 1 を指す末尾ポインタを計算する
	rear := q.index(q.front + q.queSize)
	// num をキューの末尾に追加する
	q.nums[rear] = num
	q.queSize++
}

/* 先頭からデキューする */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 先頭ポインタを後ろに 1 つ移動する
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* 末尾からデキューする */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* キューの先頭要素にアクセス */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* キューの末尾要素にアクセスする */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 末尾要素のインデックスを計算する
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 表示用の Slice を取得する */
func (q *arrayDeque) toSlice() []int {
	// 有効な長さの範囲内にあるリストの要素だけを変換する
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
