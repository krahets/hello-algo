// File: tree_node_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"fmt"
	"testing"
)

func TestTreeNode(t *testing.T) {
	arr := []int{2, 3, 5, 6, 7}
	node := ArrayToTree(arr)

	// print tree
	PrintTree(node)

	// tree to arr
	fmt.Println(TreeToArray(node))
}
