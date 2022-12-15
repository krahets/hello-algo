// File: space_complexity_test.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"testing"
)

func TestSpaceComplexity(t *testing.T) {
	/* ======= Test Case ======= */
	n := 5

	/* ====== Driver Code ====== */
	// 常数阶
	spaceConstant(n)

	// 线性阶
	spaceLinear(n)
	spaceLinearRecur(n)

	// 平方阶
	spaceQuadratic(n)
	spaceQuadraticRecur(n)

	// 指数阶
	root := buildTree(n)
	printTree(root)
}
