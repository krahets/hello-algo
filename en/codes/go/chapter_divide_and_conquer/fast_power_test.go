// File: fast_power_test.go
// Created Time: 2026-08-18
// Author: Hello Algo Team

package chapter_divide_and_conquer

import "testing"

func TestFastPower(t *testing.T) {
	if fastPow(7, 0) != 1 || fastPow(3, 5) != 243 || fastPow(2, 6) != 64 {
		t.Fatal("fast power returned an unexpected value")
	}
}
