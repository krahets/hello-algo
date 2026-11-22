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
	/* スタックを初期化する */
	// Go では Slice をスタックとして使うことを推奨する
	var stack []int

	/* 要素をプッシュする */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack)

	/* スタックの先頭要素にアクセスする */
	peek := stack[len(stack)-1]
	fmt.Println("スタックの先頭要素 peek =", peek)

	/* 要素をポップする */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("ポップした要素 pop = ", pop, "、ポップ後 stack = ")
	PrintSlice(stack)

	/* スタックの長さを取得する */
	size := len(stack)
	fmt.Println("スタックの長さ size =", size)

	/* 空かどうかを判定する */
	isEmpty := len(stack) == 0
	fmt.Println("スタックは空か =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// スタックを初期化し、インターフェースで受け取る
	stack := newArrayStack()

	// 要素をプッシュする
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack.toSlice())

	// スタックの先頭要素にアクセスする
	peek := stack.peek()
	fmt.Println("スタックの先頭要素 peek =", peek)

	// 要素をポップする
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, ", ポップ後 stack = ")
	PrintSlice(stack.toSlice())

	// スタックの長さを取得する
	size := stack.size()
	fmt.Println("スタックの長さ size =", size)

	// 空かどうかを判定する
	isEmpty := stack.isEmpty()
	fmt.Println("スタックは空か =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// スタックを初期化する
	stack := newLinkedListStack()
	// 要素をプッシュする
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintList(stack.toList())

	// スタックの先頭要素にアクセスする
	peek := stack.peek()
	fmt.Println("スタックの先頭要素 peek =", peek)

	// 要素をポップする
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, ", ポップ後 stack = ")
	PrintList(stack.toList())

	// スタックの長さを取得する
	size := stack.size()
	fmt.Println("スタックの長さ size =", size)

	// 空かどうかを判定する
	isEmpty := stack.isEmpty()
	fmt.Println("スタックは空か =", isEmpty)
}

// Mac M1 Pro での BenchmarkArrayStack は 8 ns/op
func BenchmarkArrayStack(b *testing.B) {
	stack := newArrayStack()
	// ループには b.N を使う
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}

// Mac M1 Pro での BenchmarkLinkedListStack は 65.02 ns/op
func BenchmarkLinkedListStack(b *testing.B) {
	stack := newLinkedListStack()
	// ループには b.N を使う
	for i := 0; i < b.N; i++ {
		stack.push(777)
	}
	for i := 0; i < b.N; i++ {
		stack.pop()
	}
}
