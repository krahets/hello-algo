// File: space_complexity_test.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestSpaceComplexity(t *testing.T) {
	n := 5
	// 定数階
	spaceConstant(n)
	// 線形階
	spaceLinear(n)
	spaceLinearRecur(n)
	// 二乗階
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// 指数オーダー
	root := buildTree(n)
	PrintTree(root)
}
