// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* Hash-based search (array) */
func hashingSearchArray(m map[int]int, target int) int {
	// Hash table key: target element; value: index
	// Return -1 if the hash table does not contain this key
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* Hash-based search (linked list) */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// Hash table key: target node value; value: node object
	// Return nil if the hash table does not contain this key
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
