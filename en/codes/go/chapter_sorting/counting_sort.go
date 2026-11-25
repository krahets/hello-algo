// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* Counting sort */
// Simple implementation that cannot sort objects
func countingSortNaive(nums []int) {
	// 1. Find the largest array element m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrences of each number
	// counter[num] holds the number of occurrences of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Traverse counter and write each value back into nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* Counting sort */
// Full implementation that can sort objects and is stable
func countingSort(nums []int) {
	// 1. Find the largest array element m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Count the occurrences of each number
	// counter[num] holds the number of occurrences of num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Compute prefix sums in counter to locate the last position for each value
	// That is, counter[num]-1 is the last index of num in res
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. Traverse nums backward and place each element in the result array res
	// Initialize the result array res
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// Place num at its corresponding index
		res[counter[num]-1] = num
		// Decrement the prefix sum by 1 to find the next index for num
		counter[num]--
	}
	// Copy res back into the original array nums
	copy(nums, res)
}
