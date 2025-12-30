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
	// Constant order
	spaceConstant(n)
	// Linear order
	spaceLinear(n)
	spaceLinearRecur(n)
	// Exponential order
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// Exponential order
	root := buildTree(n)
	PrintTree(root)
}
