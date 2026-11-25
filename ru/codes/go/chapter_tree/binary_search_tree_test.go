// File: binary_search_tree_test.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"
)

func TestBinarySearchTree(t *testing.T) {
	bst := newBinarySearchTree()
	nums := []int{8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15}
	// От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\nИсходное двоичное дерево:")
	bst.print()

	// Получить корень
	node := bst.getRoot()
	fmt.Println("\nКорень двоичного дерева:", node.Val)

	// Поиск узла
	node = bst.search(7)
	fmt.Println("Найденный узел:", node, "значение узла =", node.Val)

	// Вставка узла
	bst.insert(16)
	fmt.Println("\nДвоичное дерево после вставки узла 16:")
	bst.print()

	// Удаление узла
	bst.remove(1)
	fmt.Println("\nДвоичное дерево после удаления узла 1:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nДвоичное дерево после удаления узла 2:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nДвоичное дерево после удаления узла 4:")
	bst.print()
}
