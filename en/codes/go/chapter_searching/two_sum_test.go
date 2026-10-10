// File: two_sum_test.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestTwoSum(t *testing.T) {
	// ======= Test Case =======
	nums := []int{2, 7, 11, 15}
	target := 13

	// ====== Driver Code ======
	// Method 1: Brute-force approach
	res := twoSumBruteForce(nums, target)
	fmt.Println("Method 1 res =", res)
	// Method 2: Hash table
	res = twoSumHashTable(nums, target)
	fmt.Println("Method 2 res =", res)
}
