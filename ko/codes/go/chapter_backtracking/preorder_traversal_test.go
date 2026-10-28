// File: preorder_traversal_i_compact_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreorderTraversalICompact(t *testing.T) {
	/* 이진 트리 초기화 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n이진 트리 초기화")
	PrintTree(root)

	// 전위 순회
	res := make([]*TreeNode, 0)
	preOrderI(root, &res)

	fmt.Println("\n값이 7인 모든 노드 출력")
	for _, node := range res {
		fmt.Printf("%v ", node.Val)
	}
	fmt.Println()
}

func TestPreorderTraversalIICompact(t *testing.T) {
	/* 이진 트리 초기화 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n이진 트리 초기화")
	PrintTree(root)

	// 전위 순회
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderII(root, &res, &path)

	fmt.Println("\n루트 노드에서 노드 7까지의 모든 경로 출력")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIICompact(t *testing.T) {
	/* 이진 트리 초기화 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n이진 트리 초기화")
	PrintTree(root)

	// 전위 순회
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderIII(root, &res, &path)

	fmt.Println("\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIITemplate(t *testing.T) {
	/* 이진 트리 초기화 */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\n이진 트리 초기화")
	PrintTree(root)

	// 백트래킹 알고리즘
	res := make([][]*TreeNode, 0)
	state := make([]*TreeNode, 0)
	choices := make([]*TreeNode, 0)
	choices = append(choices, root)
	backtrackIII(&state, &choices, &res)

	fmt.Println("\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}
