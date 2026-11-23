// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Deque implemented with a doubly linked list */
type linkedListDeque struct {
	// Use the standard library list package
	data *list.List
}

/* Initialize the deque */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* Enqueue an element at the front */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* Enqueue an element at the rear */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* Dequeue the front element */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Dequeue the rear element */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Access the front element */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Access the rear element */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Get the queue size */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Check whether the queue is empty */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Get the list for printing */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
