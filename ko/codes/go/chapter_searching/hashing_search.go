// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* 배열에서의 해시 탐색 */
func hashingSearchArray(m map[int]int, target int) int {
	// 해시 테이블의 key는 목표 원소, value는 인덱스다.
	// 해시 테이블에 해당 키가 없으면 -1을 반환한다.
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* 연결 리스트에서의 해시 탐색 */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
	// 해시 테이블에 해당 키가 없으면 nil을 반환한다.
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
