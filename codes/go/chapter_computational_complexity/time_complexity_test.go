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
	fmt.Println("输入数据大小 n =", n)

	count := constant(n)
	fmt.Println("常数阶的操作数量 =", count)

	count = linear(n)
	fmt.Println("线性阶的操作数量 =", count)
	count = arrayTraversal(make([]int, n))
	fmt.Println("线性阶（遍历数组）的操作数量 =", count)

	count = quadratic(n)
	fmt.Println("平方阶的操作数量 =", count)
	nums := make([]int, n)
	for i := 0; i < n; i++ {
		nums[i] = n - i
	}
	count = bubbleSort(nums)
	fmt.Println("平方阶（冒泡排序）的操作数量 =", count)

	count = exponential(n)
	fmt.Println("指数阶（循环实现）的操作数量 =", count)
	count = expRecur(n)
	fmt.Println("指数阶（递归实现）的操作数量 =", count)

	count = logarithmic(n)
	fmt.Println("对数阶（循环实现）的操作数量 =", count)
	count = logRecur(n)
	fmt.Println("对数阶（递归实现）的操作数量 =", count)

	count = linearLogRecur(n)
	fmt.Println("线性对数阶（递归实现）的操作数量 =", count)

	count = factorialRecur(n)
	fmt.Println("阶乘阶（递归实现）的操作数量 =", count)
}
