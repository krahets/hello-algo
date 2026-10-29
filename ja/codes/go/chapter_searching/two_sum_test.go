// File: two_sum_test.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestTwoSum(t *testing.T) {
	// ======= テストケース =======
	nums := []int{2, 7, 11, 15}
	target := 13

	// ====== 実行用コード ======
	// 方法 1：総当たり法
	res := twoSumBruteForce(nums, target)
	fmt.Println("方法 1 res =", res)
	// 方法 2：ハッシュテーブル
	res = twoSumHashTable(nums, target)
	fmt.Println("方法 2 res =", res)
}
