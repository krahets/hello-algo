// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基於雙向鏈結串列實現的雙向佇列 */
type linkedListDeque struct {
	// 使用內建包 list
	data *list.List
}

/* 初始化雙端佇列 */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 佇列首元素入列 */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 佇列尾元素入列 */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 佇列首元素出列 */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 佇列尾元素出列 */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 訪問佇列首元素 */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 訪問佇列尾元素 */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 獲取佇列的長度 */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* 判斷佇列是否為空 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 獲取 List 用於列印 */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
