// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基於鏈結串列實現的佇列 */
type linkedListQueue struct {
	// 使用內建包 list 來實現佇列
	data *list.List
}

/* 初始化佇列 */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* 入列 */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* 出列 */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 訪問佇列首元素 */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 獲取佇列的長度 */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* 判斷佇列是否為空 */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* 獲取 List 用於列印 */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
