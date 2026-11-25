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
	/* Инициализация пустого АВЛ-дерева */
	tree := newAVLTree()
	/* Вставка узла */
	// Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
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

	/* Вставка повторяющегося узла */
	testInsert(tree, 7)

	/* Удаление узла */
	// Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
	testRemove(tree, 8) // Удаление узла без потомков
	testRemove(tree, 5) // Удаление узла с одним потомком
	testRemove(tree, 4) // Удаление узла с двумя потомками

	/* Поиск узла */
	node := tree.search(7)
	fmt.Printf("\nНайденный узел: %#v, значение узла = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\nАВЛ-дерево после вставки узла %d:\n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\nАВЛ-дерево после удаления узла %d:\n", val)
	PrintTree(tree.root)
}
