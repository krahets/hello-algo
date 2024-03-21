// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基于双向链表实现的双向队列 */
type linkedListDeque struct {
	// 使用内置包 list
	data *list.List
}

/* 初始化双端队列 */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 队首元素入队 */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 队尾元素入队 */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 队首元素出队 */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 队尾元素出队 */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 访问队首元素 */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 访问队尾元素 */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 获取队列的长度 */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* 判断队列是否为空 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 获取 List 用于打印 */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
