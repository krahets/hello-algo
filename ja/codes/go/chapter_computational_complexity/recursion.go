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
	// 往路：再帰呼び出し
	res := recur(n - 1)
	// 復路：結果を返す
	return n + res
}

/* 反復を使って再帰を再現する */
func forLoopRecur(n int) int {
	// 明示的なスタックを使って、システムの呼び出しスタックを再現する
	stack := list.New()
	res := 0
	// 往路：再帰呼び出し
	for i := n; i > 0; i-- {
		// 「プッシュ操作」で再帰の「往路」を再現する
		stack.PushBack(i)
	}
	// 復路：結果を返す
	for stack.Len() != 0 {
		// 「ポップ操作」で再帰の「復路」を再現する
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
