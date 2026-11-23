// File: linkedlist_deque.go
// Created Time: 2022-11-29
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 이중 연결 리스트로 구현한 덱 */
type linkedListDeque struct {
	// 내장 패키지 list를 사용한다
	data *list.List
}

/* 덱 초기화 */
func newLinkedListDeque() *linkedListDeque {
	return &linkedListDeque{
		data: list.New(),
	}
}

/* 맨 앞에 원소 삽입 */
func (s *linkedListDeque) pushFirst(value any) {
	s.data.PushFront(value)
}

/* 맨 뒤에 원소 삽입 */
func (s *linkedListDeque) pushLast(value any) {
	s.data.PushBack(value)
}

/* 맨 앞 원소를 꺼낸다 */
func (s *linkedListDeque) popFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 맨 뒤 원소를 꺼낸다 */
func (s *linkedListDeque) popLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	s.data.Remove(e)
	return e.Value
}

/* 맨 앞 원소 접근 */
func (s *linkedListDeque) peekFirst() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 맨 뒤 원소 접근 */
func (s *linkedListDeque) peekLast() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Back()
	return e.Value
}

/* 큐의 길이 반환 */
func (s *linkedListDeque) size() int {
	return s.data.Len()
}

/* 큐가 비어 있는지 판단 */
func (s *linkedListDeque) isEmpty() bool {
	return s.data.Len() == 0
}

/* 출력에 사용할 List 반환 */
func (s *linkedListDeque) toList() *list.List {
	return s.data
}
