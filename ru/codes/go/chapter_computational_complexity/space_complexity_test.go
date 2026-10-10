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
	// Постоянная сложность
	spaceConstant(n)
	// Линейная сложность
	spaceLinear(n)
	spaceLinearRecur(n)
	// Квадратичная сложность
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// Экспоненциальная сложность
	root := buildTree(n)
	PrintTree(root)
}
