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

	// ====== Основной код ======
	// Метод 1: решение полным перебором
	res := twoSumBruteForce(nums, target)
	fmt.Println("Результат метода 1 res =", res)
	// Способ 2: хеш-таблица
	res = twoSumHashTable(nums, target)
	fmt.Println("Результат метода 2 res =", res)
}
