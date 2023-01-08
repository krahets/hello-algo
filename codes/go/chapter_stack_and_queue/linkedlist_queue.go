// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基于链表实现的队列 */
type linkedListQueue struct {
	// 使用内置包 list 来实现队列
	data *list.List
}

// newLinkedListQueue 初始化链表
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

// offer 入队
func (s *linkedListQueue) offer(value any) {
	s.data.PushBack(value)
}

// poll 出队
func (s *linkedListQueue) poll() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

// peek 访问队首元素
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

// size 获取队列的长度
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

// isEmpty 判断队列是否为空
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

// 获取 List 用于打印
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
