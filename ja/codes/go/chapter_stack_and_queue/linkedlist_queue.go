// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 連結リストで実装したキュー */
type linkedListQueue struct {
	// 組み込みパッケージ list でキューを実装する
	data *list.List
}

/* キューを初期化する */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* エンキュー */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* デキュー */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* キューの先頭要素にアクセス */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* キューの長さを取得 */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* キューが空か判定 */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用の List を取得する */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
