// File: space_complexity.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"strconv"

	. "github.com/krahets/hello-algo/pkg"
)

/* 구조체 */
type node struct {
	val  int
	next *node
}

/* node 구조체를 만든다  */
func newNode(val int) *node {
	return &node{val: val}
}

/* 함수 */
func function() int {
	// 어떤 연산을 수행한다...
	return 0
}

/* 상수 차수 */
func spaceConstant(n int) {
	// 상수, 변수, 객체가 O(1)의 공간을 차지한다
	const a = 0
	b := 0
	nums := make([]int, 10000)
	node := newNode(0)
	// 반복문 안의 변수가 O(1)의 공간을 차지한다
	var c int
	for i := 0; i < n; i++ {
		c = 0
	}
	// 반복문 안의 함수가 O(1)의 공간을 차지한다
	for i := 0; i < n; i++ {
		function()
	}
	b += 0
	c += 0
	nums[0] = 0
	node.val = 0
}

/* 선형 차수 */
func spaceLinear(n int) {
	// 길이 n인 배열이 O(n)의 공간을 차지한다
	_ = make([]int, n)
	// 길이 n인 리스트가 O(n)의 공간을 차지한다
	var nodes []*node
	for i := 0; i < n; i++ {
		nodes = append(nodes, newNode(i))
	}
	// 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
	m := make(map[int]string, n)
	for i := 0; i < n; i++ {
		m[i] = strconv.Itoa(i)
	}
}

/* 선형 차수(재귀 구현) */
func spaceLinearRecur(n int) {
	fmt.Println("재귀 호출 n =", n)
	if n == 1 {
		return
	}
	spaceLinearRecur(n - 1)
}

/* 이차 차수 */
func spaceQuadratic(n int) {
	// 행렬이 O(n^2)의 공간을 차지한다
	numMatrix := make([][]int, n)
	for i := 0; i < n; i++ {
		numMatrix[i] = make([]int, n)
	}
}

/* 이차 차수(재귀 구현) */
func spaceQuadraticRecur(n int) int {
	if n <= 0 {
		return 0
	}
	nums := make([]int, n)
	fmt.Printf("재귀 호출 n = %d에서 nums의 길이 = %d \n", n, len(nums))
	return spaceQuadraticRecur(n - 1)
}

/* 지수 차수(포화 이진 트리 생성) */
func buildTree(n int) *TreeNode {
	if n == 0 {
		return nil
	}
	root := NewTreeNode(0)
	root.Left = buildTree(n - 1)
	root.Right = buildTree(n - 1)
	return root
}
