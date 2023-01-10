// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

// linkedListDeque 基于链表实现的双端队列, 使用内置包 list 来实现栈
type linkedListDeque struct {
	data *list.List
}

// newLinkedListDeque 初始化双端队列
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

// offerFirst 队首元素入队
func (s *linkedListDeque) offerFirst(value any) {
	s.data.PushFront(value)
}

// offerLast 队尾元素入队
func (s *linkedListDeque) offerLast(value any) {
	s.data.PushBack(value)
}

// pollFirst 队首元素出队
func (s *linkedListDeque) pollFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

// pollLast 队尾元素出队
func (s *linkedListDeque) pollLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

// peekFirst 访问队首元素
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

// peekLast 访问队尾元素
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

// size 获取队列的长度
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

// isEmpty 判断队列是否为空
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

// 获取 List 用于打印
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
