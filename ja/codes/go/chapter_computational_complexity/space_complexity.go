// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* 構造体 */
type node struct {
	val  int
	next *node
}

/* node 構造体を作成する */
func newNode(val int) *node {
	return &node{val: val}
}

/* 関数 */
func function() int {
	// いくつかの操作を実行...
	return 0
}

/* 定数階 */
func spaceConstant(n int) {
	// 定数、変数、オブジェクトは O(1) の空間を占める
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// ループ内の変数は O(1) の空間を占める
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// ループ内の関数は O(1) の空間を占める
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* 線形階 */
func spaceLinear(n int) {
	// 長さ n の配列は O(n) の空間を使用
	_ = make([]int, n)
	// 長さ n のリストは O(n) の空間を使用
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// 長さ n のハッシュテーブルは O(n) の空間を使用
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* 線形時間（再帰実装） */
func spaceLinearRecur(n int) {
	fmt.Println("再帰 n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* 二乗階 */
func spaceQuadratic(n int) {
	// 行列は O(n^2) の空間を使用する
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* 二次時間（再帰実装） */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("再帰 n = %d における nums の長さ = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* 指数時間（完全二分木の構築） */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
