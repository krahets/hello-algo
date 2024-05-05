// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Stack class based on array */
type arrayStack struct {
	data []int // Data
}

/* Initialize stack */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// Set stack length to 0, capacity to 16
		data: make([]int, 0, 16),
	}
}

/* Length of the stack */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* Is the stack empty */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* Push */
func (s *arrayStack) push(v int) {
	// Slices automatically extend
	s.data = append(s.data, v)
}

/* Pop */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* Retrieve the top element of the stack */
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
