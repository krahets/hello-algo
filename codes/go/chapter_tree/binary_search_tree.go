// File: binary_search_tree.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
	"sort"
)

type BinarySearchTree struct {
	root *TreeNode
}

func NewBinarySearchTree(nums []int) *BinarySearchTree {
	// 排序数组
	sort.Ints(nums)
	return nil
}
