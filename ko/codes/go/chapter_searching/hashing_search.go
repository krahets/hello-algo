// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* 해시 탐색(배열) */
func hashingSearchArray(m map[int]int, target int) int {
	// 해시 테이블의 key: 목표 원소, value: 인덱스
	// 해시 테이블에 해당 key가 없으면 -1을 반환한다
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* 해시 탐색(연결 리스트) */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
	// 해시 테이블에 해당 key가 없으면 nil을 반환한다
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
