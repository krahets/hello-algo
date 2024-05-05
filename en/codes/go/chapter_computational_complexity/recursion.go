// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* Recursion */
func recur(n int) int {
	// Termination condition
	if n == 1 {
		return 1
	}
	// Recursive: recursive call
	res := recur(n - 1)
	// Return: return result
	return n + res
}

/* Simulate recursion with iteration */
func forLoopRecur(n int) int {
	// Use an explicit stack to simulate the system call stack
	stack := list.New()
	res := 0
	// Recursive: recursive call
	for i := n; i > 0; i-- {
		// Simulate "recursive" by "pushing onto the stack"
		stack.PushBack(i)
	}
	// Return: return result
	for stack.Len() != 0 {
		// Simulate "return" by "popping from the stack"
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* Tail recursion */
func tailRecur(n int, res int) int {
	// Termination condition
	if n == 0 {
		return res
	}
	// Tail recursive call
	return tailRecur(n-1, res+n)
}

/* Fibonacci sequence: Recursion */
func fib(n int) int {
	// Termination condition f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// Recursive call f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// Return result f(n)
	return res
}
