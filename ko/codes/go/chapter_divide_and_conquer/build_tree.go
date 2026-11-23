// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* 이진 트리 구성: 분할 정복 */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// 서브트리 구간이 비어 있으면 종료한다
	if r-l < 0 {
		return nil
	}
	// 루트 노드를 초기화한다
	root := NewTreeNode(preorder[i])
	// m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
	m := inorderMap[preorder[i]]
	// 부분 문제: 왼쪽 서브트리 구성
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// 부분 문제: 오른쪽 서브트리 구성
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// 루트 노드를 반환한다
	return root
}

/* 이진 트리 구성 */
func buildTree(preorder, inorder []int) *TreeNode {
	// inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
