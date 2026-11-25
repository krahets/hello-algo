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
	/* Инициализировать стек */
	// В Go для реализации стека рекомендуется использовать срез
	var stack []int

	/* Поместить элементы в стек */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("Стек stack = ")
	PrintSlice(stack)

	/* Посмотреть элемент на вершине стека */
	peek := stack[len(stack)-1]
	fmt.Println("Элемент на вершине стека peek =", peek)

	/* Снять элемент со стека */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Снятый элемент pop = ", pop, ", после снятия stack = ")
	PrintSlice(stack)

	/* Получить размер стека */
	size := len(stack)
	fmt.Println("Размер стека size =", size)

	/* Проверить, пуст ли стек */
	isEmpty := len(stack) == 0
	fmt.Println("Стек пуст =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Инициализировать стек
	stack := newArrayStack()

	// Поместить элементы в стек
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Стек stack = ")
	PrintSlice(stack.toSlice())

	// Посмотреть элемент на вершине стека
	peek := stack.peek()
	fmt.Println("Элемент на вершине стека peek =", peek)

	// Снять элемент со стека
	pop := stack.pop()
	fmt.Print("Снятый элемент pop = ", pop, ", после снятия stack = ")
	PrintSlice(stack.toSlice())

	// Получить размер стека
	size := stack.size()
	fmt.Println("Размер стека size =", size)

	// Проверить, пуст ли стек
	isEmpty := stack.isEmpty()
	fmt.Println("Стек пуст =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// Инициализировать стек
	stack := newLinkedListStack()
	// Поместить элементы в стек
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Стек stack = ")
	PrintList(stack.toList())

	// Посмотреть элемент на вершине стека
	peek := stack.peek()
	fmt.Println("Элемент на вершине стека peek =", peek)

	// Снять элемент со стека
	pop := stack.pop()
	fmt.Print("Снятый элемент pop = ", pop, ", после снятия stack = ")
	PrintList(stack.toList())

	// Получить размер стека
	size := stack.size()
	fmt.Println("Размер стека size =", size)

	// Проверить, пуст ли стек
	isEmpty := stack.isEmpty()
	fmt.Println("Стек пуст =", isEmpty)
}

// Результат BenchmarkArrayStack на Mac с M1 Pro — 8 ns/op
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// Число итераций цикла задаёт b.N
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// Результат BenchmarkLinkedListStack на Mac с M1 Pro — 65.02 ns/op
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// Число итераций цикла задаёт b.N
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
