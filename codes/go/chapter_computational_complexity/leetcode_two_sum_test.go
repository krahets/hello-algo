// File: leetcode_two_sum.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_computational_complexity

import (
	"testing"
)

func TestTwoSum(t *testing.T) {
	// ======= Test Case =======
	nums := []int{2, 7, 11, 15}
	target := 9

	// ====== Driver Code ======
	// 方法一：暴力解法
	res := twoSumBruteForce(nums, target)
	t.Log("方法一 res =", res)
	// 方法二：哈希表
	res = twoSumHashTable(nums, target)
	t.Log("方法二 res =", res)
}
