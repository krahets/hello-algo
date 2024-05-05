// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* Constant complexity */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* Linear complexity */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Linear complexity (traversing an array) */
func arrayTraversal(nums []int) int {
	count := 0
	// Loop count is proportional to the length of the array
	for range nums {
		count++
	}
	return count
}

/* Quadratic complexity */
func quadratic(n int) int {
	count := 0
	// Loop count is squared in relation to the data size n
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* Quadratic complexity (bubble sort) */
func bubbleSort(nums []int) int {
	count := 0 // Counter
	// Outer loop: unsorted range is [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Swap nums[j] and nums[j + 1]
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // Element swap includes 3 individual operations
			}
		}
	}
	return count
}

/* Exponential complexity (loop implementation)*/
func exponential(n int) int {
	count, base := 0, 1
	// Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* Exponential complexity (recursive implementation)*/
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* Logarithmic complexity (loop implementation)*/
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* Logarithmic complexity (recursive implementation)*/
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* Linear logarithmic complexity */
func linearLogRecur(n int) int {
	if n <= 1 {
		return 1
	}
	count := linearLogRecur(n/2) + linearLogRecur(n/2)
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Factorial complexity (recursive implementation) */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// From 1 split into n
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
