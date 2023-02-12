// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL 树 */
type aVLTree struct {
	// 根结点
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* 获取结点高度 */
func (t *aVLTree) height(node *TreeNode) int {
	// 空结点高度为 -1 ，叶结点高度为 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* 更新结点高度 */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// 结点高度等于最高子树高度 + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 获取平衡因子 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空结点平衡因子为 0
	if node == nil {
		return 0
	}
	// 结点平衡因子 = 左子树高度 - 右子树高度
	return t.height(node.Left) - t.height(node.Right)
}

/* 右旋操作 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// 以 child 为原点，将 node 向右旋转
	child.Right = node
	node.Left = grandChild
	// 更新结点高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋转后子树的根结点
	return child
}

/* 左旋操作 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// 以 child 为原点，将 node 向左旋转
	child.Left = node
	node.Right = grandChild
	// 更新结点高度
	t.updateHeight(node)
	t.updateHeight(child)
	// 返回旋转后子树的根结点
	return child
}

/* 执行旋转操作，使该子树重新恢复平衡 */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// 获取结点 node 的平衡因子
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
	// 平衡树，无需旋转，直接返回
	return node
}

/* 插入结点 */
func (t *aVLTree) insert(val int) *TreeNode {
	t.root = t.insertHelper(t.root, val)
	return t.root
}

/* 递归插入结点（辅助方法） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 查找插入位置，并插入结点 */
	if val < node.Val {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 重复结点不插入，直接返回
		return node
	}
	// 更新结点高度
	t.updateHeight(node)
	/* 2. 执行旋转操作，使该子树重新恢复平衡 */
	node = t.rotate(node)
	// 返回子树的根结点
	return node
}

/* 删除结点 */
func (t *aVLTree) remove(val int) *TreeNode {
	root := t.removeHelper(t.root, val)
	return root
}

/* 递归删除结点（辅助方法） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. 查找结点，并删除之 */
	if val < node.Val {
		node.Left = t.removeHelper(node.Left, val)
	} else if val > node.Val {
		node.Right = t.removeHelper(node.Right, val)
	} else {
		if node.Left == nil || node.Right == nil {
			child := node.Left
			if node.Right != nil {
				child = node.Right
			}
			// 子结点数量 = 0 ，直接删除 node 并返回
			if child == nil {
				return nil
			} else {
				// 子结点数量 = 1 ，直接删除 node
				node = child
			}
		} else {
			// 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
			temp := t.getInOrderNext(node.Right)
			node.Right = t.removeHelper(node.Right, temp.Val)
			node.Val = temp.Val
		}
	}
	// 更新结点高度
	t.updateHeight(node)
	/* 2. 执行旋转操作，使该子树重新恢复平衡 */
	node = t.rotate(node)
	// 返回子树的根结点
	return node
}

/* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
func (t *aVLTree) getInOrderNext(node *TreeNode) *TreeNode {
	if node == nil {
		return node
	}
	// 循环访问左子结点，直到叶结点时为最小结点，跳出
	for node.Left != nil {
		node = node.Left
	}
	return node
}

/* 查找结点 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// 循环查找，越过叶结点后跳出
	for cur != nil {
		if cur.Val < val {
			// 目标结点在 cur 的右子树中
			cur = cur.Right
		} else if cur.Val > val {
			// 目标结点在 cur 的左子树中
			cur = cur.Left
		} else {
			// 找到目标结点，跳出循环
			break
		}
	}
	// 返回目标结点
	return cur
}
