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

	// Perform linear search in array
	index := linearSearchArray(nums, target)
	fmt.Println("Index of target element 3 =", index)

	// Perform linear search in linked list
	head := ArrayToLinkedList(nums)
	node := linearSearchLinkedList(head, target)
	fmt.Println("Node object with target value 3 is", node)
}
