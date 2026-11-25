// File: recursion.go
// Created Time: 2023-08-28
// Author: Reanon (793584285@qq.com)

package chapter_computational_complexity

import "container/list"

/* Рекурсия */
func recur(n int) int {
	// Условие остановки
	if n == 1 {
		return 1
	}
	// Спуск: рекурсивный вызов
	res := recur(n - 1)
	// Возврат: передача результата
	return n + res
}

/* Моделирование рекурсии с помощью итерации */
func forLoopRecur(n int) int {
	// Смоделировать стек вызовов с помощью явного стека
	stack := list.New()
	res := 0
	// Спуск: рекурсивный вызов
	for i := n; i > 0; i-- {
		// Добавление в стек моделирует спуск
		stack.PushBack(i)
	}
	// Возврат: передача результата
	for stack.Len() != 0 {
		// Извлечение из стека моделирует возврат
		res += stack.Back().Value.(int)
		stack.Remove(stack.Back())
	}
	// res = 1+2+3+...+n
	return res
}

/* Хвостовая рекурсия */
func tailRecur(n int, res int) int {
	// Условие остановки
	if n == 0 {
		return res
	}
	// Хвостовой рекурсивный вызов
	return tailRecur(n-1, res+n)
}

/* Числа Фибоначчи: рекурсия */
func fib(n int) int {
	// Базовые случаи: f(1) = 0, f(2) = 1
	if n == 1 || n == 2 {
		return n - 1
	}
	// Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
	res := fib(n-1) + fib(n-2)
	// Вернуть результат f(n)
	return res
}
