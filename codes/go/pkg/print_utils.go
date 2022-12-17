// File: print_utils.go
// Created Time: 2022-12-03
// Author: Reanon (793584285@qq.com), Krahets (krahets@163.com), msk397 (machangxinq@gmail.com)

package pkg

import (
	"container/list"
	"fmt"
	"strconv"
	"strings"
)

// PrintSlice Print a slice
func PrintSlice[T any](nums []T) {
	fmt.Printf("%v", nums)
	fmt.Println()
}

// PrintList Print a list
func PrintList(list *list.List) {
	e := list.Front()
	// 强转为 string, 会影响效率
	fmt.Print("[")
	for e.Next() != nil {
		fmt.Print(e.Value, " ")
		e = e.Next()
	}
	fmt.Print(e.Value, "]\n")
}

// PrintLinkedList Print a linked list
func PrintLinkedList(node *ListNode) {
	if node == nil {
		return
	}
	var builder strings.Builder
	for node.Next != nil {
		builder.WriteString(strconv.Itoa(node.Val) + " -> ")
		node = node.Next
	}
	builder.WriteString(strconv.Itoa(node.Val))
	fmt.Println(builder.String())
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

// PrintMap Print a hash map
func PrintMap[K comparable, V any](m map[K]V) {
	for key, value := range m {
		fmt.Println(key, "->", value)
	}
}