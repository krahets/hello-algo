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
	// In Go, a slice is the recommended way to implement a stack
	var stack []int

	/* Push elements onto the stack */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("Stack stack = ")
	PrintSlice(stack)

	/* Access the top element */
	peek := stack[len(stack)-1]
	fmt.Println("Top element peek =", peek)

	/* Pop an element from the stack */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Popped element pop = ", pop, ", after popping, stack = ")
	PrintSlice(stack)

	/* Get the stack size */
	size := len(stack)
	fmt.Println("Stack size =", size)

	/* Check whether it is empty */
	isEmpty := len(stack) == 0
	fmt.Println("Is the stack empty =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Initialize the stack for use through its stack operations
	stack := newArrayStack()

	// Push elements onto the stack
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Stack stack = ")
	PrintSlice(stack.toSlice())

	// Access the top element
	peek := stack.peek()
	fmt.Println("Top element peek =", peek)

	// Pop an element from the stack
	pop := stack.pop()
	fmt.Print("Popped element pop = ", pop, ", after popping, stack = ")
	PrintSlice(stack.toSlice())

	// Get the stack size
	size := stack.size()
	fmt.Println("Stack size =", size)

	// Check whether it is empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is the stack empty =", isEmpty)
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
	fmt.Print("Stack stack = ")
	PrintList(stack.toList())

	// Access the top element
	peek := stack.peek()
	fmt.Println("Top element peek =", peek)

	// Pop an element from the stack
	pop := stack.pop()
	fmt.Print("Popped element pop = ", pop, ", after popping, stack = ")
	PrintList(stack.toList())

	// Get the stack size
	size := stack.size()
	fmt.Println("Stack size =", size)

	// Check whether it is empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is the stack empty =", isEmpty)
}

// BenchmarkArrayStack: 8 ns/op on a Mac M1 Pro
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

// BenchmarkLinkedListStack: 65.02 ns/op on a Mac M1 Pro
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
