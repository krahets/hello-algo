// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// TreeNode: узел двоичного дерева
type TreeNode struct {
	Val    any       // Значение узла
	Height int       // Высота узла
	Left   *TreeNode // Ссылка на левый дочерний узел
	Right  *TreeNode // Ссылка на правый дочерний узел
}

// NewTreeNode: конструктор узла двоичного дерева
func NewTreeNode(v any) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// Правила кодирования сериализации см.:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// Представление двоичного дерева массивом:
// [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
// Представление двоичного дерева связным списком:
//
// /——— 15
// /——— 7
// /——— 3
// |    \——— 6
// |        \——— 12
//
// ——— 1
//
// \——— 2
// |    /——— 9
// \——— 4
// \——— 8

// SliceToTreeDFS десериализует список в двоичное дерево: рекурсия
func SliceToTreeDFS(arr []any, i int) *TreeNode {
	if i < 0 || i >= len(arr) || arr[i] == nil {
		return nil
	}
	root := NewTreeNode(arr[i])
	root.Left = SliceToTreeDFS(arr, 2*i+1)
	root.Right = SliceToTreeDFS(arr, 2*i+2)
	return root
}

// SliceToTree десериализует срез в двоичное дерево
func SliceToTree(arr []any) *TreeNode {
	return SliceToTreeDFS(arr, 0)
}

// TreeToSliceDFS сериализует двоичное дерево в срез: рекурсия
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

// TreeToSlice сериализует двоичное дерево в срез
func TreeToSlice(root *TreeNode) []any {
	var res []any
	TreeToSliceDFS(root, 0, &res)
	return res
}
