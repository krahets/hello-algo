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
	fmt.Println("入力データの大きさ n =", n)

	count := constant(n)
	fmt.Println("定数オーダーの操作回数 =", count)

	count = linear(n)
	fmt.Println("線形オーダーの操作回数 =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("線形オーダー（配列の走査）の操作回数 =", count)

	count = quadratic(n)
	fmt.Println("二次オーダーの操作回数 =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("二次オーダー（バブルソート）の操作回数 =", count)

	count = exponential(n)
	fmt.Println("指数オーダー（ループによる実装）の操作回数 =", count)
	count = expRecur(n)
	fmt.Println("指数オーダー（再帰による実装）の操作回数 =", count)

	count = logarithmic(n)
	fmt.Println("対数オーダー（ループによる実装）の操作回数 =", count)
	count = logRecur(n)
	fmt.Println("対数オーダー（再帰による実装）の操作回数 =", count)

	count = linearLogRecur(n)
	fmt.Println("線形対数オーダー（再帰による実装）の操作回数 =", count)

	count = factorialRecur(n)
	fmt.Println("階乗オーダー（再帰による実装）の操作回数 =", count)
}
