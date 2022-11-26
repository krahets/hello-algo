// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

import (
	"container/list"
	"fmt"
)

// nodeNotExist represents node don't exist.
const nodeNotExist int = -1

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
func TreeToArray(root *TreeNode) []int {
	if root == nil {
		return []int{}
	}
	arr := make([]int, 0)
	queue := list.New()
	queue.PushBack(root)
	for queue.Len() > 0 {
		node := queue.Remove(queue.Front()).(*TreeNode)
		if node != nil {
			arr = append(arr, node.Val)
			queue.PushBack(node.Left)
			queue.PushBack(node.Right)
		} else {
			arr = append(arr, nodeNotExist)
		}
	}
	return arr
}

// PrintTree Print a binary tree
func PrintTree(root *TreeNode) {
	printTreeHelper(root, nil, false)
}

// printTreeHelper Help to print a binary tree, hide more details
// This tree printer is borrowed from TECHIE DELIGHT
// https://www.techiedelight.com/c-program-print-binary-tree/
func printTreeHelper(root *TreeNode, prev *trunk, isLeft bool) {
	if root == nil {
		return
	}
	prevStr := "    "
	trunk := newTrunk(prev, prevStr)
	printTreeHelper(root.Right, trunk, true)
	if prev == nil {
		trunk.str = "———"
	} else if isLeft {
		trunk.str = "/———"
		prevStr = "   |"
	} else {
		trunk.str = "\\———"
		prev.str = prevStr
	}
	showTrunk(trunk)
	fmt.Println(root.Val)
	if prev != nil {
		prev.str = prevStr
	}
	trunk.str = "   |"
	printTreeHelper(root.Left, trunk, false)
}

// trunk Help to Print tree structure
type trunk struct {
	prev *trunk
	str  string
}

func newTrunk(prev *trunk, str string) *trunk {
	return &trunk{
		prev: prev,
		str:  str,
	}
}

func showTrunk(t *trunk) {
	if t == nil {
		return
	}

	showTrunk(t.prev)
	fmt.Print(t.str)
}
