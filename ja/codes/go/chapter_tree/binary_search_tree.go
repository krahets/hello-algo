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
	// 空の木を初期化する
	bst.root = nil
	return bst
}

/* 根ノードを取得 */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* ノードを探索 */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// ループで探索し、葉ノードを越えたら抜ける
	for node != nil {
		if node.Val.(int) < num {
			// 目標ノードは cur の右部分木にある
			node = node.Right
		} else if node.Val.(int) > num {
			// 目標ノードは cur の左部分木にある
			node = node.Left
		} else {
			// 目標ノードが見つかったらループを抜ける
			break
		}
	}
	// 目標ノードを返す
	return node
}

/* ノードを挿入 */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// 木が空なら、根ノードを初期化する
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// 挿入対象ノードの直前のノード位置
	var pre *TreeNode = nil
	// ループで探索し、葉ノードを越えたら抜ける
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
	// ノードを挿入
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* ノードを削除 */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// 木が空なら、そのまま早期リターンする
	if cur == nil {
		return
	}
	// 削除対象ノードの直前のノード位置
	var pre *TreeNode = nil
	// ループで探索し、葉ノードを越えたら抜ける
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// 削除対象ノードは右部分木にある
			cur = cur.Right
		} else {
			// 削除対象ノードは左部分木にある
			cur = cur.Left
		}
	}
	// 削除対象ノードがなければそのまま返す
	if cur == nil {
		return
	}
	// 子ノード数は 0 または 1
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 削除対象ノードの子ノードを取り出す
		if cur.Left != nil {
			child = cur.Left
		} else {
			child = cur.Right
		}
		// ノード cur を削除する
		if cur != bst.root {
			if pre.Left == cur {
				pre.Left = child
			} else {
				pre.Right = child
			}
		} else {
			// 削除ノードが根ノードなら、根ノードを再設定
			bst.root = child
		}
		// 子ノード数は 2
	} else {
		// 中順走査で削除対象ノード `cur` の次のノードを取得する
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// ノード tmp を再帰的に削除
		bst.remove(tmp.Val.(int))
		// tmp で cur を上書きする
		cur.Val = tmp.Val
	}
}

/* 二分探索木を出力 */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
