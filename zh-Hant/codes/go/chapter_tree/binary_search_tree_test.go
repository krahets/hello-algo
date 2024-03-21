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
	// 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\n初始化的二元樹為:")
	bst.print()

	// 獲取根節點
	node := bst.getRoot()
	fmt.Println("\n二元樹的根節點為:", node.Val)

	// 查詢節點
	node = bst.search(7)
	fmt.Println("查詢到的節點物件為", node, "，節點值 =", node.Val)

	// 插入節點
	bst.insert(16)
	fmt.Println("\n插入節點後 16 的二元樹為:")
	bst.print()

	// 刪除節點
	bst.remove(1)
	fmt.Println("\n刪除節點 1 後的二元樹為:")
	bst.print()
	bst.remove(2)
	fmt.Println("\n刪除節點 2 後的二元樹為:")
	bst.print()
	bst.remove(4)
	fmt.Println("\n刪除節點 4 後的二元樹為:")
	bst.print()
}
