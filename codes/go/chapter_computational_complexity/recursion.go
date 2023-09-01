// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

/* 递归 */
func recur(n int) int {
	// 终止条件
	if n == 1 {
		return 1
	}
	// 递：递归调用
	res := recur(n - 1)
	// 归：返回结果
	return n + res
}

/* 尾递归 */
func tailRecur(n int, res int) int {
	// 终止条件
	if n == 0 {
		return res
	}
	// 尾递归调用
	return tailRecur(n-1, res+n)
}

/* 斐波那契数列：递归 */
func fib(n int) int {
	// 终止条件 f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// 递归调用 f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// 返回结果 f(n)
	return res
}
