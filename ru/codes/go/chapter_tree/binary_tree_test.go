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
	/* Инициализировать двоичное дерево */
	// Инициализироватьузел
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// Построить ссылки между узлами (указатели)
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("Инициализировать двоичное дерево")
	PrintTree(n1)

	/* Вставка и удаление узлов */
	// Вставить узел
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("После вставки узла P")
	PrintTree(n1)
	// Удалить узел
	n1.Left = n2
	fmt.Println("После удаления узла P")
	PrintTree(n1)
}
