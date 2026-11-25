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
	fmt.Println("Input size n =", n)

	count := constant(n)
	fmt.Println("Constant operation count =", count)

	count = linear(n)
	fmt.Println("Linear operation count =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Linear operation count (array traversal) =", count)

	count = quadratic(n)
	fmt.Println("Quadratic operation count =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Quadratic operation count (bubble sort) =", count)

	count = exponential(n)
	fmt.Println("Exponential operation count (iterative) =", count)
	count = expRecur(n)
	fmt.Println("Exponential operation count (recursive) =", count)

	count = logarithmic(n)
	fmt.Println("Logarithmic operation count (iterative) =", count)
	count = logRecur(n)
	fmt.Println("Logarithmic operation count (recursive) =", count)

	count = linearLogRecur(n)
	fmt.Println("Linearithmic operation count (recursive) =", count)

	count = factorialRecur(n)
	fmt.Println("Factorial operation count (recursive) =", count)
}
