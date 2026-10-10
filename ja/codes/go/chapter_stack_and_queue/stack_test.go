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
	/* スタックを初期化 */
	// Go では、Slice をスタックとして使うことが推奨される
	var stack []int

	/* 要素をプッシュ */
	stack = append(stack, 1)
	stack = append(stack, 3)
	stack = append(stack, 2)
	stack = append(stack, 5)
	stack = append(stack, 4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack)

	/* スタックトップの要素にアクセス */
	peek := stack[len(stack)-1]
	fmt.Println("スタックトップ要素 peek =", peek)

	/* 要素をポップ */
	pop := stack[len(stack)-1]
	stack = stack[:len(stack)-1]
	fmt.Print("ポップした要素 pop = ", pop, "，ポップ後 stack = ")
	PrintSlice(stack)

	/* スタックの長さを取得 */
	size := len(stack)
	fmt.Println("スタックの長さ size =", size)

	/* 空かどうかを判定 */
	isEmpty := len(stack) == 0
	fmt.Println("スタックが空かどうか =", isEmpty)
}

func TestArrayStack(t *testing.T) {
	// スタックを初期化し、インターフェース型で受ける
	stack := newArrayStack()

	// 要素をプッシュ
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintSlice(stack.toSlice())

	// スタックトップの要素にアクセス
	peek := stack.peek()
	fmt.Println("スタックトップ要素 peek =", peek)

	// 要素をポップ
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, ", ポップ後 stack = ")
	PrintSlice(stack.toSlice())

	// スタックの長さを取得
	size := stack.size()
	fmt.Println("スタックの長さ size =", size)

	// 空かどうかを判定
	isEmpty := stack.isEmpty()
	fmt.Println("スタックが空かどうか =", isEmpty)
}

func TestLinkedListStack(t *testing.T) {
	// スタックを初期化
	stack := newLinkedListStack()
	// 要素をプッシュ
	stack.push(1)
	stack.push(3)
	stack.push(2)
	stack.push(5)
	stack.push(4)
	fmt.Print("スタック stack = ")
	PrintList(stack.toList())

	// スタックトップの要素にアクセス
	peek := stack.peek()
	fmt.Println("スタックトップ要素 peek =", peek)

	// 要素をポップ
	pop := stack.pop()
	fmt.Print("ポップした要素 pop = ", pop, ", ポップ後 stack = ")
	PrintList(stack.toList())

	// スタックの長さを取得
	size := stack.size()
	fmt.Println("スタックの長さ size =", size)

	// 空かどうかを判定
	isEmpty := stack.isEmpty()
	fmt.Println("スタックが空かどうか =", isEmpty)
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
