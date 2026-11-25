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

/* 取得節點高度 */
func (t *aVLTree) height(node *TreeNode) int {
	// 空節點的高度為 -1，葉節點的高度為 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* 更新節點高度 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 節點高度等於最高子樹的高度加 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 取得平衡因子 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空節點的平衡因子為 0
	if node == nil {
		return 0
	}
	// 節點的平衡因子 = 左子樹高度 - 右子樹高度
	return t.height(node.Left) - t.height(node.Right)
}

/* 右旋操作 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// 以 child 為支點，將 node 向右旋轉
	child.Right = node
	node.Left = grandChild
	// 更新節點高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 回傳旋轉後的子樹根節點
	return child
}

/* 左旋操作 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// 以 child 為支點，將 node 向左旋轉
	child.Left = node
	node.Right = grandChild
	// 更新節點高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 回傳旋轉後的子樹根節點
	return child
}

/* 透過旋轉讓這棵子樹恢復平衡 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 取得節點 node 的平衡因子
	// Go 慣用簡短的變數名稱，這裡的 bf 代表 t.balanceFactor
	bf := t.balanceFactor(node)
	// 左偏樹
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 右旋
			return t.rightRotate(node)
		} else {
			// 先左旋再右旋
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
			// 先右旋再左旋
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 樹已平衡，無須旋轉，直接返回
	return node
}

/* 插入節點 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 以遞迴插入節點（輔助函式） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 找出插入位置並插入節點 */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 若節點重複，直接返回，略過插入操作
		return node
	}
	// 更新節點高度
	t.updateHeight(node)
	/* 2. 透過旋轉讓這棵子樹恢復平衡 */
	node = t.rotate(node)
	// 回傳子樹的根節點
	return node
}

/* 刪除節點 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 以遞迴刪除節點（輔助函式） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. 找出並刪除節點 */
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
				// 若有 0 個子節點，直接刪除 node 並返回
				return nil
			} else {
				// 若只有 1 個子節點，直接刪除 node
				node = child
			}
		} else {
			// 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
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
	/* 2. 透過旋轉讓這棵子樹恢復平衡 */
	node = t.rotate(node)
	// 回傳子樹的根節點
	return node
}

/* 搜尋節點 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 用迴圈搜尋，越過葉節點後跳出迴圈
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
	// 回傳目標節點
	return cur
}
