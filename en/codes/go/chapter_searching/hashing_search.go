// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* Hash search (array) */
func hashingSearchArray(m map[int]int, target int) int {
	// Hash table's key: target element, value: index
	// If the hash table does not contain this key, return -1
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* Hash search (linked list) */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// Hash table key: target node value, value: node object
	// If no key exists in the hash table, return nil
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
