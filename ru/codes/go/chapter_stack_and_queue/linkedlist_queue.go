// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Очередь на основе связного списка */
type linkedListQueue struct {
	// Реализовать очередь с помощью стандартного пакета list
	data *list.List
}

/* Инициализировать очередь */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* Добавить элемент в очередь */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* Извлечь элемент из очереди */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Посмотреть первый элемент очереди */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Получить длину очереди */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* Проверить, пуста ли очередь */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить список для вывода */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
