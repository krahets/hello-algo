// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Очередь на основе связного списка */
type linkedListQueue struct {
	// Использовать встроенный пакет list для реализации очереди
	data *list.List
}

/* Инициализация очереди */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* Поместить в очередь */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* Извлечь из очереди */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Доступ к элементу в начале очереди */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Получение длины очереди */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* Проверка, пуста ли очередь */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить List для вывода */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
