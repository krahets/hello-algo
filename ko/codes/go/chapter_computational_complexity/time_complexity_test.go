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
	fmt.Println("입력 데이터 크기 n =", n)

	count := constant(n)
	fmt.Println("상수 차수의 연산 횟수 =", count)

	count = linear(n)
	fmt.Println("선형 차수의 연산 횟수 =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("선형 차수(배열 순회)의 연산 횟수 =", count)

	count = quadratic(n)
	fmt.Println("제곱 차수의 연산 횟수 =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("제곱 차수(버블 정렬)의 연산 횟수 =", count)

	count = exponential(n)
	fmt.Println("지수 차수(반복문 구현)의 연산 횟수 =", count)
	count = expRecur(n)
	fmt.Println("지수 차수(재귀 구현)의 연산 횟수 =", count)

	count = logarithmic(n)
	fmt.Println("로그 차수(반복문 구현)의 연산 횟수 =", count)
	count = logRecur(n)
	fmt.Println("로그 차수(재귀 구현)의 연산 횟수 =", count)

	count = linearLogRecur(n)
	fmt.Println("선형 로그 차수(재귀 구현)의 연산 횟수 =", count)

	count = factorialRecur(n)
	fmt.Println("팩토리얼 차수(재귀 구현)의 연산 횟수 =", count)
}
