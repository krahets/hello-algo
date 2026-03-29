// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// TreeNode は二分木ノード
type TreeNode struct {
	Val    any       // ノード値
	Height int       // ノードの高さ
	Left   *TreeNode // 左子ノードへの参照
	Right  *TreeNode // 右子ノードへの参照
}

// NewTreeNode は二分木ノードのコンストラクタ
func NewTreeNode(v any) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// シリアライズの符号化規則は次を参照してください:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// 二分木の配列表現:
// [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
// 二分木の連結リスト表現:
//
// /——— 15
// /——— 7
// /——— 3
// |    \\——— 6
// |        \\——— 12
//
// ——— 1
//
// \\——— 2
// |    /——— 9
// \\——— 4
// \\——— 8

// SliceToTreeDFS はリストを二分木にデシリアライズする：再帰
func SliceToTreeDFS(arr []any, i int) *TreeNode {
	if i < 0 || i >= len(arr) || arr[i] == nil {
		return nil
	}
	root := NewTreeNode(arr[i])
	root.Left = SliceToTreeDFS(arr, 2*i+1)
	root.Right = SliceToTreeDFS(arr, 2*i+2)
	return root
}

// SliceToTree はスライスを二分木にデシリアライズする
func SliceToTree(arr []any) *TreeNode {
	return SliceToTreeDFS(arr, 0)
}

// TreeToSliceDFS は二分木をスライスにシリアライズする：再帰
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

// TreeToSlice は二分木をスライスにシリアライズする
func TreeToSlice(root *TreeNode) []any {
	var res []any
	TreeToSliceDFS(root, 0, &res)
	return res
}
