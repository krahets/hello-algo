// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Stack implemented with an array */
type arrayStack struct {
	data []int // Data
}

/* Initialize the stack */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// Set the stack length to 0 and its capacity to 16
		data: make([]int, 0, 16),
	}
}

/* Stack size */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* Check whether the stack is empty */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* Push */
func (s *arrayStack) push(v int) {
	// Appending grows the slice capacity automatically when needed
	s.data = append(s.data, v)
}

/* Pop */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* Get the top element */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* Get a slice for printing */
func (s *arrayStack) toSlice() []int {
	return s.data
}
