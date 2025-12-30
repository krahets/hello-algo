// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Stack based on array implementation */
type arrayStack struct {
	data []int // Data
}

/* Access top of the stack element */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// Set stack length to 0, capacity to 16
		data: make([]int, 0, 16),
	}
}

/* Stack length */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* Is stack empty */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* Push */
func (s *arrayStack) push(v int) {
	// Slice will automatically expand
	s.data = append(s.data, v)
}

/* Pop */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* Get stack top element */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* Get Slice for printing */
func (s *arrayStack) toSlice() []int {
	return s.data
}
