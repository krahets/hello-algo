// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 以雙向鏈結串列實作雙端佇列 */
type linkedListDeque struct {
	// 使用標準函式庫的 list 套件
	data *list.List
}

/* 初始化雙端佇列 */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 從隊首加入元素 */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 從隊尾加入元素 */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 從隊首取出元素 */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 從隊尾取出元素 */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 讀取隊首元素 */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 讀取隊尾元素 */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 取得雙端佇列長度 */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* 判斷雙端佇列是否為空 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 回傳 list.List 的指標以便輸出 */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
