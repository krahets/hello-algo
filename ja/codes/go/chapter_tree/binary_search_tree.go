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

/* 根を取得する */
func (bst *binarySearchTree) getRoot() *TreeNode {
	return bst.root
}

/* ノードを探索する */
func (bst *binarySearchTree) search(num int) *TreeNode {
	node := bst.root
	// ループで探索し、葉を越えたら終了する
	for node != nil {
		if node.Val.(int) < num {
			// 目的のノードは cur の右部分木にある
			node = node.Right
		} else if node.Val.(int) > num {
			// 目的のノードは cur の左部分木にある
			node = node.Left
		} else {
			// 目的のノードが見つかったのでループを抜ける
			break
		}
	}
	// 目的のノードを返す
	return node
}

/* ノードを挿入する */
func (bst *binarySearchTree) insert(num int) {
	cur := bst.root
	// 木が空なら根を初期化する
	if cur == nil {
		bst.root = NewTreeNode(num)
		return
	}
	// 挿入位置の親ノード
	var pre *TreeNode = nil
	// ループで探索し、葉を越えたら終了する
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
	// ノードを挿入する
	node := NewTreeNode(num)
	if pre.Val.(int) < num {
		pre.Right = node
	} else {
		pre.Left = node
	}
}

/* ノードを削除する */
func (bst *binarySearchTree) remove(num int) {
	cur := bst.root
	// 木が空ならすぐに戻る
	if cur == nil {
		return
	}
	// 削除対象の親ノード
	var pre *TreeNode = nil
	// ループで探索し、葉を越えたら終了する
	for cur != nil {
		if cur.Val == num {
			break
		}
		pre = cur
		if cur.Val.(int) < num {
			// 削除対象は右部分木にある
			cur = cur.Right
		} else {
			// 削除対象は左部分木にある
			cur = cur.Left
		}
	}
	// 削除対象が見つからなければそのまま戻る
	if cur == nil {
		return
	}
	// 子が 0 個または 1 個
	if cur.Left == nil || cur.Right == nil {
		var child *TreeNode = nil
		// 削除対象の子を取り出す
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
			// 削除対象が根なら根を設定し直す
			bst.root = child
		}
		// 子が 2 個
	} else {
		// 通りがけ順で削除対象の cur の次に来るノードを取得する
		tmp := cur.Right
		for tmp.Left != nil {
			tmp = tmp.Left
		}
		// ノード tmp を再帰的に削除する
		bst.remove(tmp.Val.(int))
		// tmp の値で cur の値を上書きする
		cur.Val = tmp.Val
	}
}

/* 二分探索木を出力する */
func (bst *binarySearchTree) print() {
	PrintTree(bst.root)
}
