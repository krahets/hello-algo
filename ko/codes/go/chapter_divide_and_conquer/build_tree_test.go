// File: build_tree_test.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestBuildTree(t *testing.T) {
	preorder := []int{3, 9, 2, 1, 7}
	inorder := []int{9, 3, 1, 2, 7}
	fmt.Print("전위 순회 = ")
	PrintSlice(preorder)
	fmt.Print("중위 순회 = ")
	PrintSlice(inorder)

	root := buildTree(preorder, inorder)
	fmt.Println("구성한 이진 트리:")
	PrintTree(root)
}
