// File: linkedlist_stack.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 연결 리스트로 구현한 스택 */
type linkedListStack struct {
	// 내장 패키지 list로 스택을 구현한다
	data *list.List
}

/* 스택 초기화 */
func newLinkedListStack() *linkedListStack {
	return &linkedListStack{
		data: list.New(),
	}
}

/* 스택에 삽입 */
func (s *linkedListStack) push(value int) {
	s.data.PushBack(value)
}

/* 스택에서 꺼내기 */
func (s *linkedListStack) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 스택 맨 위 원소 접근 */
func (s *linkedListStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 스택의 길이 반환 */
func (s *linkedListStack) size() int {
	return s.data.Len()
}

/* 스택이 비어 있는지 판단 */
func (s *linkedListStack) isEmpty() bool {
	return s.data.Len() == 0
}

/* 출력에 사용할 List 반환 */
func (s *linkedListStack) toList() *list.List {
	return s.data
}
