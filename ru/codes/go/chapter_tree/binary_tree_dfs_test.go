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
	/* Инициализация двоичного дерева */
	// Здесь используется функция, напрямую строящая двоичное дерево из массива
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nИнициализация двоичного дерева:")
	PrintTree(root)

	// Предварительный обход
	nums = nil
	preOrder(root)
	fmt.Println("\nПоследовательность печати узлов при предварительном обходе =", nums)

	// Симметричный обход
	nums = nil
	inOrder(root)
	fmt.Println("\nПоследовательность печати узлов при симметричном обходе =", nums)

	// Обратный обход
	nums = nil
	postOrder(root)
	fmt.Println("\nПоследовательность печати узлов при обратном обходе =", nums)
}
