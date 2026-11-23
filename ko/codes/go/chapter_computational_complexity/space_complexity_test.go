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
	// 상수 차수
	spaceConstant(n)
	// 선형 차수
	spaceLinear(n)
	spaceLinearRecur(n)
	// 제곱 차수
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// 지수 차수
	root := buildTree(n)
	PrintTree(root)
}
