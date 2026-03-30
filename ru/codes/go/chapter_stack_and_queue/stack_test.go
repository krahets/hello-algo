// File: stack_test.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestStack(t *testing.T) {
	/* Инициализация стека */
	// В Go рекомендуется использовать Slice как стек
	var stack []int

	/* Помещение элемента в стек */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("Стек stack = ")
	PrintSlice(stack)

	/* Доступ к верхнему элементу стека */
	peek := stack[len(stack)-1]
	fmt.Println("Верхний элемент peek =", peek)

	/* Извлечение элемента из стека */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Извлеченный элемент pop = ", pop, ", stack после извлечения = ")
	PrintSlice(stack)

	/* Получение длины стека */
	size := len(stack)
	fmt.Println("Длина стека size =", size)

	/* Проверка на пустоту */
	isEmpty := len(stack) == 0
	fmt.Println("Пуст ли стек =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Инициализировать стек, используя интерфейс
	stack := newArrayStack()

	// Помещение элемента в стек
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Стек stack = ")
	PrintSlice(stack.toSlice())

	// Доступ к верхнему элементу стека
	peek := stack.peek()
	fmt.Println("Верхний элемент peek =", peek)

	// Извлечение элемента из стека
	pop := stack.pop()
	fmt.Print("Извлеченный элемент pop = ", pop, ", stack после извлечения = ")
	PrintSlice(stack.toSlice())

	// Получение длины стека
	size := stack.size()
	fmt.Println("Длина стека size =", size)

	// Проверка на пустоту
	isEmpty := stack.isEmpty()
	fmt.Println("Пуст ли стек =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// Инициализация стека
	stack := newLinkedListStack()
	// Помещение элемента в стек
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Стек stack = ")
	PrintList(stack.toList())

	// Доступ к верхнему элементу стека
	peek := stack.peek()
	fmt.Println("Верхний элемент peek =", peek)

	// Извлечение элемента из стека
	pop := stack.pop()
	fmt.Print("Извлеченный элемент pop = ", pop, ", stack после извлечения = ")
	PrintList(stack.toList())

	// Получение длины стека
	size := stack.size()
	fmt.Println("Длина стека size =", size)

	// Проверка на пустоту
	isEmpty := stack.isEmpty()
	fmt.Println("Пуст ли стек =", isEmpty)
}

// BenchmarkArrayStack 8 ns/op in Mac M1 Pro
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// BenchmarkLinkedListStack 65.02 ns/op in Mac M1 Pro
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// use b.N for looping
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
