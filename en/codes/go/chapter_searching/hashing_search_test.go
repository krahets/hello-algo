// File: hashing_search_test.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashingSearch(t *testing.T) {
	target := 3
	/* Hash search (array) */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// Initialize hash table
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("Index of target element 3 = ", index)

	/* Hash search (linked list) */
	head := ArrayToLinkedList(nums)
	// Initialize hash table
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("Node object corresponding to target node value 3 is ", node)
}
