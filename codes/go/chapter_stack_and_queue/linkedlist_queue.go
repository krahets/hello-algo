// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"strings"
)

// LinkedListQueue 基于链表实现的栈, 使用内置包 list 来实现栈
type LinkedListQueue struct {
	list *list.List
}

// NewLinkedListQueue 初始化链表
func NewLinkedListQueue() *LinkedListQueue {
	return &LinkedListQueue{
		list: list.New(),
	}
}

// Offer 入队
func (s *LinkedListQueue) Offer(value any) {
	s.list.PushBack(value)
}

// Poll 出队
func (s *LinkedListQueue) Poll() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Front()
	s.list.Remove(e)
	return e.Value
}

// Peek 访问队首元素
func (s *LinkedListQueue) Peek() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Front()
	return e.Value
}

// Size 获取队列的长度
func (s *LinkedListQueue) Size() int {
	return s.list.Len()
}

// IsEmpty 判断队列是否为空
func (s *LinkedListQueue) IsEmpty() bool {
	return s.list.Len() == 0
}

func (s *LinkedListQueue) Print() {
	fmt.Println(s.toString())
}

func (s *LinkedListQueue) toString() any {
	var builder strings.Builder
	if s.IsEmpty() {
		fmt.Println("empty stack")
		return nil
	}
	e := s.list.Front()
	// 强转为 string, 会影响效率
	str := fmt.Sprintf("%v", e.Value)
	for e.Next() != nil {
		builder.WriteString(str + " -> ")
		e = e.Next()
		str = fmt.Sprintf("%v", e.Value)
	}
	builder.WriteString(str)
	return builder.String()
}
