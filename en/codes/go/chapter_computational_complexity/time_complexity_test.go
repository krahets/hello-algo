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
	fmt.Println("Number of constant-order operations =", count)

	count = linear(n)
	fmt.Println("Number of linear-order operations =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Number of linear-order (array traversal) operations =", count)

	count = quadratic(n)
	fmt.Println("Number of quadratic-order operations =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Number of quadratic-order (bubble sort) operations =", count)

	count = exponential(n)
	fmt.Println("Number of exponential-order (loop implementation) operations =", count)
	count = expRecur(n)
	fmt.Println("Number of exponential-order (recursive implementation) operations =", count)

	count = logarithmic(n)
	fmt.Println("Number of logarithmic-order (loop implementation) operations =", count)
	count = logRecur(n)
	fmt.Println("Number of logarithmic-order (recursive implementation) operations =", count)

	count = linearLogRecur(n)
	fmt.Println("Number of linearithmic-order (recursive implementation) operations =", count)

	count = factorialRecur(n)
	fmt.Println("Number of factorial-order (recursive implementation) operations =", count)
}
