// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 基于数组实现的栈 */
type ArrayStack struct {
	data []int // 数据
}

func NewArrayStack() *ArrayStack {
	return &ArrayStack{
		// 设置栈的长度为 0，容量为 16
		data: make([]int, 0, 16),
	}
}

// Size 栈的长度
func (s *ArrayStack) Size() int {
	return len(s.data)
}

// IsEmpty 栈是否为空
func (s *ArrayStack) IsEmpty() bool {
	return s.Size() == 0
}

// Push 入栈
func (s *ArrayStack) Push(v int) {
	// 切片会自动扩容
	s.data = append(s.data, v)
}

// Pop 出栈
func (s *ArrayStack) Pop() any {
	// 弹出栈前，先判断是否为空
	if s.IsEmpty() {
		return nil
	}
	val := s.Peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

// Peek 获取栈顶元素
func (s *ArrayStack) Peek() any {
	if s.IsEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

// 获取 Slice 用于打印
func (s *ArrayStack) toSlice() []int {
	return s.data
}
