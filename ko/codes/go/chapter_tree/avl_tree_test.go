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
	/* 빈 AVL 트리 초기화 */
	tree := newAVLTree()
	/* 노드 삽입 */
	// 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
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

	/* 중복 노드 삽입 */
	testInsert(tree, 7)

	/* 노드 삭제 */
	// 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
	testRemove(tree, 8) // 차수가 0인 노드 삭제
	testRemove(tree, 5) // 차수가 1인 노드 삭제
	testRemove(tree, 4) // 차수가 2인 노드 삭제

	/* 노드 조회 */
	node := tree.search(7)
	fmt.Printf("\n찾은 노드 객체: %#v, 노드 값 = %d \n", node, node.Val)
}

func testInsert(tree *aVLTree, val int) {
	tree.insert(val)
	fmt.Printf("\n노드 %d 삽입 후의 AVL 트리\n", val)
	PrintTree(tree.root)
}

func testRemove(tree *aVLTree, val int) {
	tree.remove(val)
	fmt.Printf("\n노드 %d 삭제 후의 AVL 트리\n", val)
	PrintTree(tree.root)
}
