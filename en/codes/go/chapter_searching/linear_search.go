// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Linear search (array) */
func linearSearchArray(nums []int, target int) int {
	// Traverse array
	for i := 0; i < len(nums); i++ {
		// Found the target element, thus return its index
		if nums[i] == target {
			return i
		}
	}
	// Did not find the target element, thus return -1
	return -1
}

/* Linear search (linked list) */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// Traverse the list
	for node != nil {
		// Found the target node, return it
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// If the target element is not found, return nil
	return nil
}
