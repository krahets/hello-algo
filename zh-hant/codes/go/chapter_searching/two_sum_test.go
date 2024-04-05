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
	// 方法一：暴力解法
	res := twoSumBruteForce(nums, target)
	fmt.Println("方法一 res =", res)
	// 方法二：雜湊表
	res = twoSumHashTable(nums, target)
	fmt.Println("方法二 res =", res)
}
