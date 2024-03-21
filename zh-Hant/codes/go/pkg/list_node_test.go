// File: list_node_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"fmt"
	"testing"
)

func TestListNode(t *testing.T) {
	arr := []int{2, 3, 5, 6, 7}
	head := ArrayToLinkedList(arr)

	PrintLinkedList(head)
	node := GetListNode(head, 5)
	fmt.Println("Find node: ", node.Val)
}
