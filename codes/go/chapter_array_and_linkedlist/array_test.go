// File: array_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

func TestArray(t *testing.T) {
	nums := make([]int, 5)
	fmt.Println("randomAccess:", randomAccess(nums))

	fmt.Println("extend:", extend(nums, 5))

	insert(nums, 5, 2, 2)
	fmt.Println("after insert:", nums)

	remove(nums, 5, 2)
	fmt.Println("after remove:", nums)

	fmt.Println("traverse nums:")
	traverse(nums)

	fmt.Println("find value 2 key:", find(nums, 2))
}
