// File: binary_tree_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestBinaryTree(t *testing.T) {
	// [region]{init_binary_tree}
	/* Инициализация двоичного дерева */
	// Инициализация узла
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// Построить связи между узлами (указатели)
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	// [endregion]{init_binary_tree}
	fmt.Println("Инициализация двоичного дерева")
	PrintTree(n1)

	// [region]{insert_node}
	/* Вставка и удаление узлов */
	// Вставить узел P между n1 -> n2
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	// [endregion]{insert_node}
	fmt.Println("После вставки узла P")
	PrintTree(n1)
	// [region]{remove_node}
	// Удалить узел P
	n1.Left = n2
	// [endregion]{remove_node}
	fmt.Println("После удаления узла P")
	PrintTree(n1)
}
