// File: preorder_traversal_i_compact_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreorderTraversalICompact(t *testing.T) {
	/* Создаём двоичное дерево */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nСоздаём двоичное дерево")
	PrintTree(root)

	// Прямой обход
	res := make([]*TreeNode, 0)
	preOrderI(root, &res)

	fmt.Println("\nВыводим все узлы со значением 7")
	for _, node := range res {
		fmt.Printf("%v ", node.Val)
	}
	fmt.Println()
}

func TestPreorderTraversalIICompact(t *testing.T) {
	/* Создаём двоичное дерево */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nСоздаём двоичное дерево")
	PrintTree(root)

	// Прямой обход
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderII(root, &res, &path)

	fmt.Println("\nВыводим все пути от корня до узлов со значением 7")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIICompact(t *testing.T) {
	/* Создаём двоичное дерево */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nСоздаём двоичное дерево")
	PrintTree(root)

	// Прямой обход
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderIII(root, &res, &path)

	fmt.Println("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIITemplate(t *testing.T) {
	/* Создаём двоичное дерево */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nСоздаём двоичное дерево")
	PrintTree(root)

	// Поиск с возвратом
	res := make([][]*TreeNode, 0)
	state := make([]*TreeNode, 0)
	choices := make([]*TreeNode, 0)
	choices = append(choices, root)
	backtrackIII(&state, &choices, &res)

	fmt.Println("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}
