// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Stack implemented with a linked list */
type linkedListStack struct {
	// Use the standard library list package to implement the stack
	data *list.List
}

/* Initialize the stack */
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

/* Access the top element */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Get the stack size */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* Check whether the stack is empty */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* Get the list for printing */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
