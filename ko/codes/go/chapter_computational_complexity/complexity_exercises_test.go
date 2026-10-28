// File: complexity_exercises_test.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_computational_complexity

import "testing"

func TestComplexityExercises(t *testing.T) {
	if sumIter(1) != 1 || sumRecur(1) != 1 {
		t.Fatal("n = 1에서 합을 구하는 함수의 검증에 실패했다")
	}
	if sumIter(4) != 10 || sumRecur(4) != 10 {
		t.Fatal("n = 4에서 합을 구하는 함수의 검증에 실패했다")
	}
	if linearLoop(4) != 6 || quadraticLoop(4) != 20 {
		t.Fatal("복잡도 예제의 반복문이 예상과 다른 값을 반환했다")
	}
	if logarithmicLoop(4) != 1 || logarithmicLoop(5) != 1 {
		t.Fatal("로그 차수 반복문이 예상과 다른 값을 반환했다")
	}
}
