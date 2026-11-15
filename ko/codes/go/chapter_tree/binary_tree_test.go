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
	/* 이진 트리 초기화 */
	// 노드 초기화
	n1 := NewTreeNode(1)
	n2 := NewTreeNode(2)
	n3 := NewTreeNode(3)
	n4 := NewTreeNode(4)
	n5 := NewTreeNode(5)
	// 노드 사이의 참조(포인터)를 설정한다
	n1.Left = n2
	n1.Right = n3
	n2.Left = n4
	n2.Right = n5
	fmt.Println("이진 트리 초기화")
	PrintTree(n1)

	/* 노드 삽입과 삭제 */
	// 노드 삽입
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	fmt.Println("노드 P를 삽입한 후")
	PrintTree(n1)
	// 노드 삭제
	n1.Left = n2
	fmt.Println("노드 P를 삭제한 후")
	PrintTree(n1)
}
