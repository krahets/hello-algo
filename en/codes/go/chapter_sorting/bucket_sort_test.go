// File: bucket_sort_test.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import (
	"fmt"
	"testing"
)

func TestBucketSort(t *testing.T) {
	// Assume input data is floating point, interval [0, 1)
	nums := []float64{0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37}
	bucketSort(nums)
	fmt.Println("After bucket sort completes, nums = ", nums)
}
