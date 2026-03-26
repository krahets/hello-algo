// File: avl_tree_test.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestAVLTree(t *testing.T) {
	/* Инициализировать пустое AVL-дерево */
	tree := newAVLTree()
	/* Вставить узел */
	// Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
	testInsert(tree, 1)
	testInsert(tree, 2)
	testInsert(tree, 3)
	testInsert(tree, 4)
	testInsert(tree, 5)
	testInsert(tree, 8)
	testInsert(tree, 7)
	testInsert(tree, 9)
	testInsert(tree, 10)
	testInsert(tree, 6)

	/* Вставить повторяющийся узел */
	testInsert(tree, 7)

	/* Удалить узел */
	// Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
	testRemove(tree, 8) // Удалить узел степени 0
	testRemove(tree, 5) // Удалить узел степени 1
	testRemove(tree, 4) // Удалить узел степени 2

	/* Найти узел */
	node := tree.search(7)
	fmt.Printf("\nНайденныйузелобъектравно %#v, значение узла = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nПосле вставки узла %d AVL-дерево имеет вид \n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nПосле удаления узла %d AVL-дерево имеет вид \n", val)
	PrintTree(tree.root)
}
