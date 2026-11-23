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
	// Constant complexity
	spaceConstant(n)
	// Linear complexity
	spaceLinear(n)
	spaceLinearRecur(n)
	// Quadratic complexity
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// Exponential complexity
	root := buildTree(n)
	PrintTree(root)
}
