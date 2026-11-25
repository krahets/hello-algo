// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 連結リストを使ったキュー */
type linkedListQueue struct {
	// 標準ライブラリの list パッケージを使ってキューを実装する
	data *list.List
}

/* キューを初期化する */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* エンキューする */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* デキューする */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* キューの先頭要素を参照する */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* キューの要素数を取得する */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* キューが空かどうかを判定する */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用にリストを取得する */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
