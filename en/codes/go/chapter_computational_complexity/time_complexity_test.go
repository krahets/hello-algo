// File: time_complexity_test.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

import (
	"fmt"
	"testing"
)

func TestTimeComplexity(t *testing.T) {
	n := 8
	fmt.Println("Input data size n =", n)

	count := constant(n)
	fmt.Println("Constant complexity operation count =", count)

	count = linear(n)
	fmt.Println("Linear complexity operation count =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Linear complexity (traversing an array) operation count =", count)

	count = quadratic(n)
	fmt.Println("Quadratic complexity operation count =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Quadratic complexity (bubble sort) operation count =", count)

	count = exponential(n)
	fmt.Println("Exponential complexity (loop implementation) operation count =", count)
	count = expRecur(n)
	fmt.Println("Exponential complexity (recursive implementation) operation count =", count)

	count = logarithmic(n)
	fmt.Println("Logarithmic complexity (loop implementation) operation count =", count)
	count = logRecur(n)
	fmt.Println("Logarithmic complexity (recursive implementation) operation count =", count)

	count = linearLogRecur(n)
	fmt.Println("Linear logarithmic complexity (recursive implementation) operation count =", count)

	count = factorialRecur(n)
	fmt.Println("Factorial complexity (recursive implementation) operation count =", count)
}
