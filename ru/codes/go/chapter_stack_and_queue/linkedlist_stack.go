// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Стек на основе связного списка */
type linkedListStack struct {
	// Использовать встроенный пакет list для реализации стека
	data *list.List
}

/* Инициализация стека */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* Поместить в стек */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* Извлечь из стека */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Доступ к верхнему элементу стека */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Получение длины стека */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* Проверка, пуст ли стек */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить List для вывода */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
