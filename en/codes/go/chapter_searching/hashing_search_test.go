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
	/* Hash lookup in an array */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// Initialize the hash table
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("Index of target 3 = ", index)

	/* Hash lookup in a linked list */
	head := ArrayToLinkedList(nums)
	// Initialize the hash table
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("Node object for target value 3 = ", node)
}
