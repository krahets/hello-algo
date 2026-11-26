// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* Стек на основе связного списка */
type linkedListStack struct {
	// Реализовать стек с помощью стандартного пакета list
	data *list.List
}

/* Инициализировать стек */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* Поместить элемент в стек */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* Снять элемент со стека */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* Посмотреть элемент на вершине стека */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* Получить размер стека */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* Проверить, пуст ли стек */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* Получить список для вывода */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
