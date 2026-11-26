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
	// 삽입 순서가 다르면 이진 트리의 모양도 달라진다. 이 순서로 삽입하면 포화 이진 트리가 만들어진다
	for _, num := range nums {
		bst.insert(num)
	}
	fmt.Println("\n초기화한 이진 트리:")
	bst.print()

	// 루트 노드 구하기
	node := bst.getRoot()
	fmt.Println("\n이진 트리의 루트 노드:", node.Val)

	// 노드 탐색
	node = bst.search(7)
	fmt.Println("찾은 노드 객체: ", node, ", 노드 값 = ", node.Val)

	// 노드 삽입
	bst.insert(16)
	fmt.Println("\n노드 16 삽입 후 이진 트리:")
	bst.print()

	// 노드 삭제
	bst.remove(1)
	fmt.Println("\n노드 1 삭제 후 이진 트리:")
	bst.print()
	bst.remove(2)
	fmt.Println("\n노드 2 삭제 후 이진 트리:")
	bst.print()
	bst.remove(4)
	fmt.Println("\n노드 4 삭제 후 이진 트리:")
	bst.print()
}
