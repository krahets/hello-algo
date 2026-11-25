// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Array-backed stack */
type arrayStack struct {
	data []int // Stack elements
}

/* Initialize the stack */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// Set the stack size to 0 and the capacity to 16
		data: make([]int, 0, 16),
	}
}

/* Get the stack size */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* Check whether the stack is empty */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* Push an element onto the stack */
func (s *arrayStack) push(v int) {
	// The slice grows automatically as needed
	s.data = append(s.data, v)
}

/* Remove and return the top element */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* Peek at the top element */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* Return a slice for printing */
func (s *arrayStack) toSlice() []int {
	return s.data
}
