// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Двусторонняя очередь на основе двусвязного списка */
type linkedListDeque struct {
	// Использовать встроенный пакет list
	data *list.List
}

/* Инициализировать двустороннюю очередь */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* голова очередиПоместить элемент в очередь */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* хвост очередиПоместить элемент в очередь */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* голова очередиИзвлечь элемент из очереди */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* хвост очередиИзвлечь элемент из очереди */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Получить элемент в начале очереди */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Обратиться к элементу в хвосте очереди */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Получить длину очереди */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Проверить, пуста ли очередь */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить List для вывода */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
