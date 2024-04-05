// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL 樹 */
type aVLTree struct {
	// 根節點
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* 獲取節點高度 */
func (t *aVLTree) height(node *TreeNode) int {
	// 空節點高度為 -1 ，葉節點高度為 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* 更新節點高度 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 節點高度等於最高子樹高度 + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 獲取平衡因子 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空節點平衡因子為 0
	if node == nil {
		return 0
	}
	// 節點平衡因子 = 左子樹高度 - 右子樹高度
	return t.height(node.Left) - t.height(node.Right)
}

/* 右旋操作 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// 以 child 為原點，將 node 向右旋轉
	child.Right = node
	node.Left = grandChild
	// 更新節點高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋轉後子樹的根節點
	return child
}

/* 左旋操作 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// 以 child 為原點，將 node 向左旋轉
	child.Left = node
	node.Right = grandChild
	// 更新節點高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋轉後子樹的根節點
	return child
}

/* 執行旋轉操作，使該子樹重新恢復平衡 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 獲取節點 node 的平衡因子
	// Go 推薦短變數，這裡 bf 指代 t.balanceFactor
	bf := t.balanceFactor(node)
	// 左偏樹
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 右旋
			return t.rightRotate(node)
		} else {
			// 先左旋後右旋
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// 右偏樹
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// 左旋
			return t.leftRotate(node)
		} else {
			// 先右旋後左旋
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 平衡樹，無須旋轉，直接返回
	return node
}

/* 插入節點 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 遞迴插入節點（輔助函式） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 查詢插入位置並插入節點 */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 重複節點不插入，直接返回
		return node
	}
	// 更新節點高度
	t.updateHeight(node)
	/* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
	node = t.rotate(node)
	// 返回子樹的根節點
	return node
}

/* 刪除節點 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 遞迴刪除節點（輔助函式） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. 查詢節點並刪除 */
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
				// 子節點數量 = 0 ，直接刪除 node 並返回
				return nil
			} else {
				// 子節點數量 = 1 ，直接刪除 node
				node = child
			}
		} else {
			// 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// 更新節點高度
	t.updateHeight(node)
	/* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
	node = t.rotate(node)
	// 返回子樹的根節點
	return node
}

/* 查詢節點 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 迴圈查詢，越過葉節點後跳出
	for cur != nil {
		if cur.Val.(int) < val {
			// 目標節點在 cur 的右子樹中
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 目標節點在 cur 的左子樹中
			cur = cur.Left
		} else {
			// 找到目標節點，跳出迴圈
			break
		}
	}
	// 返回目標節點
	return cur
}
