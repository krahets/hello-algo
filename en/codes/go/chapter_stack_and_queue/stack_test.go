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
	/* Initialize stack */
	// In Go, it is recommended to use Slice as a stack
	var stack []int

	/* Element push */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("Stack stack =")
	PrintSlice(stack)

	/* Access stack top element */
	peek := stack[len(stack)-1]
	fmt.Println("Stack top element peek =", peek)

	/* Element pop */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("Pop element pop = ", pop, ", after popping from the stack = ")
	PrintSlice(stack)

	/* Get the length of the stack */
	size := len(stack)
	fmt.Println("Stack length size =", size)

	/* Determine if it's empty */
	isEmpty := len(stack) == 0
	fmt.Println("Is the stack empty =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// Initialize the stack, using an interface to hold
	stack := newArrayStack()

	// Element push
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Stack stack =")
	PrintSlice(stack.toSlice())

	// Access stack top element
	peek := stack.peek()
	fmt.Println("Stack top element peek =", peek)

	// Element pop
	pop := stack.pop()
	fmt.Print("Pop element pop = ", pop, ", after popping from the stack = ")
	PrintSlice(stack.toSlice())

	// Get the length of the stack
	size := stack.size()
	fmt.Println("Stack length size =", size)

	// Determine if it's empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is the stack empty =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// Initialize stack
	stack := newLinkedListStack()
	// Element push
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("Stack stack =")
	PrintList(stack.toList())

	// Access stack top element
	peek := stack.peek()
	fmt.Println("Stack top element peek =", peek)

	// Element pop
	pop := stack.pop()
	fmt.Print("Pop element pop = ", pop, ", after popping from the stack = ")
	PrintList(stack.toList())

	// Get the length of the stack
	size := stack.size()
	fmt.Println("Stack length size =", size)

	// Determine if it's empty
	isEmpty := stack.isEmpty()
	fmt.Println("Is the stack empty =", isEmpty)
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
