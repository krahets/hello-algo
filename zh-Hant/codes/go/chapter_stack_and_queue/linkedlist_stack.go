// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 基於鏈結串列實現的堆疊 */
type linkedListStack struct {
	// 使用內建包 list 來實現堆疊
	data *list.List
}

/* 初始化堆疊 */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* 入堆疊 */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* 出堆疊 */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 訪問堆疊頂元素 */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 獲取堆疊的長度 */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* 判斷堆疊是否為空 */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* 獲取 List 用於列印 */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
