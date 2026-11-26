// File: bucket_sort_test.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestBucketSort(t *testing.T) {
	// 입력은 [0, 1) 범위의 부동 소수점 수로 가정
	nums := []float64{0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37}
	bucketSort(nums)
	fmt.Println("버킷 정렬 후 nums = ", nums)
}
