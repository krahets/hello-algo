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

	// 트리를 출력한다
	PrintTree(node)

	// 트리를 배열로 변환한다
	fmt.Println(TreeToSlice(node))
}
