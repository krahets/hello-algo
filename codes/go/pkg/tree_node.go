// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"container/list"
)

type TreeNode struct {
	Val    int       // 结点值
	Height int       // 结点高度
	Left   *TreeNode // 左子结点引用
	Right  *TreeNode // 右子结点引用
}

func NewTreeNode(v int) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// ArrToTree Generate a binary tree given an array
func ArrToTree(arr []any) *TreeNode {
	if len(arr) <= 0 {
		return nil
	}
	// TreeNode only accept integer value for now.
	root := NewTreeNode(arr[0].(int))
	// Let container.list as queue
	queue := list.New()
	queue.PushBack(root)
	i := 0
	for queue.Len() > 0 {
		// poll
		node := queue.Remove(queue.Front()).(*TreeNode)
		i++
		if i < len(arr) {
			if arr[i] != nil {
				node.Left = NewTreeNode(arr[i].(int))
				queue.PushBack(node.Left)
			}
		}
		i++
		if i < len(arr) {
			if arr[i] != nil {
				node.Right = NewTreeNode(arr[i].(int))
				queue.PushBack(node.Right)
			}
		}
	}
	return root
}

// TreeToArray Serialize a binary tree to a list
func TreeToArray(root *TreeNode) []any {
	if root == nil {
		return []any{}
	}
	arr := make([]any, 0)
	queue := list.New()
	queue.PushBack(root)
	for queue.Len() > 0 {
		node := queue.Remove(queue.Front()).(*TreeNode)
		if node != nil {
			arr = append(arr, node.Val)
			queue.PushBack(node.Left)
			queue.PushBack(node.Right)
		} else {
			// node don't exist.
			arr = append(arr, nil)
		}
	}
	return arr
}
