// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Linear search (array) */
func linearSearchArray(nums []int, target int) int {
	// Traverse the array
	for i := 0; i < len(nums); i++ {
		// The target element was found; return its index
		if nums[i] == target {
			return i
		}
	}
	// The target element was not found; return -1
	return -1
}

/* Linear search (linked list) */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// Traverse the linked list
	for node != nil {
		// The target node was found; return it
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// The target element was not found; return nil
	return nil
}
