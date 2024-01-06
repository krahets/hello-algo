// File: array_binary_tree.go
// Created Time: 2023-07-24
// Author: Reanon (793584285@qq.com)

package chapter_tree

/* 数组表示下的二叉树类 */
type arrayBinaryTree struct {
	tree []any
}

/* 构造方法 */
func newArrayBinaryTree(arr []any) *arrayBinaryTree {
	return &arrayBinaryTree{
		tree: arr,
	}
}

/* 列表容量 */
func (abt *arrayBinaryTree) size() int {
	return len(abt.tree)
}

/* 获取索引为 i 节点的值 */
func (abt *arrayBinaryTree) val(i int) any {
	// 若索引越界，则返回 null ，代表空位
	if i < 0 || i >= abt.size() {
		return nil
	}
	return abt.tree[i]
}

/* 获取索引为 i 节点的左子节点的索引 */
func (abt *arrayBinaryTree) left(i int) int {
	return 2*i + 1
}

/* 获取索引为 i 节点的右子节点的索引 */
func (abt *arrayBinaryTree) right(i int) int {
	return 2*i + 2
}

/* 获取索引为 i 节点的父节点的索引 */
func (abt *arrayBinaryTree) parent(i int) int {
	return (i - 1) / 2
}

/* 层序遍历 */
func (abt *arrayBinaryTree) levelOrder() []any {
	var res []any
	// 直接遍历数组
	for i := 0; i < abt.size(); i++ {
		if abt.val(i) != nil {
			res = append(res, abt.val(i))
		}
	}
	return res
}

/* 深度优先遍历 */
func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
	// 若为空位，则返回
	if abt.val(i) == nil {
		return
	}
	// 前序遍历
	if order == "pre" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.left(i), order, res)
	// 中序遍历
	if order == "in" {
		*res = append(*res, abt.val(i))
	}
	abt.dfs(abt.right(i), order, res)
	// 后序遍历
	if order == "post" {
		*res = append(*res, abt.val(i))
	}
}

/* 前序遍历 */
func (abt *arrayBinaryTree) preOrder() []any {
	var res []any
	abt.dfs(0, "pre", &res)
	return res
}

/* 中序遍历 */
func (abt *arrayBinaryTree) inOrder() []any {
	var res []any
	abt.dfs(0, "in", &res)
	return res
}

/* 后序遍历 */
func (abt *arrayBinaryTree) postOrder() []any {
	var res []any
	abt.dfs(0, "post", &res)
	return res
}
