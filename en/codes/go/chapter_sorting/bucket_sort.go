// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* Bucket sort */
func bucketSort(nums []float64) {
	// Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. Distribute array elements into various buckets
	for _, num := range nums {
		// Input data range is [0, 1), use num * k to map to index range [0, k-1]
		i := int(num * float64(k))
		// Add num to bucket i
		buckets[i] = append(buckets[i], num)
	}
	// 2. Sort each bucket
	for i := 0; i < k; i++ {
		// Use built-in slice sorting function, can also be replaced with other sorting algorithms
		sort.Float64s(buckets[i])
	}
	// 3. Traverse buckets to merge results
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
