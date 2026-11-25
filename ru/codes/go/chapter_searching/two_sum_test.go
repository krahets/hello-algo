// File: two_sum_test.go
// Created Time: 2022-11-25
// Author: reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestTwoSum(t *testing.T) {
	// ======= Тестовый пример =======
	nums := []int{2, 7, 11, 15}
	target := 13

	// ====== Пример использования ======
	// Способ 1: полный перебор
	res := twoSumBruteForce(nums, target)
	fmt.Println("Способ 1, res =", res)
	// Способ 2: хеш-таблица
	res = twoSumHashTable(nums, target)
	fmt.Println("Способ 2, res =", res)
}
