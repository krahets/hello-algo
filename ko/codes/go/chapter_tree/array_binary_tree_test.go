// File: array_binary_tree_test.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestArrayBinaryTree(t *testing.T) {
	// 이진 트리 초기화
	// 배열에서 바로 이진 트리를 만드는 함수를 사용한다
	arr := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
	root := SliceToTree(arr)
	fmt.Println("\n이진 트리 초기화")
	fmt.Println("이진 트리의 배열 표현: ")
	fmt.Println(arr)
	fmt.Println("이진 트리의 연결 리스트 표현: ")
	PrintTree(root)

	// 배열로 이진 트리를 표현하는 클래스
	abt := newArrayBinaryTree(arr)

	// 노드 접근
	i := 1
	l := abt.left(i)
	r := abt.right(i)
	p := abt.parent(i)
	fmt.Println("\n현재 노드의 인덱스: ", i, ", 값: ", abt.val(i))
	fmt.Println("왼쪽 자식의 인덱스: ", l, ", 값: ", abt.val(l))
	fmt.Println("오른쪽 자식의 인덱스: ", r, ", 값: ", abt.val(r))
	fmt.Println("부모 노드의 인덱스: ", p, ", 값: ", abt.val(p))

	// 트리 순회
	res := abt.levelOrder()
	fmt.Println("\n레벨 순회 결과: ", res)
	res = abt.preOrder()
	fmt.Println("전위 순회 결과: ", res)
	res = abt.inOrder()
	fmt.Println("중위 순회 결과: ", res)
	res = abt.postOrder()
	fmt.Println("후위 순회 결과: ", res)
}
