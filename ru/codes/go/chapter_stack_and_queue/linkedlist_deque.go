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

/* Поместить элемент в голову очереди */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* Поместить элемент в хвост очереди */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* Извлечь элемент из головы очереди */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* Извлечь элемент из хвоста очереди */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Доступ к элементу в начале очереди */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* Доступ к элементу в конце очереди */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Получение длины очереди */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* Проверка, пуста ли очередь */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить List для вывода */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
