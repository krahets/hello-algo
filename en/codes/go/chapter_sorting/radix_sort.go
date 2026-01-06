// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* Get the k-th digit of element num, where exp = 10^(k-1) */
func digit(num, exp int) int {
	// Passing exp instead of k can avoid repeated expensive exponentiation here
	return (num / exp) % 10
}

/* Counting sort (based on nums k-th digit) */
func countingSortDigit(nums []int, exp int) {
	// Decimal digit range is 0~9, therefore need a bucket array of length 10
	counter := make([]int, 10)
	n := len(nums)
	// Count the occurrence of digits 0~9
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // Get the k-th digit of nums[i], noted as d
		counter[d]++             // Count the occurrence of digit d
	}
	// Calculate prefix sum, converting "occurrence count" into "array index"
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// Traverse in reverse, based on bucket statistics, place each element into res
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // Get the index j for d in the array
		res[j] = nums[i]    // Place the current element at index j
		counter[d]--        // Decrease the count of d by 1
	}
	// Use result to overwrite the original array nums
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* Radix sort */
func radixSort(nums []int) {
	// Get the maximum element of the array, used to determine the maximum number of digits
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// Traverse from the lowest to the highest digit
	for exp := 1; max >= exp; exp *= 10 {
		// Perform counting sort on the k-th digit of array elements
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// i.e., exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
