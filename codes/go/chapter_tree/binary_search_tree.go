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
	// 初始化空树
	bst.root = nil
	return bst
}

/* 获取根节点 */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* 查找节点 */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// 循环查找，越过叶节点后跳出
	for node != nil {
		if node.Val.(int) < num {
			// 目标节点在 cur 的右子树中
			node = node.Right
		} else if node.Val.(int) > num {
			// 目标节点在 cur 的左子树中
			node = node.Left
		} else {
			// 找到目标节点，跳出循环
			break
		}
	}
	// 返回目标节点
	return node
}

/* 插入节点 */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// 若树为空，则初始化根节点
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// 待插入节点之前的节点位置
	var pre *TreeNode = nil
	// 循环查找，越过叶节点后跳出
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
	// 插入节点
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* 删除节点 */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// 若树为空，直接提前返回
	if cur == nil {
		return
	}
	// 待删除节点之前的节点位置
	var pre *TreeNode = nil
	// 循环查找，越过叶节点后跳出
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// 待删除节点在右子树中
			cur = cur.Right
		} else {
			// 待删除节点在左子树中
			cur = cur.Left
		}
	}
	// 若无待删除节点，则直接返回
	if cur == nil {
		return
	}
	// 子节点数为 0 或 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 取出待删除节点的子节点
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// 删除节点 cur
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// 若删除节点为根节点，则重新指定根节点
			bst.root = child
		}
		// 子节点数为 2
	} else {
		// 获取中序遍历中待删除节点 cur 的下一个节点
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// 递归删除节点 tmp
		bst.remove(tmp.Val.(int))
		// 用 tmp 覆盖 cur
		cur.Val = tmp.Val
	}
}

/* 打印二叉搜索树 */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
