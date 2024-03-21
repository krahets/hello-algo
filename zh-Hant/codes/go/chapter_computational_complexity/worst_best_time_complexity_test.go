// File: worst_best_time_complexity_test.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

func TestWorstBestTimeComplexity(t *testing.T) {
	for i := 0; i < 10; i++ {
		n := 100
		nums := randomNumbers(n)
		index := findOne(nums)
		fmt.Println("\n数组 [ 1, 2, ..., n ] 被打乱后 =", nums)
		fmt.Println("数字 1 的索引为", index)
	}
}
