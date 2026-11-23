// File: binary_tree_dfs.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

var nums []any

/* 전위 순회 */
func preOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
	nums = append(nums, node.Val)
	preOrder(node.Left)
	preOrder(node.Right)
}

/* 중위 순회 */
func inOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
	inOrder(node.Left)
	nums = append(nums, node.Val)
	inOrder(node.Right)
}

/* 후위 순회 */
func postOrder(node *TreeNode) {
	if node == nil {
		return
	}
	// 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
	postOrder(node.Left)
	postOrder(node.Right)
	nums = append(nums, node.Val)
}
