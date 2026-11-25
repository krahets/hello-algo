// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* Hash lookup in an array */
func hashingSearchArray(m map[int]int, target int) int {
	// Hash table key: target element, value: index
	// Return -1 if the key is absent
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* Hash lookup in a linked list */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// Hash table key: target node value, value: node object
	// Return nil if the key is absent
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
