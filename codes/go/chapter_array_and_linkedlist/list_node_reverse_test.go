// File: list_node_reverse_test.go
// Created Time: 2024-01-25
// Author: zkw (jonesashbur@gmail.com)
package chapter_array_and_linkedlist

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestReverseList(t *testing.T) {
	// 初始化链表 1->2->3->4->5
	nums := []int{1, 2, 3, 4, 5}
	head := ArrayToLinkedList(nums)

	// 反转链表
	res := reverseList(head)

	// 预期结果 5->4->3->2->1
	expected := []int{5, 4, 3, 2, 1}
	curr := res
	for i := 0; curr != nil && i < len(expected); i++ {
		if curr.Val != expected[i] {
			t.Errorf("反转后的链表与预期不符，位置 %d 处应为 %d，实际为 %d", i, expected[i], curr.Val)
		}
		curr = curr.Next
	}

	// 测试空链表
	if reverseList(nil) != nil {
		t.Error("空链表反转后应为 nil")
	}

	// 测试单节点链表
	single := ArrayToLinkedList([]int{1})
	res = reverseList(single)
	if res.Val != 1 || res.Next != nil {
		t.Error("单节点链表反转后应保持不变")
	}
}
