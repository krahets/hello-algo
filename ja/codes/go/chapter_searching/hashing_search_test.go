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
	/* ハッシュ探索（配列） */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// ハッシュテーブルを初期化
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("対象要素 3 のインデックス = ", index)

	/* ハッシュ探索（連結リスト） */
	head := ArrayToLinkedList(nums)
	// ハッシュテーブルを初期化
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("対象ノード値 3 に対応するノードオブジェクト = ", node)
}
