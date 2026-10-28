// File: two_sum_test.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestTwoSum(t *testing.T) {
	// ======= 테스트 사례 =======
	nums := []int{2, 7, 11, 15}
	target := 13

	// ====== 실행 코드 ======
	// 방법 1: 완전 탐색 풀이
	res := twoSumBruteForce(nums, target)
	fmt.Println("방법 1 res =", res)
	// 방법 2: 해시 테이블
	res = twoSumHashTable(nums, target)
	fmt.Println("방법 2 res =", res)
}
