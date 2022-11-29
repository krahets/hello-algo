// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
	"fmt"
	"strings"
)

// LinkedListDeque 基于链表实现的双端队列, 使用内置包 list 来实现栈
type LinkedListDeque struct {
	list *list.List
}

// NewLinkedListDeque 初始化双端队列
func NewLinkedListDeque() *LinkedListDeque {
	return &LinkedListDeque{
		list: list.New(),
	}
}

// OfferFirst 元素入队
func (s *LinkedListDeque) OfferFirst(value any) {
	s.list.PushFront(value)
}

// OfferLast 元素入队
func (s *LinkedListDeque) OfferLast(value any) {
	s.list.PushBack(value)
}

// PollFirst 元素出队
func (s *LinkedListDeque) PollFirst() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Front()
	s.list.Remove(e)
	return e.Value
}

// PollLast 元素出队
func (s *LinkedListDeque) PollLast() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Back()
	s.list.Remove(e)
	return e.Value
}

// PeekFirst 访问首元素
func (s *LinkedListDeque) PeekFirst() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Front()
	return e.Value
}

// PeekLast 访问尾元素
func (s *LinkedListDeque) PeekLast() any {
	if s.IsEmpty() {
		return nil
	}
	e := s.list.Back()
	return e.Value
}

// Size 获取队列的长度
func (s *LinkedListDeque) Size() int {
	return s.list.Len()
}

// IsEmpty 判断队列是否为空
func (s *LinkedListDeque) IsEmpty() bool {
	return s.list.Len() == 0
}

func (s *LinkedListDeque) Print() {
	fmt.Println(s.toString())
}

func (s *LinkedListDeque) toString() string {
	var builder strings.Builder
	if s.IsEmpty() {
		fmt.Println("empty stack")
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
