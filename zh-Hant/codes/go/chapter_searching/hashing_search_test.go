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
	/* 哈希查找（数组） */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// 初始化哈希表
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("目标元素 3 的索引 = ", index)

	/* 哈希查找（链表） */
	head := ArrayToLinkedList(nums)
	// 初始化哈希表
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("目标节点值 3 的对应节点对象为 ", node)
}
