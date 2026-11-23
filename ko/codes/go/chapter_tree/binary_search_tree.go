// File: binary_search_tree.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	. "github.com/krahets/hello-algo/pkg"
)

type binarySearchTree struct {
	root *TreeNode
}

func newBinarySearchTree() *binarySearchTree {
	bst := &binarySearchTree{}
	// 빈 트리를 초기화한다
	bst.root = nil
	return bst
}

/* 루트 노드 반환 */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* 노드 탐색 */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// 반복하여 탐색하다 리프 노드를 지나면 종료한다
	for node != nil {
		if node.Val.(int) < num {
			// 목표 노드는 cur의 오른쪽 서브트리에 있다
			node = node.Right
		} else if node.Val.(int) > num {
			// 목표 노드는 cur의 왼쪽 서브트리에 있다
			node = node.Left
		} else {
			// 목표 노드를 찾았으므로 반복문을 종료한다
			break
		}
	}
	// 목표 노드를 반환한다
	return node
}

/* 노드 삽입 */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// 트리가 비어 있으면 루트 노드를 초기화한다
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// 삽입할 노드의 부모가 될 노드 위치
	var pre *TreeNode = nil
	// 반복하여 탐색하다 리프 노드를 지나면 종료한다
	for cur != nil {
		if cur.Val == num {
			return
		}
		pre = cur
		if cur.Val.(int) < num {
			cur = cur.Right
		} else {
			cur = cur.Left
		}
	}
	// 노드 삽입
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* 노드 삭제 */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// 트리가 비어 있으면 바로 반환하여 종료한다
	if cur == nil {
		return
	}
	// 삭제할 노드의 부모 노드 위치
	var pre *TreeNode = nil
	// 반복하여 탐색하다 리프 노드를 지나면 종료한다
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// 삭제할 노드는 오른쪽 서브트리에 있다
			cur = cur.Right
		} else {
			// 삭제할 노드는 왼쪽 서브트리에 있다
			cur = cur.Left
		}
	}
	// 삭제할 노드가 없으면 바로 반환한다
	if cur == nil {
		return
	}
	// 자식 노드 수가 0 또는 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 삭제할 노드의 자식 노드를 구한다
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// 노드 cur를 삭제한다
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
			bst.root = child
		}
		// 자식 노드 수가 2
	} else {
		// 중위 순회에서 삭제할 노드 cur의 다음 노드를 구한다
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// 노드 tmp를 재귀적으로 삭제한다
		bst.remove(tmp.Val.(int))
		// tmp로 cur를 덮어쓴다
		cur.Val = tmp.Val
	}
}

/* 이진 탐색 트리 출력 */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
