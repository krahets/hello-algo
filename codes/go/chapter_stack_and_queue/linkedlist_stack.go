// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基于链表实现的栈 */
type linkedListStack struct {
	// 使用内置包 list 来实现栈
	data *list.List
}

// newLinkedListStack 初始化链表
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

// push 入栈
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

// pop 出栈
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

// peek 访问栈顶元素
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

// size 获取栈的长度
func (s *linkedListStack) size() int {
	return s.data.Len()
}

// isEmpty 判断栈是否为空
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

// 获取 List 用于打印
func (s *linkedListStack) toList() *list.List {
	return s.data
}
