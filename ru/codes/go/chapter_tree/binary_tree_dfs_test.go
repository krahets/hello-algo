// File: binary_tree_dfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreInPostOrderTraversal(t *testing.T) {
	/* Инициализировать двоичное дерево */
	// Здесь используется функция, которая напрямую строит двоичное дерево из массива
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nИнициализировать двоичное дерево:")
	PrintTree(root)

	// Прямой обход
	nums = nil
	preOrder(root)
	fmt.Println("\nПоследовательность узлов при прямом обходе =", nums)

	// Симметричный обход
	nums = nil
	inOrder(root)
	fmt.Println("\nПоследовательность узлов при симметричном обходе =", nums)

	// Обратный обход
	nums = nil
	postOrder(root)
	fmt.Println("\nПоследовательность узлов при обратном обходе =", nums)
}
