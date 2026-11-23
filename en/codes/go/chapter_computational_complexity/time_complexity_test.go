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
	fmt.Println("Operation count for constant complexity =", count)

	count = linear(n)
	fmt.Println("Operation count for linear complexity =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Operation count for linear complexity (array traversal) =", count)

	count = quadratic(n)
	fmt.Println("Operation count for quadratic complexity =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Operation count for quadratic complexity (bubble sort) =", count)

	count = exponential(n)
	fmt.Println("Operation count for exponential complexity (iterative implementation) =", count)
	count = expRecur(n)
	fmt.Println("Operation count for exponential complexity (recursive implementation) =", count)

	count = logarithmic(n)
	fmt.Println("Operation count for logarithmic complexity (iterative implementation) =", count)
	count = logRecur(n)
	fmt.Println("Operation count for logarithmic complexity (recursive implementation) =", count)

	count = linearLogRecur(n)
	fmt.Println("Operation count for linearithmic complexity (recursive implementation) =", count)

	count = factorialRecur(n)
	fmt.Println("Operation count for factorial complexity (recursive implementation) =", count)
}
