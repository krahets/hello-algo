// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* 재귀 */
func recur(n int) int {
	// 종료 조건
	if n == 1 {
		return 1
	}
	// 내려가기: 재귀 호출
	res := recur(n - 1)
	// 돌아오기: 결과 반환
	return n + res
}

/* 반복으로 재귀 구현 */
func forLoopRecur(n int) int {
	// 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
	stack := list.New()
	res := 0
	// 내려가기: 재귀 호출
	for i := n; i > 0; i-- {
		// 스택에 삽입하여 내려가는 과정을 모방한다
		stack.PushBack(i)
	}
	// 돌아오기: 결과 반환
	for stack.Len() != 0 {
		// 스택에서 꺼내어 돌아오는 과정을 모방한다
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* 꼬리 재귀 */
func tailRecur(n int, res int) int {
	// 종료 조건
	if n == 0 {
		return res
	}
	// 꼬리 재귀 호출
	return tailRecur(n-1, res+n)
}

/* 피보나치 수열: 재귀 */
func fib(n int) int {
	// 종료 조건 f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// 재귀 호출 f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// 결과 f(n)을 반환한다
	return res
}
