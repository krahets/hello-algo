// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"strings"
)

// LinkedListStack 基于链表实现的栈, 使用内置包 list 来实现栈
type LinkedListStack struct {
	list *list.List
}

// NewLinkedListStack 初始化链表
func NewLinkedListStack() *LinkedListStack {
	return &LinkedListStack{
		list: list.New(),
	}
}

// Push 入栈
func (s *LinkedListStack) Push(value int) {
	s.list.PushBack(value)
}

// Pop 出栈
func (s *LinkedListStack) Pop() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Back()
	s.list.Remove(e)
	return e.Value
}

// Peek 访问栈顶元素
func (s *LinkedListStack) Peek() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Back()
	return e.Value
}

// Size 获取栈的长度
func (s *LinkedListStack) Size() int {
	return s.list.Len()
}

// IsEmpty 判断栈是否为空
func (s *LinkedListStack) IsEmpty() bool {
	return s.list.Len() == 0
}

func (s *LinkedListStack) Print() {
	fmt.Println(s.toString())
}

func (s *LinkedListStack) toString() string {
	var builder strings.Builder
	if s.IsEmpty() {
		fmt.Println("empty stack")
	}
	e := s.list.Back()
	// 强转为 string, 会影响效率
	str := fmt.Sprintf("%v", e.Value)
	for e.Prev() != nil {
		builder.WriteString(str + " -> ")
		e = e.Prev()
		str = fmt.Sprintf("%v", e.Value)
	}
	builder.WriteString(str)
	return builder.String()
}
