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
	// 初始化空樹
	bst.root = nil
	return bst
}

/* 獲取根節點 */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* 查詢節點 */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// 迴圈查詢，越過葉節點後跳出
	for node != nil {
		if node.Val.(int) < num {
			// 目標節點在 cur 的右子樹中
			node = node.Right
		} else if node.Val.(int) > num {
			// 目標節點在 cur 的左子樹中
			node = node.Left
		} else {
			// 找到目標節點，跳出迴圈
			break
		}
	}
	// 返回目標節點
	return node
}

/* 插入節點 */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// 若樹為空，則初始化根節點
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// 待插入節點之前的節點位置
	var pre *TreeNode = nil
	// 迴圈查詢，越過葉節點後跳出
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
	// 插入節點
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* 刪除節點 */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// 若樹為空，直接提前返回
	if cur == nil {
		return
	}
	// 待刪除節點之前的節點位置
	var pre *TreeNode = nil
	// 迴圈查詢，越過葉節點後跳出
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// 待刪除節點在右子樹中
			cur = cur.Right
		} else {
			// 待刪除節點在左子樹中
			cur = cur.Left
		}
	}
	// 若無待刪除節點，則直接返回
	if cur == nil {
		return
	}
	// 子節點數為 0 或 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 取出待刪除節點的子節點
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// 刪除節點 cur
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// 若刪除節點為根節點，則重新指定根節點
			bst.root = child
		}
		// 子節點數為 2
	} else {
		// 獲取中序走訪中待刪除節點 cur 的下一個節點
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// 遞迴刪除節點 tmp
		bst.remove(tmp.Val.(int))
		// 用 tmp 覆蓋 cur
		cur.Val = tmp.Val
	}
}

/* 列印二元搜尋樹 */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
