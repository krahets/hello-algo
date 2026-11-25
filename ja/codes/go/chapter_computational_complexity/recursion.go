// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* 再帰 */
func recur(n int) int {
	// 終了条件
	if n == 1 {
		return 1
	}
	// 行き：再帰呼び出し
	res := recur(n - 1)
	// 帰り：結果を返す
	return n + res
}

/* 反復で再帰を模擬 */
func forLoopRecur(n int) int {
	// 明示的なスタックでシステムの呼び出しスタックを模擬
	stack := list.New()
	res := 0
	// 行き：再帰呼び出し
	for i := n; i > 0; i-- {
		// プッシュで「行き」を模擬
		stack.PushBack(i)
	}
	// 帰り：結果を返す
	for stack.Len() != 0 {
		// ポップで「帰り」を模擬
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* 末尾再帰 */
func tailRecur(n int, res int) int {
	// 終了条件
	if n == 0 {
		return res
	}
	// 末尾再帰呼び出し
	return tailRecur(n-1, res+n)
}

/* フィボナッチ数列：再帰 */
func fib(n int) int {
	// 終了条件 f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// 再帰呼び出し f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// 結果 f(n) を返す
	return res
}
