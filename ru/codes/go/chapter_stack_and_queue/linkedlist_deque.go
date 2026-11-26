// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Двусторонняя очередь (дек) на основе двусвязного списка */
type linkedListDeque struct {
	// Использовать стандартный пакет list
	data *list.List
}

/* Инициализировать дек */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* Добавить элемент в начало дека */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* Добавить элемент в конец дека */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* Извлечь элемент из начала дека */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Извлечь элемент из конца дека */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Посмотреть первый элемент дека */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Посмотреть последний элемент дека */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Получить длину дека */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Проверить, пуст ли дек */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить список для вывода */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
