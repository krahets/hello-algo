// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 双方向連結リストを使った両端キュー */
type linkedListDeque struct {
	// 標準ライブラリの list パッケージを使う
	data *list.List
}

/* 両端キューを初期化する */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 先頭に要素を追加する */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 末尾に要素を追加する */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 先頭から要素を取り出す */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 末尾から要素を取り出す */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 両端キューの先頭要素を参照する */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 両端キューの末尾要素を参照する */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 両端キューの要素数を取得する */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* 両端キューが空かどうかを判定する */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用にリストを取得する */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
