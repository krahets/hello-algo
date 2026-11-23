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

/* 노드 높이 반환 */
func (t *aVLTree) height(node *TreeNode) int {
	// 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
	if node != nil {
		return node.Height
	}
	return -1
}

/* 노드 높이를 갱신한다 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 노드 높이는 가장 높은 서브트리의 높이 + 1이다
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 균형 인수 반환 */
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
	// child를 중심으로 node를 오른쪽으로 회전한다
	child.Right = node
	node.Left = grandChild
	// 노드 높이를 갱신한다
	t.updateHeight(node)
	t.updateHeight(child)
	// 회전한 서브트리의 루트 노드를 반환한다
	return child
}

/* 왼쪽 회전 연산 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// child를 중심으로 node를 왼쪽으로 회전한다
	child.Left = node
	node.Right = grandChild
	// 노드 높이를 갱신한다
	t.updateHeight(node)
	t.updateHeight(child)
	// 회전한 서브트리의 루트 노드를 반환한다
	return child
}

/* 회전 연산을 수행하여 해당 서브트리의 균형 복원 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 노드 node의 균형 인수를 구한다
	// Go에서는 짧은 변수명을 권장한다. 여기서 bf는 t.balanceFactor를 나타낸다
	bf := t.balanceFactor(node)
	// 왼쪽으로 치우친 트리
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 오른쪽 회전
			return t.rightRotate(node)
		} else {
			// 왼쪽으로 회전한 후 오른쪽으로 회전한다
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
			// 오른쪽으로 회전한 후 왼쪽으로 회전한다
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 균형 트리이므로 회전할 필요 없이 바로 반환한다
	return node
}

/* 노드 삽입 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 노드의 재귀적 삽입(보조 함수) */
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
	// 노드 높이를 갱신한다
	t.updateHeight(node)
	/* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
	node = t.rotate(node)
	// 서브트리의 루트 노드를 반환한다
	return node
}

/* 노드 삭제 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 노드의 재귀적 삭제(보조 함수) */
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
				// 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
				return nil
			} else {
				// 자식 노드 수 = 1이면 node를 바로 삭제한다
				node = child
			}
		} else {
			// 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// 노드 높이를 갱신한다
	t.updateHeight(node)
	/* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
	node = t.rotate(node)
	// 서브트리의 루트 노드를 반환한다
	return node
}

/* 노드 탐색 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 반복하여 탐색하다 리프 노드를 지나면 종료한다
	for cur != nil {
		if cur.Val.(int) < val {
			// 목표 노드는 cur의 오른쪽 서브트리에 있다
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 목표 노드는 cur의 왼쪽 서브트리에 있다
			cur = cur.Left
		} else {
			// 목표 노드를 찾았으므로 반복문을 종료한다
			break
		}
	}
	// 목표 노드를 반환한다
	return cur
}
