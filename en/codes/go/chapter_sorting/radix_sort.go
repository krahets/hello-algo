// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* Get digit k of num, where exp = 10^(k-1) */
func digit(num, exp int) int {
	// Passing exp instead of k avoids repeating the costly exponentiation here
	return (num / exp) % 10
}

/* Counting sort by digit k of each element in nums */
func countingSortDigit(nums []int, exp int) {
	// Decimal digits range from 0 to 9, so the bucket array needs 10 entries
	counter := make([]int, 10)
	n := len(nums)
	// Count the occurrences of digits 0 through 9
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // Let d be digit k of nums[i]
		counter[d]++             // Count this occurrence of digit d
	}
	// Compute prefix sums to convert counts into array positions
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// Traverse backward and use the bucket counts to place each element in res
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // Get the array index j for d
		res[j] = nums[i]    // Place the current element at index j
		counter[d]--        // Decrement the count for d by 1
	}
	// Copy the result back into nums
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* Radix sort */
func radixSort(nums []int) {
	// Find the largest element to determine the maximum number of digits
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// Work from the least significant digit to the most significant
	for exp := 1; max >= exp; exp *= 10 {
		// Apply counting sort to the array elements by digit k
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// Here exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
