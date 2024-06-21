// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* 遞迴 */
func recur(n int) int {
	// 終止條件
	if n == 1 {
		return 1
	}
	// 遞：遞迴呼叫
	res := recur(n - 1)
	// 迴：返回結果
	return n + res
}

/* 使用迭代模擬遞迴 */
func forLoopRecur(n int) int {
	// 使用一個顯式的堆疊來模擬系統呼叫堆疊
	stack := list.New()
	res := 0
	// 遞：遞迴呼叫
	for i := n; i > 0; i-- {
		// 透過“入堆疊操作”模擬“遞”
		stack.PushBack(i)
	}
	// 迴：返回結果
	for stack.Len() != 0 {
		// 透過“出堆疊操作”模擬“迴”
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* 尾遞迴 */
func tailRecur(n int, res int) int {
	// 終止條件
	if n == 0 {
		return res
	}
	// 尾遞迴呼叫
	return tailRecur(n-1, res+n)
}

/* 費波那契數列：遞迴 */
func fib(n int) int {
	// 終止條件 f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// 遞迴呼叫 f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// 返回結果 f(n)
	return res
}
