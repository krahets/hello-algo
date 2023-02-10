// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基于数组实现的栈 */
type arrayStack struct {
	data []int // 数据
}

/* 初始化栈 */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// 设置栈的长度为 0，容量为 16
		data: make([]int, 0, 16),
	}
}

/* 栈的长度 */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* 栈是否为空 */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* 入栈 */
func (s *arrayStack) push(v int) {
	// 切片会自动扩容
	s.data = append(s.data, v)
}

/* 出栈 */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* 获取栈顶元素 */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* 获取 Slice 用于打印 */
func (s *arrayStack) toSlice() []int {
	return s.data
}
