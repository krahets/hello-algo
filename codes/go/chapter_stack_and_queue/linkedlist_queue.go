// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基于链表实现的队列 */
type LinkedListQueue struct {
	// 使用内置包 list 来实现队列
	data *list.List
}

// NewLinkedListQueue 初始化链表
func NewLinkedListQueue() *LinkedListQueue {
	return &LinkedListQueue{
		data: list.New(),
	}
}

// Offer 入队
func (s *LinkedListQueue) Offer(value any) {
	s.data.PushBack(value)
}

// Poll 出队
func (s *LinkedListQueue) Poll() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

// Peek 访问队首元素
func (s *LinkedListQueue) Peek() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

// Size 获取队列的长度
func (s *LinkedListQueue) Size() int {
	return s.data.Len()
}

// IsEmpty 判断队列是否为空
func (s *LinkedListQueue) IsEmpty() bool {
	return s.data.Len() == 0
}

// 获取 List 用于打印
func (s *LinkedListQueue) toList() *list.List {
	return s.data
}
