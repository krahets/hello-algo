// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* Рекурсия */
func recur(n int) int {
	// Условие завершения
	if n == 1 {
		return 1
	}
	// Рекурсия: рекурсивный вызов
	res := recur(n - 1)
	// Возврат: вернуть результат
	return n + res
}

/* Имитация рекурсии итерацией */
func forLoopRecur(n int) int {
	// Использовать явный стек для имитации системного стека вызовов
	stack := list.New()
	res := 0
	// Рекурсия: рекурсивный вызов
	for i := n; i > 0; i-- {
		// Имитировать «рекурсию» с помощью операции помещения в стек
		stack.PushBack(i)
	}
	// Возврат: вернуть результат
	for stack.Len() != 0 {
		// Имитировать «возврат» с помощью операции извлечения из стека
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* Хвостовая рекурсия */
func tailRecur(n int, res int) int {
	// Условие завершения
	if n == 0 {
		return res
	}
	// Хвостовой рекурсивный вызов
	return tailRecur(n-1, res+n)
}

/* Последовательность Фибоначчи: рекурсия */
func fib(n int) int {
	// Условие завершения: f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// Рекурсивный вызов f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// Вернуть результат f(n)
	return res
}
