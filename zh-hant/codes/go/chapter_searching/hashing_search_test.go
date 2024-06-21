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
	/* 雜湊查詢（陣列） */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// 初始化雜湊表
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("目標元素 3 的索引 = ", index)

	/* 雜湊查詢（鏈結串列） */
	head := ArrayToLinkedList(nums)
	// 初始化雜湊表
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("目標節點值 3 的對應節點物件為 ", node)
}
