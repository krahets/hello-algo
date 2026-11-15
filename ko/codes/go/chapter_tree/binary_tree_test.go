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
	// [region]{init_binary_tree}
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
	// [endregion]{init_binary_tree}
	fmt.Println("이진 트리 초기화")
	PrintTree(n1)

	// [region]{insert_node}
	/* 노드 삽입과 삭제 */
	// n1 -> n2 사이에 노드 P를 삽입한다
	p := NewTreeNode(0)
	n1.Left = p
	p.Left = n2
	// [endregion]{insert_node}
	fmt.Println("노드 P를 삽입한 후")
	PrintTree(n1)
	// [region]{remove_node}
	// 노드 P를 삭제한다
	n1.Left = n2
	// [endregion]{remove_node}
	fmt.Println("노드 P를 삭제한 후")
	PrintTree(n1)
}
