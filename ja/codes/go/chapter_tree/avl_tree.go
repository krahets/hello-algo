// File: avl_tree.go
// Created Time: 2023-01-08
// Author: Reanon (793584285@qq.com)

package chapter_tree

import . "github.com/krahets/hello-algo/pkg"

/* AVL 木 */
type aVLTree struct {
	// 根ノード
	root *TreeNode
}

func newAVLTree() *aVLTree {
	return &aVLTree{root: nil}
}

/* ノードの高さを取得する */
func (t *aVLTree) height(node *TreeNode) int {
	// 空のノードの高さは -1、葉の高さは 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* ノードの高さを更新する */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// ノードの高さは、左右の部分木の高さの最大値 + 1
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 平衡係数を取得する */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空のノードの平衡係数は 0
	if node == nil {
		return 0
	}
	// ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
	return t.height(node.Left) - t.height(node.Right)
}

/* 右回転 */
func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
	child := node.Left
	grandChild := child.Right
	// child を軸に node を右回転する
	child.Right = node
	node.Left = grandChild
	// ノードの高さを更新する
	t.updateHeight(node)
	t.updateHeight(child)
	// 回転後の部分木の根を返す
	return child
}

/* 左回転 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// child を軸に node を左回転する
	child.Left = node
	node.Right = grandChild
	// ノードの高さを更新する
	t.updateHeight(node)
	t.updateHeight(child)
	// 回転後の部分木の根を返す
	return child
}

/* 回転して部分木の平衡を回復する */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// ノード node の平衡係数を取得する
	// Go では短い変数名が推奨される。ここで bf は t.balanceFactor を指す
	bf := t.balanceFactor(node)
	// 左に偏った木
	if bf > 1 {
		if t.balanceFactor(node.Left) >= 0 {
			// 右回転
			return t.rightRotate(node)
		} else {
			// 左回転してから右回転
			node.Left = t.leftRotate(node.Left)
			return t.rightRotate(node)
		}
	}
	// 右に偏った木
	if bf < -1 {
		if t.balanceFactor(node.Right) <= 0 {
			// 左回転
			return t.leftRotate(node)
		} else {
			// 右回転してから左回転
			node.Right = t.rightRotate(node.Right)
			return t.leftRotate(node)
		}
	}
	// 平衡なので回転せずに戻る
	return node
}

/* ノードを挿入する */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* 再帰によるノードの挿入（補助関数） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 挿入位置を探してノードを挿入する */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 値が重複する場合は挿入せずに戻る
		return node
	}
	// ノードの高さを更新する
	t.updateHeight(node)
	/* 2. 回転して部分木の平衡を回復する */
	node = t.rotate(node)
	// 部分木の根を返す
	return node
}

/* ノードを削除する */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* 再帰によるノードの削除（補助関数） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. ノードを探して削除する */
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
				// 子が 0 個なら node を削除して戻る
				return nil
			} else {
				// 子が 1 個なら node を削除する
				node = child
			}
		} else {
			// 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
			temp := node.Right
			for temp.Left != nil {
				temp = temp.Left
			}
			node.Right = t.removeHelper(node.Right, temp.Val.(int))
			node.Val = temp.Val
		}
	}
	// ノードの高さを更新する
	t.updateHeight(node)
	/* 2. 回転して部分木の平衡を回復する */
	node = t.rotate(node)
	// 部分木の根を返す
	return node
}

/* ノードを探索する */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// ループで探索し、葉を越えたら終了する
	for cur != nil {
		if cur.Val.(int) < val {
			// 目的のノードは cur の右部分木にある
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 目的のノードは cur の左部分木にある
			cur = cur.Left
		} else {
			// 目的のノードが見つかったのでループを抜ける
			break
		}
	}
	// 目的のノードを返す
	return cur
}
