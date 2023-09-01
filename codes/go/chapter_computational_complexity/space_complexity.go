// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"
)

/* 结构体 */
type node struct {
	val  int
	next *node
}

/* treeNode 二叉树 */
type treeNode struct {
	val   int
	left  *treeNode
	right *treeNode
}

/* 创建 node 结构体  */
func newNode(val int) *node {
	return &node{val: val}
}

/* 创建 treeNode 结构体 */
func newTreeNode(val int) *treeNode {
	return &treeNode{val: val}
}

/* 输出二叉树 */
func printTree(root *treeNode) {
	if root == nil {
		return
	}
	fmt.Println(root.val)
	printTree(root.left)
	printTree(root.right)
}

/* 函数 */
func function() int {
	// 执行某些操作...
	return 0
}

/* 常数阶 */
func spaceConstant(n int) {
	// 常量、变量、对象占用 O(1) 空间
	const a = 0
	b := 0
	nums := make([]int, 10000)
	ListNode := newNode(0)
	// 循环中的变量占用 O(1) 空间
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// 循环中的函数占用 O(1) 空间
	for i := 0; i < n; i++ {
		function()
	}
	fmt.Println(a, b, nums, c, ListNode)
}

/* 线性阶 */
func spaceLinear(n int) {
	// 长度为 n 的数组占用 O(n) 空间
	_ = make([]int, n)
	// 长度为 n 的列表占用 O(n) 空间
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// 长度为 n 的哈希表占用 O(n) 空间
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* 线性阶（递归实现） */
func spaceLinearRecur(n int) {
	fmt.Println("递归 n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* 平方阶 */
func spaceQuadratic(n int) {
	// 矩阵占用 O(n^2) 空间
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* 平方阶（递归实现） */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("递归 n = %d 中的 nums 长度 = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* 指数阶（建立满二叉树） */
func buildTree(n int) *treeNode {
	if n == 0 {
		return nil
	}
	root := newTreeNode(0)
	root.left = buildTree(n - 1)
	root.right = buildTree(n - 1)
	return root
}
