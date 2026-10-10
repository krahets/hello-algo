// File: binary_tree_bfs_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLevelOrder(t *testing.T) {
	/* Инициализация двоичного дерева */
	// Здесь используется функция, напрямую строящая двоичное дерево из массива
	root := SliceToTree([]any{1, 2, 3, 4, 5, 6, 7})
	fmt.Println("\nИнициализация двоичного дерева:")
	PrintTree(root)

	// Обход в ширину
	nums := levelOrder(root)
	fmt.Println("\nПоследовательность печати узлов при обходе в ширину =", nums)
}
