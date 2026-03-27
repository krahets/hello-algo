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
	fmt.Println("Число операций константной сложности =", count)

	count = linear(n)
	fmt.Println("Число операций линейной сложности =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("Число операций линейной сложности (обход массива) =", count)

	count = quadratic(n)
	fmt.Println("Число операций квадратичной сложности =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("Число операций квадратичной сложности (пузырьковая сортировка) =", count)

	count = exponential(n)
	fmt.Println("Число операций экспоненциальной сложности (итеративная реализация) =", count)
	count = expRecur(n)
	fmt.Println("Число операций экспоненциальной сложности (рекурсивная реализация) =", count)

	count = logarithmic(n)
	fmt.Println("Число операций логарифмической сложности (итеративная реализация) =", count)
	count = logRecur(n)
	fmt.Println("Число операций логарифмической сложности (рекурсивная реализация) =", count)

	count = linearLogRecur(n)
	fmt.Println("Число операций линейно-логарифмической сложности (рекурсивная реализация) =", count)

	count = factorialRecur(n)
	fmt.Println("Число операций факториальной сложности (рекурсивная реализация) =", count)
}
