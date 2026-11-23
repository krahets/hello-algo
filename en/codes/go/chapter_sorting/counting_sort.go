// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* Counting sort */
// Simple implementation; cannot be used to sort objects
func countingSortNaive(nums []int) {
	// 1. Find the maximum array element m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrences of each number
	// counter[num] is the number of occurrences of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Traverse counter and fill the original array nums with the elements
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* Counting sort */
// Full implementation; stable and adaptable to sorting objects
func countingSort(nums []int) {
	// 1. Find the maximum array element m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrences of each number
	// counter[num] is the number of occurrences of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Compute prefix sums of counter to convert occurrence counts into end positions
	// That is, counter[num]-1 is the index of the last occurrence of num in res
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. Traverse nums in reverse and place each element in the result array res
	// Initialize array res to store the result
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// Place num at the corresponding index
		res[counter[num]-1] = num
		// Decrement the prefix sum by 1 to determine where to place the next occurrence of num
		counter[num]--
	}
	// Overwrite the original array nums with the result array res
	copy(nums, res)
}
