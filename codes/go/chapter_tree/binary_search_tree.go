// File: binary_search_tree.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_tree

import (
	"sort"

	. "github.com/krahets/hello-algo/pkg"
)

type binarySearchTree struct {
	root *TreeNode
}

func newBinarySearchTree(nums []int) *binarySearchTree {
	// 排序数组
	sort.Ints(nums)
	// 构建二叉搜索树
	bst := &binarySearchTree{}
	bst.root = bst.buildTree(nums, 0, len(nums)-1)
	return bst
}

/* 构建二叉搜索树 */
func (bst *binarySearchTree) buildTree(nums []int, left, right int) *TreeNode {
	if left > right {
		return nil
	}
	// 将数组中间结点作为根结点
	middle := left + (right-left)>>1
	root := NewTreeNode(nums[middle])
	// 递归构建左子树和右子树
	root.Left = bst.buildTree(nums, left, middle-1)
	root.Right = bst.buildTree(nums, middle+1, right)
	return root
}

/* 获取根结点 */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* 获取中序遍历的下一个结点（仅适用于 root 有左子结点的情况） */
func (bst *binarySearchTree) getInOrderNext(node *TreeNode) *TreeNode {
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
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// 循环查找，越过叶结点后跳出
	for node != nil {
		if node.Val < num {
			// 目标结点在 cur 的右子树中
			node = node.Right
		} else if node.Val > num {
			// 目标结点在 cur 的左子树中
			node = node.Left
		} else {
			// 找到目标结点，跳出循环
			break
		}
	}
	// 返回目标结点
	return node
}

/* 插入结点 */
func (bst *binarySearchTree) insert(num int) *TreeNode {
	cur := bst.root
	// 若树为空，直接提前返回
	if cur == nil {
		return nil
	}
	// 待插入结点之前的结点位置
	var pre *TreeNode = nil
	// 循环查找，越过叶结点后跳出
	for cur != nil {
		if cur.Val == num {
			return nil
		}
		pre = cur
		if cur.Val < num {
			cur = cur.Right
		} else {
			cur = cur.Left
		}
	}
	// 插入结点
	node := NewTreeNode(num)
	if pre.Val < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
	return cur
}

/* 删除结点 */
func (bst *binarySearchTree) remove(num int) *TreeNode {
	cur := bst.root
	// 若树为空，直接提前返回
	if cur == nil {
		return nil
	}
	// 待删除结点之前的结点位置
	var pre *TreeNode = nil
	// 循环查找，越过叶结点后跳出
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val < num {
			// 待删除结点在右子树中
			cur = cur.Right
		} else {
			// 待删除结点在左子树中
			cur = cur.Left
		}
	}
	// 若无待删除结点，则直接返回
	if cur == nil {
		return nil
	}
	// 子结点数为 0 或 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 取出待删除结点的子结点
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// 将子结点替换为待删除结点
		if pre.Left == cur {
			pre.Left = child
		} else {
			pre.Right = child
		}
		// 子结点数为 2
	} else {
		// 获取中序遍历中待删除结点 cur 的下一个结点
		next := bst.getInOrderNext(cur)
		temp := next.Val
		// 递归删除结点 next
		bst.remove(next.Val)
		// 将 next 的值复制给 cur
		cur.Val = temp
	}
	return cur
}

/* 打印二叉搜索树 */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
