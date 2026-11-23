// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* Get the k-th digit of num, where exp = 10^(k-1) */
func digit(num, exp int) int {
	// Passing exp instead of k avoids repeatedly performing expensive exponentiation here
	return (num / exp) % 10
}

/* Counting sort (sort nums by the k-th digit) */
func countingSortDigit(nums []int, exp int) {
	// Decimal digits range from 0 to 9, so the bucket array needs length 10
	counter := make([]int, 10)
	n := len(nums)
	// Count the occurrences of each digit from 0 to 9
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // Get the k-th digit of nums[i] and store it in d
		counter[d]++             // Count the occurrences of digit d
	}
	// Compute prefix sums to convert occurrence counts into array positions
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// Traverse in reverse and place each element into res according to the bucket counts
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // Get the destination index j for digit d in the array
		res[j] = nums[i]    // Place the current element at index j
		counter[d]--        // Decrease the count for d by 1
	}
	// Overwrite the original array nums with the result
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* Radix sort */
func radixSort(nums []int) {
	// Get the largest array element to determine the maximum number of digits
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// Process digits from least significant to most significant
	for exp := 1; max >= exp; exp *= 10 {
		// Apply counting sort to the k-th digit of the array elements
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// That is, exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
