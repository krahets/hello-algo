// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Queue backed by a linked list */
type linkedListQueue struct {
	// Use the standard list package to implement the queue
	data *list.List
}

/* Initialize the queue */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* Enqueue an element */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* Remove and return the front element */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Peek at the front element */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Get the queue size */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* Check whether the queue is empty */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* Return the list for printing */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
