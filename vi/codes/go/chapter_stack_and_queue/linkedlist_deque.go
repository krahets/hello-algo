// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Double-ended queue based on doubly linked list implementation */
type linkedListDeque struct {
	// Use built-in package list
	data *list.List
}

/* Initialize deque */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* Front element enqueue */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* Rear element enqueue */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* Check if the double-ended queue is empty */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Rear element dequeue */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Return list for printing */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Driver Code */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Get the length of the queue */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Check if the queue is empty */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Get List for printing */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
