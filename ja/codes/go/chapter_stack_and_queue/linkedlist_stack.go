// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 連結リストを使ったスタック */
type linkedListStack struct {
	// 標準ライブラリの list パッケージを使ってスタックを実装する
	data *list.List
}

/* スタックを初期化する */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* プッシュする */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* ポップする */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* スタックのトップを参照する */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* スタックの要素数を取得する */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* スタックが空かどうかを判定する */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* 表示用にリストを取得する */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
