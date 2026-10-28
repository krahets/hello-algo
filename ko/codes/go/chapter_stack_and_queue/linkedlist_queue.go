// File: linkedlist_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"container/list"
)

/* 연결 리스트로 구현한 큐 */
type linkedListQueue struct {
	// 내장 패키지 list로 큐를 구현한다
	data *list.List
}

/* 큐 초기화 */
func newLinkedListQueue() *linkedListQueue {
	return &linkedListQueue{
		data: list.New(),
	}
}

/* 큐에 삽입 */
func (s *linkedListQueue) push(value any) {
	s.data.PushBack(value)
}

/* 큐에서 꺼내기 */
func (s *linkedListQueue) pop() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	s.data.Remove(e)
	return e.Value
}

/* 맨 앞 원소 접근 */
func (s *linkedListQueue) peek() any {
	if s.isEmpty() {
		return nil
	}
	e := s.data.Front()
	return e.Value
}

/* 큐의 길이 반환 */
func (s *linkedListQueue) size() int {
	return s.data.Len()
}

/* 큐가 비어 있는지 판단 */
func (s *linkedListQueue) isEmpty() bool {
	return s.data.Len() == 0
}

/* 출력에 사용할 List 반환 */
func (s *linkedListQueue) toList() *list.List {
	return s.data
}
