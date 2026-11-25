// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 以鏈結串列實作佇列 */
type linkedListQueue struct {
	// 使用標準函式庫的 list 套件實作佇列
	data *list.List
}

/* 初始化佇列 */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* 入隊 */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* 出隊 */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 讀取隊首元素 */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 取得佇列長度 */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* 判斷佇列是否為空 */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* 回傳 list.List 的指標以便輸出 */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
