// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* 結構體 */
type node struct {
	val  int
	next *node
}

/* 建立 node 結構體  */
func newNode(val int) *node {
	return &node{val: val}
}

/* 函式 */
func function() int {
	// 執行某些操作...
	return 0
}

/* 常數階 */
func spaceConstant(n int) {
	// 常數、變數、物件佔用 O(1) 空間
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// 迴圈中的變數佔用 O(1) 空間
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// 迴圈中的函式佔用 O(1) 空間
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* 線性階 */
func spaceLinear(n int) {
	// 長度為 n 的陣列佔用 O(n) 空間
	_ = make([]int, n)
	// 長度為 n 的串列佔用 O(n) 空間
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// 長度為 n 的雜湊表佔用 O(n) 空間
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* 線性階（遞迴實現） */
func spaceLinearRecur(n int) {
	fmt.Println("遞迴 n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* 平方階 */
func spaceQuadratic(n int) {
	// 矩陣佔用 O(n^2) 空間
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* 平方階（遞迴實現） */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("遞迴 n = %d 中的 nums 長度 = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* 指數階（建立滿二元樹） */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
