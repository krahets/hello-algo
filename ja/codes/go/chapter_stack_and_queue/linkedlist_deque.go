// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 双方向連結リストで実装した両端キュー */
type linkedListDeque struct {
	// 組み込みパッケージ list を使う
	data *list.List
}

/* 両端キューを初期化する */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 先頭に要素をエンキューする */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 末尾に要素をエンキューする */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* キューの先頭要素をデキューする */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* キューの末尾要素をデキューする */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* キューの先頭要素にアクセス */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* キューの末尾要素にアクセスする */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* キューの長さを取得 */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* キューが空か判定 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用の List を取得する */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
