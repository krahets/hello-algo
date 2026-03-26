// File: max_capacity_test.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import (
	"fmt"
	"testing"
)

func TestMaxCapacity(t *testing.T) {
	ht := []int{3, 8, 5, 2, 7, 7, 3, 4}

	// Жадный алгоритм
	res := maxCapacity(ht)
	fmt.Println("максимальныйвместимостьравно", res)
}
