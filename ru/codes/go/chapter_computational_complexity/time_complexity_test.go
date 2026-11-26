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
	fmt.Println("Размер входных данных n =", n)

	count := constant(n)
	fmt.Println("Число операций при константной сложности =", count)

	count = linear(n)
	fmt.Println("Число операций при линейной сложности =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Число операций при линейной сложности (обход массива) =", count)

	count = quadratic(n)
	fmt.Println("Число операций при квадратичной сложности =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Число операций при квадратичной сложности (пузырьковая сортировка) =", count)

	count = exponential(n)
	fmt.Println("Число операций при экспоненциальной сложности (цикл) =", count)
	count = expRecur(n)
	fmt.Println("Число операций при экспоненциальной сложности (рекурсия) =", count)

	count = logarithmic(n)
	fmt.Println("Число операций при логарифмической сложности (цикл) =", count)
	count = logRecur(n)
	fmt.Println("Число операций при логарифмической сложности (рекурсия) =", count)

	count = linearLogRecur(n)
	fmt.Println("Число операций при линейно-логарифмической сложности (рекурсия) =", count)

	count = factorialRecur(n)
	fmt.Println("Число операций при факториальной сложности (рекурсия) =", count)
}
