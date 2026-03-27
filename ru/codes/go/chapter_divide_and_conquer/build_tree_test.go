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
	fmt.Print("Предварительный обход = ")
	PrintSlice(preorder)
	fmt.Print("Симметричный обход = ")
	PrintSlice(inorder)

	root := buildTree(preorder, inorder)
	fmt.Println("Построенное двоичное дерево:")
	PrintTree(root)
}
