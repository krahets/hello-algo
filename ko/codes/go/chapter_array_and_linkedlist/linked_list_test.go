// File: linked_list_test.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinkedList(t *testing.T) {
	/* 연결 리스트 1 -> 3 -> 2 -> 5 -> 4 초기화 */
	// 각 노드를 초기화한다
	n0 := NewListNode(1)
	n1 := NewListNode(3)
	n2 := NewListNode(2)
	n3 := NewListNode(5)
	n4 := NewListNode(4)

	// 노드 사이의 참조를 설정한다
	n0.Next = n1
	n1.Next = n2
	n2.Next = n3
	n3.Next = n4
	fmt.Println("초기화한 연결 리스트")
	PrintLinkedList(n0)

	/* 노드 삽입 */
	insertNode(n0, NewListNode(0))
	fmt.Println("노드를 삽입한 후의 연결 리스트")
	PrintLinkedList(n0)

	/* 노드 삭제 */
	removeItem(n0)
	fmt.Println("노드를 삭제한 후의 연결 리스트")
	PrintLinkedList(n0)

	/* 노드 접근 */
	node := access(n0, 3)
	fmt.Println("연결 리스트에서 인덱스 3에 있는 노드의 값 =", node)

	/* 노드 탐색 */
	index := findNode(n0, 2)
	fmt.Println("연결 리스트에서 값이 2인 노드의 인덱스 =", index)
}
