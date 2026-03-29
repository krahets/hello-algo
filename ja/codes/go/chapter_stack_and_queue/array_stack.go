// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 配列ベースのスタック */
type arrayStack struct {
	data []int // データ
}

/* スタックを初期化 */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// スタックの長さを 0、容量を 16 に設定
		data: make([]int, 0, 16),
	}
}

/* スタックの長さ */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* スタックが空かどうか */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* プッシュ */
func (s *arrayStack) push(v int) {
	// スライスは自動で拡張される
	s.data = append(s.data, v)
}

/* ポップ */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* スタックトップ要素を取得する */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* 表示用に Slice を取得 */
func (s *arrayStack) toSlice() []int {
	return s.data
}
