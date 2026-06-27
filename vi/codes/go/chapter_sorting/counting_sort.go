// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
func countingSortNaive(nums []int) {
	// 1. Count the maximum element m in the array
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrence of each number
	// counter[num] represents the occurrence of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Traverse counter, filling each element back into the original array nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
func countingSort(nums []int) {
	// 1. Count the maximum element m in the array
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrence of each number
	// counter[num] represents the occurrence of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
	// counter[num]-1 is the last index where num appears in res
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. Traverse nums in reverse order, placing each element into the result array res
	// Initialize the array res to record results
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// Place num at the corresponding index
		res[counter[num]-1] = num
		// Decrement the prefix sum by 1, getting the next index to place num
		counter[num]--
	}
	// Use result array res to overwrite the original array nums
	copy(nums, res)
}
