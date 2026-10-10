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

/* ノードの高さを取得 */
func (t *aVLTree) height(node *TreeNode) int {
	// 空ノードの高さは -1、葉ノードの高さは 0
	if node != nil {
		return node.Height
	}
	return -1
}

/* ノードの高さを更新する */
func (t *aVLTree) updateHeight(node *TreeNode) {
	lh := t.height(node.Left)
	rh := t.height(node.Right)
	// ノードの高さは最も高い部分木の高さ + 1 に等しい
	if lh > rh {
		node.Height = lh + 1
	} else {
		node.Height = rh + 1
	}
}

/* 平衡係数を取得 */
func (t *aVLTree) balanceFactor(node *TreeNode) int {
	// 空ノードの平衡係数は 0
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
	// child を支点として node を右回転させる
	child.Right = node
	node.Left = grandChild
	// ノードの高さを更新する
	t.updateHeight(node)
	t.updateHeight(child)
	// 回転後の部分木の根ノードを返す
	return child
}

/* 左回転 */
func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
	child := node.Right
	grandChild := child.Left
	// child を支点として node を左回転させる
	child.Left = node
	node.Right = grandChild
	// ノードの高さを更新する
	t.updateHeight(node)
	t.updateHeight(child)
	// 回転後の部分木の根ノードを返す
	return child
}

/* 回転操作を行い、この部分木の平衡を回復する */
func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
	// ノード `node` の平衡係数を取得する
	// Go では短い変数名が推奨されるため、ここで `bf` は `t.balanceFactor` を表す
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
	// 平衡木なので回転不要、そのまま返す
	return node
}

/* ノードを挿入 */
func (t *aVLTree) insert(val int) {
	t.root = t.insertHelper(t.root, val)
}

/* ノードを再帰的に挿入する（補助関数） */
func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return NewTreeNode(val)
	}
	/* 1. 挿入位置を探索してノードを挿入 */
	if val < node.Val.(int) {
		node.Left = t.insertHelper(node.Left, val)
	} else if val > node.Val.(int) {
		node.Right = t.insertHelper(node.Right, val)
	} else {
		// 重複ノードは挿入せず、そのまま返す
		return node
	}
	// ノードの高さを更新する
	t.updateHeight(node)
	/* 2. 回転操作を行い、部分木の平衡を回復する */
	node = t.rotate(node)
	// 部分木の根ノードを返す
	return node
}

/* ノードを削除 */
func (t *aVLTree) remove(val int) {
	t.root = t.removeHelper(t.root, val)
}

/* ノードを再帰的に削除する（補助関数） */
func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
	if node == nil {
		return nil
	}
	/* 1. ノードを探索して削除 */
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
				// 子ノード数 = 0 の場合、node をそのまま削除して返す
				return nil
			} else {
				// 子ノード数 = 1 の場合、node をそのまま削除する
				node = child
			}
		} else {
			// 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
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
	/* 2. 回転操作を行い、部分木の平衡を回復する */
	node = t.rotate(node)
	// 部分木の根ノードを返す
	return node
}

/* ノードを探索 */
func (t *aVLTree) search(val int) *TreeNode {
	cur := t.root
	// ループで探索し、葉ノードを越えたら抜ける
	for cur != nil {
		if cur.Val.(int) < val {
			// 目標ノードは cur の右部分木にある
			cur = cur.Right
		} else if cur.Val.(int) > val {
			// 目標ノードは cur の左部分木にある
			cur = cur.Left
		} else {
			// 目標ノードが見つかったらループを抜ける
			break
		}
	}
	// 目標ノードを返す
	return cur
}
