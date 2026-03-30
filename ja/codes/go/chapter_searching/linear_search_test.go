// File: linear_search_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinearSearch(t *testing.T) {
	target := 3
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}

	// 配列で線形探索を行う
	index := linearSearchArray(nums, target)
	fmt.Println("対象要素 3 のインデックス =", index)

	// 連結リストで線形探索を行う
	head := ArrayToLinkedList(nums)
	node := linearSearchLinkedList(head, target)
	fmt.Println("対象ノード値 3 に対応するノードオブジェクト =", node)
}
