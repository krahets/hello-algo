// File: linear_search_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinearSearch(t *testing.T) {
	target := 3
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}

	// 在数组中执行线性查找
	index := linerSearchArray(nums, target)
	t.Log("目标元素 3 的索引 =", index)

	// 在链表中执行线性查找
	head := ArrayToLinkedList(nums)
	node := linerSearchLinkedList(head, target)
	t.Log("目标结点值 3 的对应结点对象为", node)
}
