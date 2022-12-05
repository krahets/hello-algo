// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"container/list"
)

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func NewTreeNode(v int) *TreeNode {
	return &TreeNode{
		Left:  nil,
		Right: nil,
		Val:   v,
	}
}

// ArrayToTree Generate a binary tree with an array
func ArrayToTree(arr []int) *TreeNode {
	if len(arr) <= 0 {
		return nil
	}
	root := NewTreeNode(arr[0])
	// Let container.list as queue
	queue := list.New()
	queue.PushBack(root)
	i := 1
	for queue.Len() > 0 {
		// poll
		node := queue.Remove(queue.Front()).(*TreeNode)
		if i < len(arr) {
			node.Left = NewTreeNode(arr[i])
			queue.PushBack(node.Left)
			i++
		}
		if i < len(arr) {
			node.Right = NewTreeNode(arr[i])
			queue.PushBack(node.Right)
			i++
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
