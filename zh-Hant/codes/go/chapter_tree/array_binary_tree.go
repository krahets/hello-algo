// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* 陣列表示下的二元樹類別 */
type arrayBinaryTree struct {
	tree []any
}

/* 建構子 */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* 串列容量 */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* 獲取索引為 i 節點的值 */
func (abt *arrayBinaryTree) val(i int) any {
	// 若索引越界，則返回 null ，代表空位
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* 獲取索引為 i 節點的左子節點的索引 */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* 獲取索引為 i 節點的右子節點的索引 */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* 獲取索引為 i 節點的父節點的索引 */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* 層序走訪 */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// 直接走訪陣列
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* 深度優先走訪 */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// 若為空位，則返回
	if abt.val(i) == nil {
		return
	}
	// 前序走訪
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// 中序走訪
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// 後序走訪
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* 前序走訪 */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* 中序走訪 */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* 後序走訪 */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
