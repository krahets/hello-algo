// File: tree_node_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"fmt"
	"testing"
)

func TestTreeNode(t *testing.T) {
	arr := []any{1, 2, 3, nil, 5, 6, nil}
	node := SliceToTree(arr)

	// 印出二元樹
	PrintTree(node)

	// 將二元樹轉為切片
	fmt.Println(TreeToSlice(node))
}
