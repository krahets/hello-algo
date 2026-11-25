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

	// 在陣列中執行循序搜尋
	index := linearSearchArray(nums, target)
	fmt.Println("目標元素 3 的索引 =", index)

	// 在鏈結串列中執行循序搜尋
	head := ArrayToLinkedList(nums)
	node := linearSearchLinkedList(head, target)
	fmt.Println("目標值 3 對應的節點物件為", node)
}
