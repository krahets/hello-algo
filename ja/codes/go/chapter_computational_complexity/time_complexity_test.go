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
	fmt.Println("入力データサイズ n =", n)

	count := constant(n)
	fmt.Println("定数時間の操作回数 =", count)

	count = linear(n)
	fmt.Println("線形時間の操作回数 =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("線形時間（配列走査）の操作回数 =", count)

	count = quadratic(n)
	fmt.Println("二乗時間の操作回数 =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("二乗時間（バブルソート）の操作回数 =", count)

	count = exponential(n)
	fmt.Println("指数時間（ループ実装）の操作回数 =", count)
	count = expRecur(n)
	fmt.Println("指数時間（再帰実装）の操作回数 =", count)

	count = logarithmic(n)
	fmt.Println("対数時間（ループ実装）の操作回数 =", count)
	count = logRecur(n)
	fmt.Println("対数時間（再帰実装）の操作回数 =", count)

	count = linearLogRecur(n)
	fmt.Println("線形対数時間（再帰実装）の操作回数 =", count)

	count = factorialRecur(n)
	fmt.Println("階乗時間（再帰実装）の操作回数 =", count)
}
