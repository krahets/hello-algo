// File: complexity_exercises_test.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

import "testing"

func TestComplexityExercises(t *testing.T) {
	if sumIter(1) != 1 || sumRecur(1) != 1 {
		t.Fatal("sum functions failed for n = 1")
	}
	if sumIter(4) != 10 || sumRecur(4) != 10 {
		t.Fatal("sum functions failed for n = 4")
	}
	if linearLoop(4) != 6 || quadraticLoop(4) != 20 {
		t.Fatal("complexity loops returned an unexpected value")
	}
	if logarithmicLoop(4) != 1 || logarithmicLoop(5) != 1 {
		t.Fatal("logarithmic loop returned an unexpected value")
	}
}
