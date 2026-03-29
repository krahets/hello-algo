// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* 配列表現による二分木クラス */
type arrayBinaryTree struct {
	tree []any
}

/* コンストラクタ */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* リスト容量 */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* インデックス i のノードの値を取得 */
func (abt *arrayBinaryTree) val(i int) any {
	// インデックスが範囲外なら、空きを表す null を返す
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* インデックス i のノードの左子ノードのインデックスを取得 */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* インデックス i のノードの右子ノードのインデックスを取得 */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* インデックス i のノードの親ノードのインデックスを取得 */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* レベル順走査 */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// 配列を直接走査する
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* 深さ優先探索 */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// 空きスロットなら返す
	if abt.val(i) == nil {
		return
	}
	// 先行順走査
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// 中順走査
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// 後順走査
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* 先行順走査 */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* 中順走査 */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* 後順走査 */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
