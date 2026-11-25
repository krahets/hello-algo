// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Deque backed by a doubly linked list */
type linkedListDeque struct {
	// Use the standard list package
	data *list.List
}

/* Initialize the deque */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* Add an element at the front */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* Add an element at the rear */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* Remove and return the front element */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Remove and return the rear element */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Peek at the front element */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Peek at the rear element */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Get the deque size */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Check whether the deque is empty */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Return the list for printing */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
