// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL 트리 */
type aVLTree struct {
	// 루트 노드
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* 노드 높이 구하기 */
func (t *aVLTree) height(node *TreeNode) int {
	// 빈 노드의 높이는 -1, 리프 노드의 높이는 0이다
	if node != nil {
		return node.Height
	}
	return -1
}

/* 노드 높이 갱신 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 노드 높이는 가장 높은 서브트리의 높이에 1을 더한 값이다
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 균형 인수 구하기 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 빈 노드의 균형 인수는 0이다
	if node == nil {
		return 0
	}
	// 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
	return t.height(node.Left) - t.height(node.Right)
}

/* 오른쪽 회전 연산 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// child를 축으로 node를 오른쪽으로 회전한다
	child.Right = node
	node.Left = grandChild
	// 노드 높이 갱신
	t.updateHeight(node)
	t.updateHeight(child)
	// 회전 후 서브트리의 루트 노드를 반환한다
	return child
}

/* 왼쪽 회전 연산 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// child를 축으로 node를 왼쪽으로 회전한다
	child.Left = node
	node.Right = grandChild
	// 노드 높이 갱신
	t.updateHeight(node)
	t.updateHeight(child)
	// 회전 후 서브트리의 루트 노드를 반환한다
	return child
}

/* 회전으로 이 서브트리의 균형을 회복한다 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 노드 node의 균형 인수를 구한다
	// Go에서는 짧은 변수명을 권장한다. 여기서 bf는 t.balanceFactor를 가리킨다
	bf := t.balanceFactor(node)
	// 왼쪽으로 치우친 트리
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 오른쪽 회전
			return t.rightRotate(node)
		} else {
			// 왼쪽 회전 후 오른쪽 회전
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// 오른쪽으로 치우친 트리
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// 왼쪽 회전
			return t.leftRotate(node)
		} else {
			// 오른쪽 회전 후 왼쪽 회전
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 균형이 잡혔으므로 회전 없이 바로 반환한다
	return node
}

/* 노드 삽입 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 재귀적 노드 삽입(보조 함수) */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 삽입 위치를 찾아 노드를 삽입한다 */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 중복 노드는 삽입하지 않고 바로 반환한다
		return node
	}
	// 노드 높이 갱신
	t.updateHeight(node)
	/* 2. 회전으로 이 서브트리의 균형을 회복한다 */
	node = t.rotate(node)
	// 서브트리의 루트 노드를 반환한다
	return node
}

/* 노드 삭제 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 재귀적 노드 삭제(보조 함수) */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. 노드를 찾아 삭제한다 */
	if val < node.Val.(int) {
		node.Left = t.removeHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.removeHelper(node.Right, val)
	} else {
		if node.Left == nil || node.Right == nil {
			child := node.Left
			if node.Right != nil {
				child = node.Right
			}
			if child == nil {
				// 자식 수 = 0. node를 바로 삭제하고 반환한다
				return nil
			} else {
				// 자식 수 = 1. node를 바로 삭제한다
				node = child
			}
		} else {
			// 자식 수 = 2. 중위 순회에서 다음에 오는 노드를 삭제하고 그 값으로 현재 노드의 값을 대체한다
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// 노드 높이 갱신
	t.updateHeight(node)
	/* 2. 회전으로 이 서브트리의 균형을 회복한다 */
	node = t.rotate(node)
	// 서브트리의 루트 노드를 반환한다
	return node
}

/* 노드 탐색 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 반복해서 찾다가 리프 노드를 지나면 종료한다
	for cur != nil {
		if cur.Val.(int) < val {
			// 찾는 노드는 cur의 오른쪽 서브트리에 있다
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 찾는 노드는 cur의 왼쪽 서브트리에 있다
			cur = cur.Left
		} else {
			// 찾는 노드를 발견했으므로 반복문을 종료한다
			break
		}
	}
	// 찾은 노드를 반환한다
	return cur
}
