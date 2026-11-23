// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* 선형 탐색(배열) */
func linearSearchArray(nums []int, target int) int {
	// 배열 순회
	for i := 0; i < len(nums); i++ {
		// 목표 원소를 찾았으므로 해당 인덱스를 반환한다
		if nums[i] == target {
			return i
		}
	}
	// 목표 원소를 찾지 못했으므로 -1을 반환한다
	return -1
}

/* 선형 탐색(연결 리스트) */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// 연결 리스트 순회
	for node != nil {
		// 목표 노드를 찾았으므로 해당 노드를 반환한다
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// 목표 원소를 찾지 못했으므로 nil을 반환한다
	return nil
}
