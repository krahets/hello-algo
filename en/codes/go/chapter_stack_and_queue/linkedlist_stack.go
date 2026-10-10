// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Stack based on linked list implementation */
type linkedListStack struct {
	// Use built-in package list to implement stack
	data *list.List
}

/* Access top of the stack element */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* Push */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* Pop */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Return list for printing */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Get the length of the stack */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* Check if the stack is empty */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* Get List for printing */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
