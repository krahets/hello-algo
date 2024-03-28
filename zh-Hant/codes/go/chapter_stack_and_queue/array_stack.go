// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基於陣列實現的堆疊 */
type arrayStack struct {
	data []int // 資料
}

/* 初始化堆疊 */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// 設定堆疊的長度為 0，容量為 16
		data: make([]int, 0, 16),
	}
}

/* 堆疊的長度 */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* 堆疊是否為空 */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* 入堆疊 */
func (s *arrayStack) push(v int) {
	// 切片會自動擴容
	s.data = append(s.data, v)
}

/* 出堆疊 */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* 獲取堆疊頂元素 */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* 獲取 Slice 用於列印 */
func (s *arrayStack) toSlice() []int {
	return s.data
}
