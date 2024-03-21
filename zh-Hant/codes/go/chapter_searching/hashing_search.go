// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* 哈希查找（数组） */
func hashingSearchArray(m map[int]int, target int) int {
	// 哈希表的 key: 目标元素，value: 索引
	// 若哈希表中无此 key ，返回 -1
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* 哈希查找（链表） */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// 哈希表的 key: 目标节点值，value: 节点对象
	// 若哈希表中无此 key ，返回 nil
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
