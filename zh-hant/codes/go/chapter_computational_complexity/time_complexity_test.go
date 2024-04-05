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
	fmt.Println("輸入資料大小 n =", n)

	count := constant(n)
	fmt.Println("常數階的操作數量 =", count)

	count = linear(n)
	fmt.Println("線性階的操作數量 =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("線性階（走訪陣列）的操作數量 =", count)

	count = quadratic(n)
	fmt.Println("平方階的操作數量 =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("平方階（泡沫排序）的操作數量 =", count)

	count = exponential(n)
	fmt.Println("指數階（迴圈實現）的操作數量 =", count)
	count = expRecur(n)
	fmt.Println("指數階（遞迴實現）的操作數量 =", count)

	count = logarithmic(n)
	fmt.Println("對數階（迴圈實現）的操作數量 =", count)
	count = logRecur(n)
	fmt.Println("對數階（遞迴實現）的操作數量 =", count)

	count = linearLogRecur(n)
	fmt.Println("線性對數階（遞迴實現）的操作數量 =", count)

	count = factorialRecur(n)
	fmt.Println("階乘階（遞迴實現）的操作數量 =", count)
}
