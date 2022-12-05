// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

// LinkedListDeque 基于链表实现的双端队列, 使用内置包 list 来实现栈
type LinkedListDeque struct {
	data *list.List
}

// NewLinkedListDeque 初始化双端队列
func NewLinkedListDeque() *LinkedListDeque {
	return &LinkedListDeque{
		data: list.New(),
	}
}

// OfferFirst 队首元素入队
func (s *LinkedListDeque) OfferFirst(value any) {
	s.data.PushFront(value)
}

// OfferLast 队尾元素入队
func (s *LinkedListDeque) OfferLast(value any) {
	s.data.PushBack(value)
}

// PollFirst 队首元素出队
func (s *LinkedListDeque) PollFirst() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

// PollLast 队尾元素出队
func (s *LinkedListDeque) PollLast() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

// PeekFirst 访问队首元素
func (s *LinkedListDeque) PeekFirst() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

// PeekLast 访问队尾元素
func (s *LinkedListDeque) PeekLast() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

// Size 获取队列的长度
func (s *LinkedListDeque) Size() int {
	return s.data.Len()
}

// IsEmpty 判断队列是否为空
func (s *LinkedListDeque) IsEmpty() bool {
	return s.data.Len() == 0
}

// 获取 List 用于打印
func (s *LinkedListDeque) toList() *list.List {
	return s.data
}
