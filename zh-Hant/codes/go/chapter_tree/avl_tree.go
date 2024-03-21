// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL 树 */
type aVLTree struct {
	// 根节点
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* 获取节点高度 */
func (t *aVLTree) height(node *TreeNode) int {
	// 空节点高度为 -1 ，叶节点高度为 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* 更新节点高度 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 节点高度等于最高子树高度 + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 获取平衡因子 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空节点平衡因子为 0
	if node == nil {
		return 0
	}
	// 节点平衡因子 = 左子树高度 - 右子树高度
	return t.height(node.Left) - t.height(node.Right)
}

/* 右旋操作 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// 以 child 为原点，将 node 向右旋转
	child.Right = node
	node.Left = grandChild
	// 更新节点高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋转后子树的根节点
	return child
}

/* 左旋操作 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// 以 child 为原点，将 node 向左旋转
	child.Left = node
	node.Right = grandChild
	// 更新节点高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋转后子树的根节点
	return child
}

/* 执行旋转操作，使该子树重新恢复平衡 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 获取节点 node 的平衡因子
	// Go 推荐短变量，这里 bf 指代 t.balanceFactor
	bf := t.balanceFactor(node)
	// 左偏树
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 右旋
			return t.rightRotate(node)
		} else {
			// 先左旋后右旋
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// 右偏树
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// 左旋
			return t.leftRotate(node)
		} else {
			// 先右旋后左旋
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 平衡树，无须旋转，直接返回
	return node
}

/* 插入节点 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 递归插入节点（辅助函数） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 查找插入位置并插入节点 */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 重复节点不插入，直接返回
		return node
	}
	// 更新节点高度
	t.updateHeight(node)
	/* 2. 执行旋转操作，使该子树重新恢复平衡 */
	node = t.rotate(node)
	// 返回子树的根节点
	return node
}

/* 删除节点 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 递归删除节点（辅助函数） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. 查找节点并删除 */
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
				// 子节点数量 = 0 ，直接删除 node 并返回
				return nil
			} else {
				// 子节点数量 = 1 ，直接删除 node
				node = child
			}
		} else {
			// 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// 更新节点高度
	t.updateHeight(node)
	/* 2. 执行旋转操作，使该子树重新恢复平衡 */
	node = t.rotate(node)
	// 返回子树的根节点
	return node
}

/* 查找节点 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 循环查找，越过叶节点后跳出
	for cur != nil {
		if cur.Val.(int) < val {
			// 目标节点在 cur 的右子树中
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 目标节点在 cur 的左子树中
			cur = cur.Left
		} else {
			// 找到目标节点，跳出循环
			break
		}
	}
	// 返回目标节点
	return cur
}
