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
	// Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\nИсходное двоичное дерево:")
	bst.print()

	// Получить корневой узел
	node := bst.getRoot()
	fmt.Println("\nКорневой узел двоичного дерева:", node.Val)

	// Поиск узла
	node = bst.search(7)
	fmt.Println("Найденный объект узла =", node, ", значение узла =", node.Val)

	// Вставка узла
	bst.insert(16)
	fmt.Println("\nПосле вставки узла 16 двоичное дерево имеет вид:")
	bst.print()

	// Удаление узла
	bst.remove(1)
	fmt.Println("\nПосле удаления узла 1 двоичное дерево имеет вид:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nПосле удаления узла 2 двоичное дерево имеет вид:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nПосле удаления узла 4 двоичное дерево имеет вид:")
	bst.print()
}
