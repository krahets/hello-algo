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
	// 常數階
	spaceConstant(n)
	// 線性階
	spaceLinear(n)
	spaceLinearRecur(n)
	// 平方階
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// 指數階
	root := buildTree(n)
	PrintTree(root)
}
