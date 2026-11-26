// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// TreeNode 代表二元樹的節點
type TreeNode struct {
	Val    any       // 節點值
	Height int       // 節點高度
	Left   *TreeNode // 指向左子節點的參照
	Right  *TreeNode // 指向右子節點的參照
}

// NewTreeNode 用來建立二元樹節點
func NewTreeNode(v any) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// 序列化的編碼規則請參閱：
// https://www.hello-algo.com/zh-hant/chapter_tree/array_representation_of_tree/
// 二元樹的陣列表示法：
// [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
// 二元樹的鏈結串列表示法：
//
//	         /——— 15
//	     /——— 7
//	 /——— 3
//	|    \——— 6
//	|        \——— 12
//
// ——— 1
//
//	\——— 2
//	   |    /——— 9
//	    \——— 4
//	        \——— 8

// SliceToTreeDFS 以遞迴方式將切片反序列化為二元樹
func SliceToTreeDFS(arr []any, i int) *TreeNode {
	if i < 0 || i >= len(arr) || arr[i] == nil {
		return nil
	}
	root := NewTreeNode(arr[i])
	root.Left = SliceToTreeDFS(arr, 2*i+1)
	root.Right = SliceToTreeDFS(arr, 2*i+2)
	return root
}

// SliceToTree 將切片反序列化為二元樹
func SliceToTree(arr []any) *TreeNode {
	return SliceToTreeDFS(arr, 0)
}

// TreeToSliceDFS 以遞迴方式將二元樹序列化為切片
func TreeToSliceDFS(root *TreeNode, i int, res *[]any) {
	if root == nil {
		return
	}
	for i >= len(*res) {
		*res = append(*res, nil)
	}
	(*res)[i] = root.Val
	TreeToSliceDFS(root.Left, 2*i+1, res)
	TreeToSliceDFS(root.Right, 2*i+2, res)
}

// TreeToSlice 將二元樹序列化為切片
func TreeToSlice(root *TreeNode) []any {
	var res []any
	TreeToSliceDFS(root, 0, &res)
	return res
}
