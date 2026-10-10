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
	// 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\n初期化した二分木は:")
	bst.print()

	// 根ノードを取得
	node := bst.getRoot()
	fmt.Println("\n二分木の根ノードは:", node.Val)

	// ノードを探索
	node = bst.search(7)
	fmt.Println("見つかったノードオブジェクトは", node, "，ノードの値 =", node.Val)

	// ノードを挿入
	bst.insert(16)
	fmt.Println("\nノード 16 を挿入した後の二分木は:")
	bst.print()

	// ノードを削除
	bst.remove(1)
	fmt.Println("\nノード 1 を削除した後の二分木は:")
	bst.print()
	bst.remove(2)
	fmt.Println("\nノード 2 を削除した後の二分木は:")
	bst.print()
	bst.remove(4)
	fmt.Println("\nノード 4 を削除した後の二分木は:")
	bst.print()
}
