// File: list_node_merge_test.go
// Created Time: 2024-01-25
// Author: zkw (jonesashbur@gmail.com)
package chapter_array_and_linkedlist

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestMergeTwoLists(t *testing.T) {
	// 测试用例1：常规有序链表合并
	nums1 := []int{1, 3, 5}
	nums2 := []int{2, 4, 6}
	l1 := ArrayToLinkedList(nums1)
	l2 := ArrayToLinkedList(nums2)
	res := mergeTwoLists(l1, l2)
	expected := []int{1, 2, 3, 4, 5, 6}
	curr := res
	for i := 0; curr != nil && i < len(expected); i++ {
		if curr.Val != expected[i] {
			t.Errorf("合并后的链表与预期不符，位置 %d 处应为 %d，实际为 %d", i, expected[i], curr.Val)
		}
		curr = curr.Next
	}

	// 测试用例2：空链表合并
	if mergeTwoLists(nil, nil) != nil {
		t.Error("两个空链表合并后应为 nil")
	}

	// 测试用例3：一个空链表与非空链表合并
	nums3 := []int{1, 2, 3}
	l3 := ArrayToLinkedList(nums3)
	res = mergeTwoLists(l3, nil)
	expected = nums3
	curr = res
	for i := 0; curr != nil && i < len(expected); i++ {
		if curr.Val != expected[i] {
			t.Errorf("合并后的链表与预期不符，位置 %d 处应为 %d，实际为 %d", i, expected[i], curr.Val)
		}
		curr = curr.Next
	}

	// 测试用例4：单节点链表合并
	single1 := ArrayToLinkedList([]int{1})
	single2 := ArrayToLinkedList([]int{2})
	res = mergeTwoLists(single1, single2)
	expected = []int{1, 2}
	curr = res
	for i := 0; curr != nil && i < len(expected); i++ {
		if curr.Val != expected[i] {
			t.Errorf("合并后的链表与预期不符，位置 %d 处应为 %d，实际为 %d", i, expected[i], curr.Val)
		}
		curr = curr.Next
	}
}
