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
	/* Access top of the stack element */
	// In Go, recommended to use Slice as stack
	var stack []int

	/* Elements push onto stack */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("Stack stack = ")
	PrintSlice(stack)

	/* Return list for printing */
	peek := stack[len(stack)-1]
	fmt.Println("Stack top element peek =", peek)

	/* Element pop from stack */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Pop element pop = ", pop, ", after pop, stack = ")
	PrintSlice(stack)

	/* Get the length of the stack */
	size := len(stack)
	fmt.Println("Stack length size =", size)

	/* Check if empty */
	isEmpty := len(stack) == 0
	fmt.Println("Is stack empty =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Initialize stack using interface
	stack := newArrayStack()

	// Elements push onto stack
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Stack stack = ")
	PrintSlice(stack.toSlice())

	// Return list for printing
	peek := stack.peek()
	fmt.Println("Stack top element peek =", peek)

	// Element pop from stack
	pop := stack.pop()
	fmt.Print("Pop element pop = ", pop, ", after pop, stack = ")
	PrintSlice(stack.toSlice())

	// Get the length of the stack
	size := stack.size()
	fmt.Println("Stack length size =", size)

	// Check if empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is stack empty =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// Access top of the stack element
	stack := newLinkedListStack()
	// Elements push onto stack
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Stack stack = ")
	PrintList(stack.toList())

	// Return list for printing
	peek := stack.peek()
	fmt.Println("Stack top element peek =", peek)

	// Element pop from stack
	pop := stack.pop()
	fmt.Print("Pop element pop = ", pop, ", after pop, stack = ")
	PrintList(stack.toList())

	// Get the length of the stack
	size := stack.size()
	fmt.Println("Stack length size =", size)

	// Check if empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is stack empty =", isEmpty)
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
