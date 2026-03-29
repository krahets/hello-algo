// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* 循環配列ベースの両端キュー */
type arrayDeque struct {
	nums        []int // 両端キューの要素を格納する配列
	front       int   // 先頭ポインタ。先頭要素を指す
	queSize     int   // 両端キューの長さ
	queCapacity int   // キュー容量（格納できる要素数の上限）
}

/* キューを初期化 */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* 両端キューの長さを取得 */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* 両端キューが空かどうかを判定 */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* 循環配列のインデックスを計算 */
func (q *arrayDeque) index(i int) int {
	// 剰余演算により配列の先頭と末尾をつなげる
	// i が配列の末尾を越えたら先頭に戻る
	// i が配列の先頭を越えて前に出たら末尾に戻る
	return (i + q.queCapacity) % q.queCapacity
}

/* キュー先頭にエンキュー */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューは満杯です")
		return
	}
	// 先頭ポインタを左に 1 つ移動する
	// 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
	q.front = q.index(q.front - 1)
	// num をキュー先頭に追加
	q.nums[q.front] = num
	q.queSize++
}

/* キュー末尾にエンキュー */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("両端キューは満杯です")
		return
	}
	// キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
	rear := q.index(q.front + q.queSize)
	// num をキュー末尾に追加
	q.nums[rear] = num
	q.queSize++
}

/* キュー先頭からデキュー */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// 先頭ポインタを 1 つ後ろへ進める
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* キュー末尾からデキュー */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* キュー先頭の要素にアクセス */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* キュー末尾の要素にアクセス */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// 末尾要素のインデックスを計算
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* 表示用に Slice を取得 */
func (q *arrayDeque) toSlice() []int {
	// 有効長の範囲内のリスト要素のみを変換
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
