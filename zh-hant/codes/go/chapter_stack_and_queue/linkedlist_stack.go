// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 以鏈結串列實作堆疊 */
type linkedListStack struct {
	// 使用標準函式庫的 list 套件實作堆疊
	data *list.List
}

/* 初始化堆疊 */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* 推入堆疊 */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* 彈出堆疊頂端的元素 */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 讀取堆疊頂端的元素 */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 取得堆疊長度 */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* 判斷堆疊是否為空 */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* 回傳 list.List 的指標以便輸出 */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
