// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* Bucket sort */
func bucketSort(nums []float64) {
	// Initialize k = floor(n/2) buckets, expecting about 2 elements per bucket for uniformly distributed input
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. Distribute the array elements among the buckets
	for _, num := range nums {
		// The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
		i := int(num * float64(k))
		// Add num to bucket i
		buckets[i] = append(buckets[i], num)
	}
	// 2. Sort each bucket
	for i := 0; i < k; i++ {
		// Use the standard slice-sorting function, or replace it with another sorting algorithm
		sort.Float64s(buckets[i])
	}
	// 3. Traverse the buckets to combine the results
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
