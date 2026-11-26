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
	// Constant space
	spaceConstant(n)
	// Linear space
	spaceLinear(n)
	spaceLinearRecur(n)
	// Quadratic space
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// Exponential space
	root := buildTree(n)
	PrintTree(root)
}
