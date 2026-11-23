// File: complexity_exercises_test.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

import "testing"

func TestComplexityExercises(t *testing.T) {
	if sumIter(1) != 1 || sumRecur(1) != 1 {
		t.Fatal("n = 1 で総和関数の検証に失敗しました")
	}
	if sumIter(4) != 10 || sumRecur(4) != 10 {
		t.Fatal("n = 4 で総和関数の検証に失敗しました")
	}
	if linearLoop(4) != 6 || quadraticLoop(4) != 20 {
		t.Fatal("計算量のループが予期しない値を返しました")
	}
	if logarithmicLoop(4) != 1 || logarithmicLoop(5) != 1 {
		t.Fatal("対数オーダーのループが予期しない値を返しました")
	}
}
