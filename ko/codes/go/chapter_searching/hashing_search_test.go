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
	/* 해시 탐색(배열) */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// 해시 테이블 초기화
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("목표 원소 3의 인덱스 = ", index)

	/* 해시 탐색(연결 리스트) */
	head := ArrayToLinkedList(nums)
	// 해시 테이블 초기화
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("목표 노드 값 3에 해당하는 노드 객체 ", node)
}
