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
	/* Initialize the stack */
	// In Go, a slice is the recommended choice for a stack
	var stack []int

	/* Push elements onto the stack */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("stack = ")
	PrintSlice(stack)

	/* Peek at the top element */
	peek := stack[len(stack)-1]
	fmt.Println("Top element (peek) =", peek)

	/* Pop the top element */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Popped element (pop) = ", pop, ", stack after the pop = ")
	PrintSlice(stack)

	/* Get the stack size */
	size := len(stack)
	fmt.Println("Stack size =", size)

	/* Check whether the stack is empty */
	isEmpty := len(stack) == 0
	fmt.Println("Stack is empty =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Initialize the stack
	stack := newArrayStack()

	// Push elements onto the stack
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("stack = ")
	PrintSlice(stack.toSlice())

	// Peek at the top element
	peek := stack.peek()
	fmt.Println("Top element (peek) =", peek)

	// Pop the top element
	pop := stack.pop()
	fmt.Print("Popped element (pop) = ", pop, ", stack after the pop = ")
	PrintSlice(stack.toSlice())

	// Get the stack size
	size := stack.size()
	fmt.Println("Stack size =", size)

	// Check whether the stack is empty
	isEmpty := stack.isEmpty()
	fmt.Println("Stack is empty =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// Initialize the stack
	stack := newLinkedListStack()
	// Push elements onto the stack
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("stack = ")
	PrintList(stack.toList())

	// Peek at the top element
	peek := stack.peek()
	fmt.Println("Top element (peek) =", peek)

	// Pop the top element
	pop := stack.pop()
	fmt.Print("Popped element (pop) = ", pop, ", stack after the pop = ")
	PrintList(stack.toList())

	// Get the stack size
	size := stack.size()
	fmt.Println("Stack size =", size)

	// Check whether the stack is empty
	isEmpty := stack.isEmpty()
	fmt.Println("Stack is empty =", isEmpty)
}

// BenchmarkArrayStack took 8 ns/op on a Mac with an M1 Pro
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// Use b.N as the iteration count
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// BenchmarkLinkedListStack took 65.02 ns/op on a Mac with an M1 Pro
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// Use b.N as the iteration count
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
