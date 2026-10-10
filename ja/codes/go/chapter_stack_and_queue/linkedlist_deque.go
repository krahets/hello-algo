// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 双方向連結リストベースの両端キュー */
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

/* キュー先頭に要素を追加する */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* キュー末尾に要素を追加する */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 先頭要素を取り出す */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 末尾要素を取り出す */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* キュー先頭の要素にアクセス */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* キュー末尾の要素にアクセス */
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

/* キューが空かどうかを判定 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用に List を取得 */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
